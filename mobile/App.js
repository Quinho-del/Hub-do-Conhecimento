import React, { useState, useEffect, useCallback } from 'react';
import {
  StyleSheet, Text, View, TextInput, TouchableOpacity,
  ActivityIndicator, ScrollView, SafeAreaView, StatusBar,
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { API_URL } from './src/config';

const Stack = createNativeStackNavigator();

async function api(path, options = {}) {
  const token = await AsyncStorage.getItem('jwtToken');
  const headers = {
    'Content-Type': 'application/json',
    ...(token ? { Authorization: `Bearer ${token}` } : {}),
    ...options.headers,
  };
  const res = await fetch(`${API_URL}${path}`, { ...options, headers });
  const data = await res.json().catch(() => ({}));
  if (!res.ok) {
    throw new Error(data.mensagem || data.erro || `Erro ${res.status}`);
  }
  return data;
}

function LoginScreen({ navigation, setToken }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState('');

  async function submit() {
    if (!email.trim() || !password.trim()) {
      setError('Preencha e-mail e senha.');
      return;
    }
    setBusy(true);
    setError('');
    try {
      const data = await api('/auth/login', {
        method: 'POST',
        body: JSON.stringify({ email: email.trim(), password: password.trim() }),
      });
      if (data.sucesso && data.token) {
        await AsyncStorage.setItem('jwtToken', data.token);
        setToken(data.token);
        navigation.replace('Home');
      } else {
        setError(data.mensagem || 'Falha no login.');
      }
    } catch (e) {
      setError(e.message);
    } finally {
      setBusy(false);
    }
  }

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#0f172a" />
      <View style={styles.header}>
        <Text style={styles.brand}>HC</Text>
        <Text style={styles.title}>Hub do Conhecimento</Text>
        <Text style={styles.subtitle}>Matemática com ritmo de prova</Text>
      </View>
      <View style={styles.form}>
        <Text style={styles.label}>Entrar</Text>
        <TextInput
          style={styles.input}
          placeholder="E-mail"
          placeholderTextColor="#94a3b8"
          autoCapitalize="none"
          keyboardType="email-address"
          value={email}
          onChangeText={setEmail}
        />
        <TextInput
          style={styles.input}
          placeholder="Senha"
          placeholderTextColor="#94a3b8"
          secureTextEntry
          value={password}
          onChangeText={setPassword}
        />
        {error ? <Text style={styles.error}>{error}</Text> : null}
        <TouchableOpacity style={styles.button} onPress={submit} disabled={busy}>
          {busy ? <ActivityIndicator color="#0f172a" /> : <Text style={styles.buttonText}>Entrar</Text>}
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

function HomeScreen({ navigation, setToken }) {
  const [questoes, setQuestoes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  const load = useCallback(async () => {
    setLoading(true);
    setError('');
    try {
      const data = await api('/busca');
      setQuestoes(Array.isArray(data) ? data : []);
    } catch (e) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => { load(); }, [load]);

  async function logout() {
    await AsyncStorage.removeItem('jwtToken');
    setToken('');
    navigation.replace('Login');
  }

  const topicos = questoes.reduce((acc, q) => {
    const t = q.topico || q.nome_t || 'Sem tópico';
    acc[t] = (acc[t] || 0) + 1;
    return acc;
  }, {});

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.topBar}>
        <Text style={styles.topTitle}>Hub do Conhecimento</Text>
        <TouchableOpacity onPress={logout}><Text style={styles.logout}>Sair</Text></TouchableOpacity>
      </View>

      {loading && (
        <View style={styles.center}>
          <ActivityIndicator size="large" color="#22c55e" />
          <Text style={styles.muted}>Carregando questões…</Text>
        </View>
      )}

      {error ? (
        <View style={styles.notice}>
          <Text style={styles.error}>{error}</Text>
          <TouchableOpacity style={styles.button} onPress={load}>
            <Text style={styles.buttonText}>Tentar novamente</Text>
          </TouchableOpacity>
        </View>
      ) : null}

      {!loading && !error && (
        <ScrollView contentContainerStyle={styles.scroll}>
          <Text style={styles.sectionTitle}>Visão geral</Text>
          <View style={styles.statsRow}>
            <View style={styles.statCard}>
              <Text style={styles.statValue}>{questoes.length}</Text>
              <Text style={styles.statLabel}>Questões</Text>
            </View>
            <View style={[styles.statCard, styles.statBlue]}>
              <Text style={styles.statValue}>{Object.keys(topicos).length}</Text>
              <Text style={styles.statLabel}>Tópicos</Text>
            </View>
          </View>

          <Text style={styles.sectionTitle}>Tópicos</Text>
          {Object.entries(topicos).map(([name, count]) => (
            <View key={name} style={styles.topicCard}>
              <Text style={styles.topicName}>{name}</Text>
              <Text style={styles.topicCount}>{count} questões</Text>
            </View>
          ))}

          <TouchableOpacity
            style={[styles.button, { marginTop: 24 }]}
            onPress={() => navigation.navigate('Questoes', { questoes })}
          >
            <Text style={styles.buttonText}>Abrir questões</Text>
          </TouchableOpacity>
        </ScrollView>
      )}
    </SafeAreaView>
  );
}

function QuestoesScreen({ route, navigation }) {
  const questoes = route.params?.questoes || [];
  const [index, setIndex] = useState(0);
  const [selected, setSelected] = useState('');
  const [resultado, setResultado] = useState(null);

  if (!questoes.length) {
    return (
      <View style={styles.center}>
        <Text>Nenhuma questão disponível.</Text>
      </View>
    );
  }

  const q = questoes[index];
  const enunciado = q.enunciado || q.enunciado_q || '';

  // Extrai alternativas A-E do enunciado
  const alternativas = [];
  const regex = /(?:^|\n)\s*\(?([A-E])\)?[).]\s*([\s\S]*?)(?=(?:\n\s*\(?[A-E]\)?[).]\s*)|$)/gi;
  let match;
  while ((match = regex.exec(enunciado)) !== null) {
    alternativas.push({ letra: match[1].toUpperCase(), texto: match[2].trim() });
  }
  const enunciadoLimpo = enunciado.split(/(?:^|\n)\s*\(?A\)?[).]\s*/i)[0];

  async function verificar() {
    if (!selected) return;
    try {
      const id = q.id_questao || q.idq || q.id;
      const data = await api(`/busca/resposta/${id}`);
      const correta = String(data?.resposta_correta || '').toUpperCase().trim();
      const ok = correta === selected.toUpperCase() || correta.includes(selected.toUpperCase());
      setResultado({
        ok,
        correta,
        explicacao: data?.explicacao || data?.comentario_prof_r || '',
      });
    } catch (e) {
      setResultado({ ok: null, correta: '—', explicacao: e.message });
    }
  }

  function proxima() {
    setSelected('');
    setResultado(null);
    if (index < questoes.length - 1) setIndex(index + 1);
    else navigation.navigate('Home');
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.topBar}>
        <Text style={styles.topTitle}>
          Questão {index + 1}/{questoes.length}
        </Text>
        <Text style={styles.logout}>{q.topico || q.nome_t || ''}</Text>
      </View>
      <ScrollView contentContainerStyle={styles.scroll}>
        <Text style={styles.enunciado}>{enunciadoLimpo}</Text>
        {alternativas.map((alt) => (
          <TouchableOpacity
            key={alt.letra}
            style={[styles.option, selected === alt.letra && styles.optionSelected]}
            onPress={() => { setSelected(alt.letra); setResultado(null); }}
          >
            <Text style={styles.optionLetter}>{alt.letra}</Text>
            <Text style={styles.optionText}>{alt.texto}</Text>
          </TouchableOpacity>
        ))}

        {resultado && (
          <View style={[styles.resultBox, resultado.ok ? styles.resultOk : styles.resultFail]}>
            <Text style={styles.resultTitle}>
              {resultado.ok === null ? 'Não foi possível verificar' : resultado.ok ? 'Correto!' : 'Incorreto'}
            </Text>
            <Text style={styles.muted}>Gabarito: {resultado.correta}</Text>
            {resultado.explicacao ? <Text style={styles.explicacao}>{resultado.explicacao}</Text> : null}
          </View>
        )}

        <View style={styles.row}>
          <TouchableOpacity
            style={[styles.button, styles.buttonOutline, { flex: 1 }]}
            onPress={verificar}
            disabled={!selected}
          >
            <Text style={styles.buttonOutlineText}>Verificar</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.button, { flex: 1 }]} onPress={proxima}>
            <Text style={styles.buttonText}>
              {index < questoes.length - 1 ? 'Próxima' : 'Concluir'}
            </Text>
          </TouchableOpacity>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

export default function App() {
  const [token, setToken] = useState(null);
  const [booting, setBooting] = useState(true);

  useEffect(() => {
    AsyncStorage.getItem('jwtToken').then((t) => {
      setToken(t);
      setBooting(false);
    });
  }, []);

  if (booting) {
    return (
      <View style={styles.center}>
        <ActivityIndicator size="large" color="#22c55e" />
      </View>
    );
  }

  return (
    <NavigationContainer>
      <Stack.Navigator screenOptions={{ headerShown: false }}>
        {!token ? (
          <Stack.Screen name="Login">
            {(props) => <LoginScreen {...props} setToken={setToken} />}
          </Stack.Screen>
        ) : (
          <>
            <Stack.Screen name="Home">
              {(props) => <HomeScreen {...props} setToken={setToken} />}
            </Stack.Screen>
            <Stack.Screen name="Questoes" component={QuestoesScreen} />
          </>
        )}
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#f8fafc' },
  center: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  header: { backgroundColor: '#0f172a', padding: 32, paddingTop: 48, alignItems: 'center' },
  brand: {
    width: 56, height: 56, borderRadius: 12, backgroundColor: '#22c55e',
    color: '#0f172a', fontWeight: '900', fontSize: 22, textAlign: 'center',
    lineHeight: 56, overflow: 'hidden', marginBottom: 12,
  },
  title: { color: '#fff', fontSize: 22, fontWeight: '700' },
  subtitle: { color: '#86efac', marginTop: 4 },
  form: { padding: 24 },
  label: { fontSize: 18, fontWeight: '700', marginBottom: 16, color: '#0f172a' },
  input: {
    backgroundColor: '#fff', borderRadius: 10, padding: 14, marginBottom: 12,
    borderWidth: 1, borderColor: '#e2e8f0', fontSize: 16,
  },
  button: {
    backgroundColor: '#22c55e', borderRadius: 10, padding: 16,
    alignItems: 'center', marginTop: 8,
  },
  buttonOutline: { backgroundColor: 'transparent', borderWidth: 2, borderColor: '#22c55e' },
  buttonText: { color: '#0f172a', fontWeight: '700', fontSize: 16 },
  buttonOutlineText: { color: '#15803d', fontWeight: '700', fontSize: 16 },
  error: { color: '#dc2626', marginBottom: 8 },
  topBar: {
    backgroundColor: '#0f172a', paddingHorizontal: 16, paddingVertical: 14,
    flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center',
  },
  topTitle: { color: '#fff', fontWeight: '700', fontSize: 16 },
  logout: { color: '#86efac' },
  scroll: { padding: 16, paddingBottom: 40 },
  sectionTitle: { fontSize: 18, fontWeight: '700', marginBottom: 12, color: '#0f172a' },
  statsRow: { flexDirection: 'row', gap: 12, marginBottom: 20 },
  statCard: {
    flex: 1, backgroundColor: '#fff', borderRadius: 12, padding: 16,
    alignItems: 'center', borderWidth: 1, borderColor: '#e2e8f0',
  },
  statBlue: { backgroundColor: '#e0f2fe' },
  statValue: { fontSize: 22, fontWeight: '800', color: '#0f172a' },
  statLabel: { fontSize: 12, color: '#64748b', marginTop: 4 },
  topicCard: {
    backgroundColor: '#fff', borderRadius: 10, padding: 14, marginBottom: 8,
    borderWidth: 1, borderColor: '#e2e8f0',
  },
  topicName: { fontWeight: '600', color: '#0f172a' },
  topicCount: { color: '#64748b', fontSize: 13, marginTop: 2 },
  enunciado: { fontSize: 15, color: '#334155', marginBottom: 16, lineHeight: 22 },
  option: {
    flexDirection: 'row', alignItems: 'center', backgroundColor: '#fff',
    borderRadius: 10, padding: 14, marginBottom: 8, borderWidth: 1.5, borderColor: '#e2e8f0',
  },
  optionSelected: { borderColor: '#22c55e', backgroundColor: '#dcfce7' },
  optionLetter: {
    width: 32, height: 32, borderRadius: 16, backgroundColor: '#e2e8f0',
    textAlign: 'center', lineHeight: 32, fontWeight: '700', marginRight: 12, overflow: 'hidden',
  },
  optionText: { flex: 1, color: '#334155' },
  resultBox: { borderRadius: 10, padding: 14, marginVertical: 12, borderLeftWidth: 4 },
  resultOk: { backgroundColor: '#dcfce7', borderLeftColor: '#22c55e' },
  resultFail: { backgroundColor: '#fee2e2', borderLeftColor: '#dc2626' },
  resultTitle: { fontWeight: '700', color: '#0f172a' },
  muted: { color: '#64748b', fontSize: 13, marginTop: 4 },
  explicacao: { marginTop: 6, fontSize: 13, color: '#475569', fontStyle: 'italic' },
  notice: { padding: 24, alignItems: 'center' },
  row: { flexDirection: 'row', gap: 12, marginTop: 16 },
});
