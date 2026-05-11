# Conversor PDF Office

Script simples para converter arquivos do Word e PowerPoint em PDF no Windows.

## Arquivos

- `converterPDF.ps1`: script principal em PowerShell.
- `rodar.bat`: atalho para executar o script pelo Windows.

## Como usar

1. Coloque `converterPDF.ps1` e `rodar.bat` na mesma pasta dos arquivos que deseja converter.
2. Dê dois cliques em `rodar.bat`.
3. O script buscará arquivos `.doc`, `.docx`, `.ppt` e `.pptx` na mesma pasta.
4. Os PDFs serão gerados na mesma pasta dos arquivos originais.

## Requisitos

- Windows.
- Microsoft Word instalado, para converter arquivos `.doc` e `.docx`.
- Microsoft PowerPoint instalado, para converter arquivos `.ppt` e `.pptx`.

## Arquitetura de contexto

Este repositório também tem arquivos que ajudam pessoas e agentes de IA a entenderem o projeto:

- `README.md`: guia para pessoas, com explicação do projeto e modo de uso.
- `AGENTS.md`: regras permanentes para Codex, OpenCode e outros agentes de IA.
- `CLAUDE.md`: adaptador para Claude Code / Claude Desktop, apontando para `AGENTS.md` como fonte principal de regras.
- `docs/PROJECT_STATE.md`: estado operacional atual do projeto, com decisões, pendências, limitações, testes e próximos passos.
- `docs/HANDOFF.md`: resumo de passagem de contexto para continuar o projeto em outro chat, agente ou sessão.

Em termos simples: o README explica o projeto para uma pessoa; os outros arquivos ajudam uma IA a continuar trabalhando sem perder o contexto.

## Observação de segurança

O arquivo `rodar.bat` executa o script PowerShell usando `ExecutionPolicy Bypass`.

Execute apenas se confiar no conteúdo dos arquivos e dos documentos que serão convertidos.

## Licença

Este projeto pode ser usado para fins didáticos e pessoais.

