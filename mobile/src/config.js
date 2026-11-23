/**
 * URL da API em PRODUÇÃO (domínio personalizado configurado na Vercel).
 * Em desenvolvimento, use o IP da sua máquina na rede local, ex:
 *   export const API_URL = 'http://192.168.0.10:3000';
 */
export const API_URL = process.env.EXPO_PUBLIC_API_URL || 'https://SEU-DOMINIO.com';
