---
name: translate-resume
description: >-
  Translates and synchronizes the Portuguese resume (main.tex) into the English version
  (mainEnglish.tex), ensuring structural parity, high-impact action verbs, domain-accurate
  technical terminology, and clean compilation.
---

# Resume Translation & Synchronization Skill (PT-BR -> EN)

This skill guides AI agents on translating and synchronizing modifications from the base Portuguese resume ([main.tex](../../../main.tex)) into the English resume ([mainEnglish.tex](../../../mainEnglish.tex)).

---

## 1. Core Principles & Quality Standards

1. **Structural Parity**:
   - Every section, subsection, bullet point, date, and link in `main.tex` MUST have an exact corresponding counterpart in `mainEnglish.tex`.
   - Keep identical LaTeX tags, environments (`highlights`, `header`), geometries, and formatting wrappers.

2. **High-Impact Action Verbs**:
   - Begin bullet points with strong past-tense action verbs in English (e.g., *Designed, Architected, Engineered, Led, Implemented, Optimized, Streamlined, Reduced*).

3. **Domain & Technical Terminology Accuracy**:
   - Maintain proper capitalization and spelling for tech stacks (e.g., `TypeScript`, `PostgreSQL`, `Spring Boot`, `Docker`, `CI/CD`, `AWS Lambda`, `GCP Cloud Run`).
   - Do not translate proper company names (e.g., *Tecnova Energia*, *Globo*, *AGES*, *PUCRS*).

4. **Page Budget & Visual Balance**:
   - Ensure the translated text does not cause unintended line wraps that push sections onto extra pages.
   - Run compilation after editing to verify layout integrity.

---

## 2. Standard Glossary & Terminology Mapping

| Portuguese (PT-BR) | English (EN) | Notes |
| :--- | :--- | :--- |
| `Resumo Profissional` | `Professional Summary` | Section title |
| `Competências Técnicas` | `Technical Skills` | Section title |
| `Experiência Profissional` | `Professional Experience` | Section title |
| `Portfólio de Engenharia de Software (Fábrica de Software -- AGES/PUCRS)` | `Software Engineering Portfolio (Software House -- AGES/PUCRS)` | Section title |
| `Formação Acadêmica` | `Education` | Section title |
| `Certificações e Idiomas` | `Certifications & Languages` | Section title |
| `Engenheiro de Software Full-Stack` | `Full-Stack Software Engineer` | Role |
| `Desenvolvedor (Freelancer)` | `Software Developer (Freelance)` | Role |
| `Software Engineer Intern` | `Software Engineer Intern` | Role |
| `Bacharel em Engenharia de Software` | `Bachelor of Science in Software Engineering` | Degree |
| `Projeto Destaque Acadêmico` | `Outstanding Academic Project` | Award |
| `Monitoria de POO em Java` | `OOP Teaching Assistant in Java` | Academic role |
| `Instrutor Técnico` / `Ministrou o workshop` | `Technical Instructor` / `Delivered the workshop` | Academic activity |
| `Nível Avançado` | `Advanced / Fluent` | Language proficiency |
| `Nativo` | `Native` | Language proficiency |
| `Remoto` / `Atual` | `Remote` / `Present` | Location / Date |

---

## 3. Step-by-Step Workflow for AI Agents

When updating or translating resume content:

### Step 1: Analyze the Portuguese Changes
- Read the modified blocks in [main.tex](../../../main.tex).
- Note new accomplishments, technical stack updates, or timeline modifications.

### Step 2: Translate and Update `mainEnglish.tex`
- Apply appropriate professional English phrasing and active voice.
- Preserve formatting commands, bold tags (`\textbf{...}`), and hyperlinks (`\href{...}{...}`).
- Update metadata:
  ```latex
  pdftitle={Vitor Jacom - Resume}
  ```

### Step 3: Validate and Compile
Execute the clean build workflow to verify there are no LaTeX syntax errors or overflow:

```bash
# Compile English version
make english

# Or compile both versions simultaneously
make both
```

### Step 4: Verify Cleanliness
- Confirm that `mainEnglish.pdf` (and `main.pdf`) are generated in the root directory.
- Verify that `git status` shows no stray auxiliary files outside the `build/` directory.
