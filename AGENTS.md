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

## Hierarquia de contexto

Quando houver conflito entre instruções, use esta ordem de precedência:

1. Instrução explícita do usuário na conversa atual.
2. `AGENTS.md`.
3. `docs/PROJECT_STATE.md`.
4. `docs/HANDOFF.md`.
5. `README.md`.
6. Código real do projeto como fonte final de comportamento executável.

`docs/HANDOFF.md` não substitui `docs/PROJECT_STATE.md`. O `HANDOFF` é um documento de transferência; o `PROJECT_STATE` é a memória operacional contínua.

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

## Função dos arquivos principais

- `converterPDF.ps1`: script principal. Usa `$PSScriptRoot` para operar na pasta onde o script está salvo, busca arquivos `.doc`, `.docx`, `.ppt` e `.pptx`, abre Word e PowerPoint por COM Automation, salva cada arquivo como PDF e libera os objetos COM ao final.
- `rodar.bat`: atalho de execução no Windows. Chama `powershell.exe -ExecutionPolicy Bypass -File "%~dp0converterPDF.ps1"` e mantém a janela aberta com `pause`.
- `README.md`: guia humano do projeto, com objetivo, uso básico, requisitos, segurança e visão simples da arquitetura de contexto.
- `.gitignore`: evita versionar PDFs gerados, documentos Office usados localmente, temporários do Office, arquivos de sistema e logs.
- `docs/PROJECT_STATE.md`: estado operacional vivo do projeto. Deve registrar estado atual, decisões em vigor, pendências, limitações, testes e próximos passos.
- `docs/HANDOFF.md`: documento oficial de passagem de contexto para outro chat, agente, máquina ou sessão.
- `AGENTS.md`: guia permanente de regras para agentes. Não deve virar diário de bordo.

## Prioridades de trabalho

1. Preservar a simplicidade do projeto.
2. Evitar dependências externas sem necessidade clara.
3. Manter compatibilidade com Windows e Microsoft Office instalado localmente.
4. Não versionar documentos reais, PDFs gerados, temporários ou dados pessoais.
5. Melhorar segurança, robustez e mensagens de erro sem transformar o projeto em algo maior que o necessário.
6. Documentar mudanças relevantes em `README.md`, `docs/PROJECT_STATE.md` e, quando houver passagem de contexto, `docs/HANDOFF.md`.

## Simplicidade arquitetural

- Prefira a solução mais simples que resolva o problema real atual.
- Preserve o funcionamento local e direto do projeto.
- Evite criar camadas, interfaces, DTOs, mappers, factories, services, use cases ou patterns apenas por convenção.
- Não introduza Clean Architecture completa, arquitetura hexagonal, CQRS, event sourcing, microservices, DDD tático completo, repository pattern formal ou dependency inversion sem justificativa explícita.
- Separe responsabilidades de forma simples, sem multiplicar arquivos desnecessariamente.
- Prefira encapsulamento simples antes de interfaces formais.
- Não crie interface para algo que tem apenas uma implementação, salvo necessidade real documentada.
- Não reorganize o projeto inteiro sem pedido explícito.
- Comece simples e abstraia apenas quando houver dor concreta.
- Considere que cada arquivo, camada e indireção aumenta custo de leitura, revisão e contexto para agentes de IA.
- Quando aplicável, mantenha lógica de negócio separada de detalhes de interface, DOM, HTTP, armazenamento local, arquivos ou integrações, mas sem cerimônia arquitetural desnecessária.

Antes de criar nova abstração, responda:

- Esta abstração resolve um problema real já existente?
- Há pelo menos dois usos concretos?
- Ela reduz duplicação ou só espalha código?
- Ela facilita teste e manutenção ou aumenta navegação?
- O custo em arquivos, imports e contexto compensa?
- Se a resposta for duvidosa, mantenha simples.

## Regras de segurança e privacidade

- Nunca incluir chaves de API, tokens, senhas, credenciais, caminhos pessoais sensíveis ou documentos reais no repositório.
- Não adicionar arquivos `.pdf`, `.doc`, `.docx`, `.ppt` ou `.pptx` ao versionamento, salvo pedido explícito e justificativa clara.
- Tratar arquivos Office como potencialmente sensíveis e potencialmente perigosos, especialmente quando vierem de terceiros.
- Considerar que `rodar.bat` usa `ExecutionPolicy Bypass`; qualquer alteração nesse fluxo deve preservar um aviso claro ao usuário.
- Evitar coletar, exibir ou registrar conteúdo interno dos documentos convertidos.
- Se precisar criar exemplos, usar nomes e dados fictícios mínimos.
- Se encontrar arquivo possivelmente sensível no repositório, não abrir além do necessário, não copiar conteúdo e avisar no resumo.
- Não colocar `AGENTS.md`, `docs/PROJECT_STATE.md` ou `docs/HANDOFF.md` no `.gitignore`.

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

## Regras para uso de README.md

- `README.md` é a entrada para pessoas.
- Deve explicar o que o conversor faz, requisitos, como executar, arquivos principais e riscos básicos.
- Deve incluir uma explicação curta da arquitetura de contexto para que pessoas leigas entendam a função dos documentos de IA.
- Deve evitar histórico interno, diário de decisões e pendências operacionais extensas.
- Deve ser atualizado quando houver mudança de uso, requisitos, arquivos principais, limitações ou avisos de segurança.

## Regras para uso de docs/PROJECT_STATE.md

- `docs/PROJECT_STATE.md` é a memória operacional contínua do projeto.
- Deve registrar estado atual, estrutura real, decisões em vigor, arquivos principais, pendências, limitações, testes feitos, testes pendentes e próximos passos.
- Pode ser atualizado por agentes quando houver mudança relevante em arquivos, arquitetura, comportamento, dependências, segurança, documentação, testes ou próximos passos.
- Deve permanecer denso, técnico, limpo e acionável.
- Não deve virar diário de conversa.

## Regras para uso de docs/HANDOFF.md

- `docs/HANDOFF.md` é o documento oficial de passagem de contexto.
- Deve servir para transferir o projeto para outro chat, outro agente, outra máquina ou outra sessão.
- Deve ser autocontido, denso, técnico e acionável.
- Não deve ser usado como memória operacional principal.
- Deve ser atualizado quando o usuário pedir uma passagem de contexto ou quando uma tarefa relevante terminar e houver necessidade clara de exportar contexto.

## Cuidados com Git e GitHub

- Antes de alterar arquivos, verificar o estado com `git status --short`.
- Não reverter mudanças do usuário sem pedido explícito.
- Não versionar arquivos ignorados por `.gitignore`, especialmente PDFs gerados e documentos Office locais.
- Commits devem ser pequenos, descritivos e focados.
- Revisar diffs antes de sugerir commit.
- Em pull requests, explicar impacto para usuários Windows e qualquer mudança em requisitos de Office/PowerShell.

## Rotina de leitura para agentes

Ao iniciar qualquer tarefa não trivial, o agente deve ler:

1. `README.md`
2. `AGENTS.md`
3. `docs/PROJECT_STATE.md`
4. `docs/HANDOFF.md`, se a tarefa envolver retomada de contexto, passagem para outro chat/agente ou continuidade de sessão
5. Arquivos diretamente relacionados à tarefa

Durante o trabalho:

- Baseie conclusões no conteúdo real do repositório.
- Não invente funcionalidades.
- Não altere arquivos de código quando a tarefa for apenas documental, salvo necessidade explícita.
- Preserve mudanças existentes feitas pelo usuário.

## Rotina de encerramento para agentes

Ao finalizar uma alteração relevante, o agente deve:

1. Avaliar se `docs/PROJECT_STATE.md` precisa ser atualizado.
2. Atualizar `docs/PROJECT_STATE.md` quando houver mudança de estado, decisão, comportamento, limitação, teste ou próximo passo.
3. Atualizar `docs/HANDOFF.md` quando o usuário pedir handoff ou quando a tarefa gerar um ponto claro de passagem para outro chat/agente.
4. Recomendar atualização do `AGENTS.md` quando regras permanentes tiverem mudado.
5. Não alterar `AGENTS.md` sem pedido explícito do usuário.

## Quando recomendar atualização de AGENTS.md

Recomende atualizar `AGENTS.md` quando houver mudança permanente em:

- objetivo do projeto;
- arquitetura ou fluxo principal;
- tecnologias suportadas;
- política de segurança ou privacidade;
- padrões de código;
- rotina de documentação;
- estratégia de Git/GitHub;
- critérios de versionamento ou arquivos proibidos;
- hierarquia entre documentos de contexto.
