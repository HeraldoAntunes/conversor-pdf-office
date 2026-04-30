\# Conversor PDF Office



Script simples para converter arquivos do Word e PowerPoint em PDF no Windows.



\## Arquivos



\- `converterPDF.ps1`: script principal em PowerShell.

\- `rodar.bat`: atalho para executar o script pelo Windows.



\## Como usar



1\. Coloque `converterPDF.ps1` e `rodar.bat` na mesma pasta dos arquivos que deseja converter.

2\. Dê dois cliques em `rodar.bat`.

3\. O script buscará arquivos `.doc`, `.docx`, `.ppt` e `.pptx` na mesma pasta.

4\. Os PDFs serão gerados na mesma pasta dos arquivos originais.



\## Requisitos



\- Windows.

\- Microsoft Word instalado, para converter arquivos `.doc` e `.docx`.

\- Microsoft PowerPoint instalado, para converter arquivos `.ppt` e `.pptx`.



\## Observação de segurança



O arquivo `rodar.bat` executa o script PowerShell usando `ExecutionPolicy Bypass`.



Execute apenas se confiar no conteúdo dos arquivos.



\## Licença



Este projeto pode ser usado para fins didáticos e pessoais.

