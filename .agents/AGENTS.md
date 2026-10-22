# Vitor Resume — Agent Governance & Subagents Catalog

Este repositório mantém o currículo em LaTeX ([`main.tex`](../main.tex) e [`mainEnglish.tex`](../mainEnglish.tex)) sob governança assistida por agentes especializados.

---

## 🛑 Regras Inegociáveis & Invariantes de Edição

Qualquer agente ou pessoa que atualizar este currículo DEVE seguir estritamente as 5 invariantes abaixo:

### 1. Orçamento Rígido de Página Única (*One-Page Budget*)
- O currículo compilado (`main.pdf` e `mainEnglish.pdf`) deve ter **exatamente 1 página** (`Pages: 1`).
- Nunca permita que títulos, seções ou bullets transbordem para uma segunda página. Se novos itens forem adicionados, enxugue espaçamentos verticais ou sintetize descrições mantendo a densidade técnica.

### 2. Diferenciação *"AI-Native Systems Engineer"* vs. *"Vibe Coder"*
- **Proibição de Vibe Coding**: É estritamente proibido utilizar termos que insinuem terceirização de código de produção para IA (ex: *"delegando código exclusivamente para subagentes"*, *"código gerado por prompts"*).
- **Foco em Governança & Arquitetura**: Todo uso de IA deve ser posicionado sob a ótica de **Harness Engineering, Contract-First (OpenAPI 3.0), Test Tamper Guard (`git diff`), TDD Estrito, Isolamento em Git Worktrees, Análise Estática Anti-Slop e Observabilidade (OpenTelemetry/Jaeger)**.
- **Zero Autoelogios**: Proibido usar adjetivos subjetivos como *"Pioneiro"*, *"Especialista visionário"* ou *"Apaixonado por"*. Apresente dados arquiteturais e impacto mensurável (Padrão Google XYZ).

### 3. Blindagem e Sigilo de Projetos Não Públicos (Regra do JAX)
- O projeto/ferramenta **JAX** ainda não é público.
- **Invariante**: **NUNCA cite o nome "JAX"** no currículo até liberação explícita.
- **Como descrever**: Descreva toda a engenharia, complexidade técnica e arquitetura por trás da ferramenta (ex: *"CLI/TUI reativa em TypeScript/Node.js sob Vertical Slice Architecture, React Ink, Zod, SQLite WAL, sandboxing em Git Worktrees, detecção de drift via SHA-256 e FinOps de LLMs"*).

### 4. Unificação Contínua da AGES na Trajetória Profissional
- A experiência na **Fábrica de Software AGES (PUCRS)** não deve ser rebaixada a "portfólio acadêmico" ou "projetos de faculdade".
- Ela deve permanecer unificada dentro da seção **Experiência Profissional** sob o cargo de **Engenheiro de Software & Tech Lead (Mar 2023 -- Jul 2026)**, destacando os 4 clientes/projetos reais (*Estudify*, *Lucky Draw*, *MeditAmamente* e *Globo Aplausos*). Isso garante a contabilização correta de tempo de experiência (+3,5 anos) pelos parsers ATS.

### 5. Compilação Limpa & Higiene do Git
- Toda alteração em `.tex` deve ser compilada via `./build.sh` (ou `Makefile`) para validação de erros sintáticos e checagem de página (`pdfinfo main.pdf | grep Pages`).
- Binários (`*.pdf`), artefatos temporários do LaTeX e bancos/traces locais (`.harness/`, `traces.db*`) devem permanecer estritamente isolados em `build/` e protegidos pelo [`.gitignore`](../.gitignore).

---

## 🤖 Subagentes Disponíveis (`.agents/subagents/`)

### 1. [`tech-recruiter`](subagents/tech-recruiter.md)
- **Persona**: Senior Tech Recruiter & Staff Engineering Hiring Manager.
- **Responsabilidade**: Auditar o currículo segundo práticas modernas de mercado (Otimização ATS, Fórmula de Impacto Google XYZ / STAR, Heurística de 6 segundos F-Pattern, posicionamento *AI-Native Software Engineer* vs. *Vibe Coder*, e higiene de palavras-chave / eliminação de *red flags*).
- **Quando utilizar**: Antes e depois de qualquer atualização de conteúdo em `main.tex`, para validar se o texto maximiza aprovação em triagens automatizadas (ATS) e entrevistas técnicas com Tech Leads/CTOs.

---

## 🛠️ Skills Disponíveis (`.agents/skills/`)

### 1. [`translate-resume`](skills/translate-resume/SKILL.md)
- **Responsabilidade**: Traduzir e sincronizar o currículo em português (`main.tex`) para a versão em inglês (`mainEnglish.tex`), mantendo paridade estrutural, verbos de ação fortes e compilação limpa via `Makefile` / `build.sh`.
