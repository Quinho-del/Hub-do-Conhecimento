function Home() {
  return (
    <>
      <section className="subtitulo">
        <div className="hero-copy">
          <span className="hero-kicker">Vestibular+ / Matematica</span>
          <h1>
            Treine como se a prova ja tivesse comecado.
          </h1>
          <p>
            Questoes por tema, dificuldade e vestibular em uma experiencia feita
            para estudar rapido, revisar melhor e ganhar confianca.
          </p>
        </div>

        <div className="hero-panel" aria-label="Resumo da plataforma">
          <div>
            <span>Topicos</span>
            <strong>13</strong>
          </div>
          <div>
            <span>Busca</span>
            <strong>ID</strong>
          </div>
          <div>
            <span>Feedback</span>
            <strong>Direto</strong>
          </div>
        </div>
      </section>

      <main className="main">
        <aside className="informacoes">
          <span className="section-label">Metodo</span>
          <h3>Estudo que cabe no intervalo</h3>
          <ul className="info-topicos">
            <li>Foco em raciocinio e resolucao</li>
            <li>Filtros por tema e dificuldade</li>
            <li>Comentarios para corrigir a rota</li>
          </ul>
        </aside>
      </main>

      <section className="contatos">
        <div>
          <span className="section-label">Contato</span>
          <h3>Fale com a gente</h3>
          <p>
            Duvidas sobre estudos ou sobre a plataforma? Nossa equipe esta pronta
            para ajudar.
          </p>
        </div>
        <div className="contatos-info">
          <div className="contatos-topicos">
            <span>E-mail</span>
            <p>suricateam@matematicavestibular.com</p>
          </div>
          <div className="contatos-topicos">
            <span>Telefone</span>
            <p>(11) 99999-9999</p>
          </div>
          <div className="contatos-topicos">
            <span>Atendimento</span>
            <p>Online / Brasil</p>
          </div>
        </div>
      </section>

      <footer>
        <p>Copyright 2026 The definers | Vestibular+</p>
      </footer>
    </>
  )
}

export default Home
