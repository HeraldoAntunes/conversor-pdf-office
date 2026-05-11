@AGENTS.md

# Claude Code / Claude Desktop

Este projeto usa `AGENTS.md` como fonte principal de regras compartilhadas para agentes de IA.

Antes de tarefas relevantes, leia também:

1. `README.md`
2. `docs/PROJECT_STATE.md`
3. `docs/HANDOFF.md`, quando houver retomada ou passagem de contexto

## Regras específicas para Claude

- Use este arquivo apenas como adaptação para Claude.
- Não duplique regras já presentes em `AGENTS.md`.
- Preserve a filosofia de arquitetura suficiente: simples, local, funcional e sem overengineering.
- Não faça commit, push, publicação, instalação de dependências ou ação destrutiva sem pedido explícito.
- Ao concluir tarefa relevante, atualize `docs/PROJECT_STATE.md` se houver mudança de estado, decisão, limitação, teste ou próximo passo.
- Atualize `docs/HANDOFF.md` apenas quando o usuário pedir passagem de contexto ou quando houver ponto claro de transferência.
- Se houver conflito entre este arquivo e `AGENTS.md`, avise o usuário antes de agir.
