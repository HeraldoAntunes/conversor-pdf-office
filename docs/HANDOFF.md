# HANDOFF.md

Memória operacional para continuidade deste projeto entre sessões, máquinas e agentes.

## Objetivo do projeto

Utilitário local para Windows que converte documentos do Microsoft Word e apresentações do Microsoft PowerPoint para PDF usando PowerShell e automação COM do Microsoft Office.

O escopo comprovado no repositório é converter arquivos `.doc`, `.docx`, `.ppt` e `.pptx` localizados na mesma pasta do script para PDFs gerados nessa mesma pasta.

## Estado atual

- Projeto pequeno, sem estrutura de build, dependências externas, testes automatizados ou aplicação empacotada.
- A implementação principal está em `converterPDF.ps1`.
- A execução simplificada para usuário Windows está em `rodar.bat`.
- O README documenta uso básico, requisitos e o risco de `ExecutionPolicy Bypass`.
- `.gitignore` impede versionar PDFs gerados, documentos Office locais, temporários do Office, arquivos de sistema e logs.
- `AGENTS.md` foi criado como guia permanente para agentes de IA.
- Este arquivo registra o contexto operacional e deve ser mantido enxuto.

## Arquivos principais

- `converterPDF.ps1`: busca arquivos Office na pasta do script, converte Word para PDF com `SaveAs(..., 17)` e PowerPoint para PDF com `SaveAs(..., 32)`, fecha documentos/apresentações e libera objetos COM.
- `rodar.bat`: chama o script PowerShell com `ExecutionPolicy Bypass` usando o caminho do próprio `.bat`.
- `README.md`: documentação de uso para pessoas que querem executar o conversor.
- `.gitignore`: proteção contra versionamento de arquivos gerados e documentos reais.
- `AGENTS.md`: regras permanentes para trabalho de agentes.
- `docs/HANDOFF.md`: estado operacional e próximos passos.

## Decisões já tomadas

- Manter o projeto como utilitário local simples, sem dependências externas.
- Usar Microsoft Office instalado localmente via COM Automation, não conversores remotos.
- Operar na pasta onde `converterPDF.ps1` está salvo.
- Gerar PDFs ao lado dos arquivos originais.
- Ignorar documentos Office e PDFs no Git para evitar vazamento de dados e arquivos gerados.
- Separar documentação permanente de agentes (`AGENTS.md`) da memória operacional (`docs/HANDOFF.md`).

## Próximos passos sugeridos

- Revisar se as barras invertidas presentes no `README.md` antes de marcadores Markdown são intencionais ou devem ser removidas para melhorar renderização.
- Avaliar mensagens de erro mais informativas em `converterPDF.ps1`, sem expor conteúdo dos documentos.
- Considerar tratamento para arquivos já abertos, protegidos por senha ou com falha de macro/Office.
- Considerar opção segura para pular conversão quando o PDF de destino já existir.
- Validar manualmente em uma máquina Windows com Word e PowerPoint instalados.
- Se o projeto crescer, considerar uma pequena seção de troubleshooting no `README.md`.

## Pendências

- Não há testes automatizados.
- Não há validação documentada em ambiente real nesta sessão.
- Não há empacotamento, instalador ou assinatura de script.
- O comportamento com LibreOffice, Office online ou ambientes sem COM Automation não é suportado/documentado como funcional.
- Erros de conversão atualmente são reportados de forma genérica no console.

## Limitações conhecidas

- Requer Windows.
- Requer Microsoft Word para `.doc` e `.docx`.
- Requer Microsoft PowerPoint para `.ppt` e `.pptx`.
- Depende de automação COM do Office, que pode falhar se o Office não estiver instalado, licenciado ou acessível.
- `rodar.bat` usa `ExecutionPolicy Bypass`, exigindo cuidado ao executar.
- O script processa apenas arquivos diretamente na pasta do script; não há busca recursiva.
- PDFs são gerados na mesma pasta dos arquivos originais.
- Arquivos Office reais e PDFs gerados não devem ser versionados.

## Rotina Git recomendada

1. Verificar estado: `git status --short`
2. Revisar diferenças: `git diff`
3. Adicionar apenas arquivos intencionais: `git add AGENTS.md docs/HANDOFF.md`
4. Criar commit focado: `git commit -m "Add AI agent project context"`

Para mudanças futuras, manter commits pequenos e evitar incluir documentos pessoais, PDFs gerados, temporários do Office ou logs.

## Observações para continuidade

- Antes de tarefa não trivial, ler `README.md`, `AGENTS.md` e este arquivo.
- Atualizar este arquivo após mudanças relevantes em comportamento, documentação, segurança, dependências ou próximos passos.
- Não atualizar `AGENTS.md` automaticamente; propor alteração quando regras permanentes precisarem mudar.
- Ao mexer no script, preservar fechamento de arquivos Office e liberação dos objetos COM.
- Ao melhorar segurança, manter visível o aviso sobre `ExecutionPolicy Bypass`.

