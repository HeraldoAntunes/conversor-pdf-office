# AGENTS.md

Guia permanente para agentes de IA trabalhando neste repositório.

## Contexto do projeto

Este repositório contém um utilitário simples para Windows que converte arquivos do Microsoft Word e Microsoft PowerPoint para PDF usando PowerShell e automação COM do Microsoft Office instalado localmente.

O projeto atual não contém aplicação web, API, pacote instalável, testes automatizados ou integração com serviços externos.

## Objetivo do projeto

Manter um script local, direto e seguro para converter arquivos `.doc`, `.docx`, `.ppt` e `.pptx` em arquivos `.pdf` na mesma pasta dos arquivos originais.

Com base nos arquivos existentes, o fluxo esperado é:

1. Colocar `converterPDF.ps1` e `rodar.bat` na pasta dos documentos a converter.
2. Executar `rodar.bat` no Windows.
3. O PowerShell localizar arquivos Word/PowerPoint na pasta do script.
4. Os PDFs resultantes são gravados na mesma pasta.

## Estrutura real do repositório

```text
.
├── .gitignore
├── AGENTS.md
├── README.md
├── converterPDF.ps1
├── docs/
│   └── HANDOFF.md
└── rodar.bat
```

## Função dos arquivos principais

- `converterPDF.ps1`: script principal. Usa `$PSScriptRoot` para operar na pasta onde o script está salvo, busca arquivos `.doc`, `.docx`, `.ppt` e `.pptx`, abre Word e PowerPoint por COM Automation, salva cada arquivo como PDF e libera os objetos COM ao final.
- `rodar.bat`: atalho de execução no Windows. Chama `powershell.exe -ExecutionPolicy Bypass -File "%~dp0converterPDF.ps1"` e mantém a janela aberta com `pause`.
- `README.md`: documentação voltada ao usuário final, com objetivo, uso básico, requisitos e aviso de segurança.
- `.gitignore`: evita versionar PDFs gerados, documentos Office usados localmente, temporários do Office, arquivos de sistema e logs.
- `docs/HANDOFF.md`: memória operacional do projeto para continuidade entre sessões, máquinas e agentes.
- `AGENTS.md`: guia permanente de regras para agentes. Não deve virar diário de trabalho.

## Prioridades de trabalho

1. Preservar a simplicidade do projeto.
2. Evitar dependências externas sem necessidade clara.
3. Manter compatibilidade com Windows e Microsoft Office instalado localmente.
4. Não versionar documentos reais, PDFs gerados, temporários ou dados pessoais.
5. Melhorar segurança, robustez e mensagens de erro sem transformar o projeto em algo maior que o necessário.
6. Documentar mudanças relevantes em `README.md` e `docs/HANDOFF.md`.

## Regras de segurança e privacidade

- Nunca incluir chaves de API, tokens, senhas, credenciais, caminhos pessoais sensíveis ou documentos reais no repositório.
- Não adicionar arquivos `.pdf`, `.doc`, `.docx`, `.ppt` ou `.pptx` ao versionamento, salvo pedido explícito e justificativa clara.
- Tratar arquivos Office como potencialmente sensíveis e potencialmente perigosos, especialmente quando vierem de terceiros.
- Considerar que `rodar.bat` usa `ExecutionPolicy Bypass`; qualquer alteração nesse fluxo deve preservar um aviso claro ao usuário.
- Evitar coletar, exibir ou registrar conteúdo interno dos documentos convertidos.
- Se precisar criar exemplos, usar nomes e dados fictícios mínimos.
- Se encontrar arquivo possivelmente sensível no repositório, não abrir além do necessário, não copiar conteúdo e avisar no resumo.

## Padrões de código

- Linguagem principal: PowerShell.
- Script auxiliar: Batch (`.bat`) apenas para facilitar execução no Windows.
- Preferir código PowerShell simples e compatível com ambientes Windows comuns.
- Usar `$PSScriptRoot` quando a intenção for operar na pasta do script.
- Manter tratamento de erro por arquivo para que uma falha não impeça conversões posteriores.
- Garantir fechamento de documentos/apresentações e liberação de objetos COM.
- Evitar mudanças de arquitetura sem necessidade comprovada.
- Não introduzir serviços remotos, telemetria, interface gráfica ou instaladores sem solicitação explícita.
- Comentários devem explicar decisões práticas, não repetir o que o comando já deixa claro.

## Padrões de documentação

- Documentação deve ser curta, técnica e verificável contra o código existente.
- Não documentar funcionalidades planejadas como se já existissem.
- Quando o comportamento depender do Microsoft Office, deixar isso explícito.
- Atualizar a documentação no mesmo conjunto de mudanças quando comportamento, requisitos, execução ou segurança mudarem.
- Evitar transformar documentos em histórico de conversa.

## Cuidados com Git e GitHub

- Antes de alterar arquivos, verificar o estado com `git status --short`.
- Não reverter mudanças do usuário sem pedido explícito.
- Não versionar arquivos ignorados por `.gitignore`, especialmente PDFs gerados e documentos Office locais.
- Commits devem ser pequenos, descritivos e focados.
- Revisar diffs antes de sugerir commit.
- Em pull requests, explicar impacto para usuários Windows e qualquer mudança em requisitos de Office/PowerShell.

## Regras para uso de README.md

- `README.md` é a entrada para usuários do projeto.
- Deve explicar o que o conversor faz, requisitos, como executar e riscos básicos.
- Deve evitar detalhes internos extensos, histórico de decisões e pendências operacionais.
- Deve ser atualizado quando houver mudança de uso, requisitos, arquivos principais, limitações ou avisos de segurança.

## Regras para uso de docs/HANDOFF.md

- `docs/HANDOFF.md` é a memória operacional do projeto.
- Deve registrar estado atual, decisões, próximos passos, pendências, limitações e observações úteis para continuidade.
- Deve ser atualizado ao final de alteração relevante em arquivos, arquitetura, comportamento, dependências, segurança, documentação ou próximos passos.
- Não deve virar diário de conversa, ata de sessão ou lista de eventos sem valor futuro.
- Deve permanecer denso, técnico, limpo e acionável.

## Rotina para agentes de IA

Ao iniciar tarefa não trivial, leia nesta ordem:

1. `README.md`
2. `AGENTS.md`
3. `docs/HANDOFF.md`
4. Arquivos diretamente relacionados à tarefa

Durante o trabalho:

- Baseie conclusões no conteúdo real do repositório.
- Não invente funcionalidades.
- Não altere arquivos de código quando a tarefa for apenas documental, salvo necessidade explícita.
- Preserve mudanças existentes feitas pelo usuário.

Ao finalizar alteração relevante:

- Atualize `docs/HANDOFF.md` com o novo estado, decisões, pendências e próximos passos úteis.
- Não altere `AGENTS.md` automaticamente, a menos que o usuário peça ou a própria tarefa seja mudar regras permanentes.

## Quando recomendar atualização de AGENTS.md

Recomende atualizar `AGENTS.md` quando houver mudança permanente em:

- objetivo do projeto;
- arquitetura ou fluxo principal;
- tecnologias suportadas;
- política de segurança ou privacidade;
- padrões de código;
- rotina de documentação;
- estratégia de Git/GitHub;
- critérios de versionamento ou arquivos proibidos.

