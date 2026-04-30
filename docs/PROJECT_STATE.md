# PROJECT_STATE.md

Estado operacional vivo do projeto. Este arquivo substitui o uso antigo de `docs/HANDOFF.md` como memória dinâmica.

Última atualização: 2026-04-30

## Objetivo do projeto

Manter um utilitário local para Windows que converte arquivos do Microsoft Word e Microsoft PowerPoint para PDF usando PowerShell e automação COM do Microsoft Office instalado localmente.

O escopo comprovado no repositório é converter arquivos `.doc`, `.docx`, `.ppt` e `.pptx` localizados na mesma pasta do script para PDFs gerados nessa mesma pasta.

## Estado atual

- Projeto pequeno, sem estrutura de build, dependências externas, testes automatizados ou aplicação empacotada.
- A implementação principal está em `converterPDF.ps1`.
- A execução simplificada para usuário Windows está em `rodar.bat`.
- O README documenta uso básico, requisitos, segurança e arquitetura de contexto.
- `.gitignore` impede versionar PDFs gerados, documentos Office locais, temporários do Office, arquivos de sistema e logs.
- `AGENTS.md` contém as regras permanentes para agentes.
- `docs/PROJECT_STATE.md` é a memória operacional contínua.
- `docs/HANDOFF.md` é o documento de passagem de contexto.

## Estrutura real do repositório

```text
.
├── .gitignore
├── AGENTS.md
├── README.md
├── converterPDF.ps1
├── docs/
│   ├── HANDOFF.md
│   └── PROJECT_STATE.md
└── rodar.bat
```

## Arquivos principais

- `converterPDF.ps1`: busca arquivos Office na pasta do script, converte Word para PDF com `SaveAs(..., 17)` e PowerPoint para PDF com `SaveAs(..., 32)`, fecha documentos/apresentações e libera objetos COM.
- `rodar.bat`: chama o script PowerShell com `ExecutionPolicy Bypass` usando o caminho do próprio `.bat`.
- `README.md`: guia humano de uso e visão simples dos documentos de contexto.
- `.gitignore`: proteção contra versionamento de arquivos gerados, documentos reais, temporários e logs.
- `AGENTS.md`: regras estáveis para agentes de IA.
- `docs/PROJECT_STATE.md`: estado operacional atual.
- `docs/HANDOFF.md`: passagem de contexto para outro chat, agente, máquina ou sessão.

## Decisões em vigor

- Manter o projeto como utilitário local simples, sem dependências externas.
- Usar Microsoft Office instalado localmente via COM Automation, não conversores remotos.
- Operar na pasta onde `converterPDF.ps1` está salvo.
- Gerar PDFs ao lado dos arquivos originais.
- Ignorar documentos Office e PDFs no Git para evitar vazamento de dados e arquivos gerados.
- Usar `docs/PROJECT_STATE.md` como memória operacional contínua.
- Usar `docs/HANDOFF.md` apenas como documento de transferência de contexto.
- Não alterar `AGENTS.md` automaticamente no futuro; recomendar mudança quando regras permanentes precisarem ser atualizadas.

## Limitações conhecidas

- Requer Windows.
- Requer Microsoft Word para `.doc` e `.docx`.
- Requer Microsoft PowerPoint para `.ppt` e `.pptx`.
- Depende de automação COM do Office, que pode falhar se o Office não estiver instalado, licenciado ou acessível.
- `rodar.bat` usa `ExecutionPolicy Bypass`, exigindo cuidado ao executar.
- O script processa apenas arquivos diretamente na pasta do script; não há busca recursiva.
- PDFs são gerados na mesma pasta dos arquivos originais.
- Arquivos Office reais e PDFs gerados não devem ser versionados.
- Erros de conversão atualmente são reportados de forma genérica no console.

## Testes feitos

- Leitura completa dos arquivos atuais do repositório em 2026-04-30.
- Verificação documental da estrutura e das referências a `HANDOFF` e `PROJECT_STATE`.
- Nenhum teste funcional de conversão foi executado nesta atualização.
- Nenhum teste automatizado existe no projeto neste momento.

## Testes pendentes

- Validar manualmente em uma máquina Windows com Microsoft Word instalado.
- Validar manualmente em uma máquina Windows com Microsoft PowerPoint instalado.
- Testar conversão de `.doc`, `.docx`, `.ppt` e `.pptx`.
- Testar comportamento quando não há arquivos compatíveis na pasta.
- Testar comportamento com PDF de destino já existente.
- Testar arquivos protegidos por senha, abertos em outro processo ou corrompidos, se esse cenário for relevante.

## Próximos passos

- Validar a conversão em ambiente Windows real com Office instalado.
- Avaliar mensagens de erro mais informativas em `converterPDF.ps1`, sem expor conteúdo dos documentos.
- Considerar tratamento para arquivos já abertos, protegidos por senha ou com falha de abertura pelo Office.
- Considerar opção segura para pular ou confirmar sobrescrita quando o PDF de destino já existir.
- Se o projeto crescer, considerar uma pequena seção de troubleshooting no `README.md`.

## Instrução de retomada rápida

Para retomar o projeto:

1. Leia `README.md`, `AGENTS.md` e este arquivo.
2. Leia `docs/HANDOFF.md` apenas se a tarefa envolver transferência de contexto, continuidade de sessão ou retomada por outro agente.
3. Rode `git status --short`.
4. Abra os arquivos diretamente relacionados à tarefa antes de editar.
5. Evite arquivos reais de alunos, documentos institucionais sensíveis, PDFs gerados, logs e temporários.

