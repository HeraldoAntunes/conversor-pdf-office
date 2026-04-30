# HANDOFF.md

Documento oficial de passagem de contexto para outro chat, agente, máquina ou sessão.

Última atualização: 2026-04-30

## Tema

Conversor PDF Office: utilitário PowerShell para converter arquivos Word e PowerPoint em PDF no Windows usando Microsoft Office local via COM Automation.

## Status

Arquitetura de contexto padronizada:

- `README.md`: guia humano do projeto.
- `AGENTS.md`: regras permanentes para agentes.
- `docs/PROJECT_STATE.md`: estado operacional vivo.
- `docs/HANDOFF.md`: passagem de contexto.

O código do conversor não foi alterado nesta padronização documental.

## Complexidade

Baixa em estrutura de repositório e documentação. Média em execução real, porque depende de Windows, Microsoft Office instalado, COM Automation e arquivos Office locais.

## Objetivo

Manter um utilitário simples que converte arquivos `.doc`, `.docx`, `.ppt` e `.pptx` localizados na pasta do script em PDFs gerados na mesma pasta.

## Estado atual

- Script principal: `converterPDF.ps1`.
- Atalho de execução: `rodar.bat`.
- Documentação humana: `README.md`.
- Regras de agentes: `AGENTS.md`.
- Memória operacional contínua: `docs/PROJECT_STATE.md`.
- Handoff de contexto: `docs/HANDOFF.md`.
- Não há testes automatizados, build, empacotamento ou dependências externas.

## Artefatos principais

- `converterPDF.ps1`: usa `$PSScriptRoot`, localiza arquivos Word/PowerPoint na pasta do script, converte via Word/PowerPoint COM, fecha documentos/apresentações e libera objetos COM.
- `rodar.bat`: executa o PowerShell com `ExecutionPolicy Bypass` apontando para `converterPDF.ps1`.
- `.gitignore`: ignora PDFs, documentos Office locais, temporários do Office, arquivos de sistema e logs.
- `docs/PROJECT_STATE.md`: fonte principal para estado atual, decisões, limitações, testes e próximos passos.

## Decisões tomadas

- Manter o projeto simples e local.
- Não introduzir dependências externas ou serviços remotos sem pedido explícito.
- Não versionar documentos reais, PDFs gerados, temporários ou logs.
- Separar memória operacional (`docs/PROJECT_STATE.md`) de passagem de contexto (`docs/HANDOFF.md`).
- Manter `AGENTS.md` como documento estável, alterado apenas quando o usuário pedir ou quando a tarefa for atualizar regras permanentes.

## Questões abertas

- Conversão ainda precisa ser validada manualmente em Windows com Word e PowerPoint instalados.
- Comportamento com arquivos protegidos por senha, abertos em outro processo ou corrompidos ainda não foi validado.
- Comportamento desejado quando o PDF de destino já existe ainda não foi definido.
- Mensagens de erro podem ser melhoradas sem expor conteúdo dos documentos.

## Restrições

- Não alterar arquivos de código em tarefas puramente documentais.
- Não incluir chaves de API, tokens, senhas, credenciais, dados pessoais, documentos de alunos, documentos institucionais sensíveis, logs ou arquivos temporários.
- Não colocar `AGENTS.md`, `docs/PROJECT_STATE.md` ou `docs/HANDOFF.md` no `.gitignore`.
- Tratar arquivos Office como potencialmente sensíveis.
- Preservar aviso de segurança sobre `ExecutionPolicy Bypass`.

## Estilo e preferências relevantes

- Documentação em português.
- Textos densos, técnicos, limpos e acionáveis.
- Não inventar funcionalidades que não existem no repositório.
- Separar claramente documentação para pessoas, regras permanentes de agentes, estado operacional e passagem de contexto.

## Próximo passo recomendado

Validar manualmente a conversão em uma máquina Windows com Microsoft Word e PowerPoint instalados. Depois, se necessário, melhorar tratamento de erro e comportamento para PDFs de destino já existentes.

## Instruções para a próxima IA

1. Leia `README.md`, `AGENTS.md` e `docs/PROJECT_STATE.md` antes de iniciar tarefa não trivial.
2. Use este `docs/HANDOFF.md` apenas como documento de transferência; não o trate como memória operacional principal.
3. Confirme `git status --short` antes de editar.
4. Baseie qualquer mudança no código real existente.
5. Atualize `docs/PROJECT_STATE.md` ao final de mudança relevante.
6. Atualize este `docs/HANDOFF.md` apenas se houver pedido de handoff ou novo ponto claro de passagem de contexto.

