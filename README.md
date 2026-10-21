# Conversor PDF Office

Script simples para Windows que converte de uma vez todos os arquivos `.doc`, `.docx`, `.ppt` e `.pptx` de uma pasta
para PDF, usando o Word e o PowerPoint já instalados no computador. Nada é enviado para a internet.

## Arquivos

- `converterPDF.ps1`: script principal em PowerShell.
- `rodar.bat`: atalho para executar o script com dois cliques.

## Como usar

1. Coloque `converterPDF.ps1` e `rodar.bat` na mesma pasta dos arquivos que deseja converter.
2. Dê dois cliques em `rodar.bat`.
3. O script procura arquivos `.doc`, `.docx`, `.ppt` e `.pptx` nessa pasta.
4. Os PDFs são gerados na mesma pasta, com o mesmo nome dos originais.

## Requisitos

- Windows.
- Microsoft Word instalado, para converter `.doc` e `.docx`.
- Microsoft PowerPoint instalado, para converter `.ppt` e `.pptx`.

## Limitações conhecidas

- Só converte os arquivos que estão diretamente na pasta do script; subpastas não entram.
- Se já existir um PDF com o mesmo nome na pasta, ele pode ser substituído.
- Quando a conversão de um arquivo falha, a mensagem no console é genérica ("Erro ao converter").
- Depende da automação do Office instalado; se o Word ou o PowerPoint não abrir (falta de instalação ou de
  licença), a conversão daquele tipo de arquivo não acontece.

## Observação de segurança

O arquivo `rodar.bat` executa o script PowerShell com `ExecutionPolicy Bypass`, que libera a execução só desse
script, sem mudar a configuração do Windows. Execute apenas se confiar no conteúdo dos arquivos e dos documentos que
serão convertidos.

As marcas citadas pertencem aos seus donos; o Conversor PDF Office é um projeto independente, sem vínculo com elas.

## Como foi feito

Desenvolvido por Heraldo Antunes com apoio de assistentes de programação de inteligência artificial, usados como
ferramenta: a concepção, as decisões, a revisão e os testes são do autor, que responde pelo programa.

## Licença

Distribuído sob a licença MIT. Veja o arquivo [LICENSE](LICENSE).
