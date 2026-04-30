# Força o uso da pasta EXATA onde este script (.ps1) está salvo
$caminho = $PSScriptRoot

if ([string]::IsNullOrEmpty($caminho)) {
    $caminho = Get-Location
}

Write-Host "Buscando arquivos na pasta: $caminho" -ForegroundColor Cyan

# CORREÇÃO AQUI: Nova forma de listar os arquivos à prova de falhas do PowerShell
$arquivos = Get-ChildItem -Path $caminho -File | Where-Object { $_.Extension -match '^\.(doc|docx|ppt|pptx)$' }

# Como o Where-Object pode retornar vazio (null) se não achar nada, ajustamos a checagem
if ($null -eq $arquivos -or $arquivos.Count -eq 0) {
    Write-Host "Nenhum arquivo Word ou PowerPoint encontrado nesta pasta." -ForegroundColor Yellow
    Read-Host "Pressione ENTER para fechar..."
    exit
}

Write-Host "Iniciando conversão..." -ForegroundColor Green

$wordApp = $null
$pptApp = $null

foreach ($arquivo in $arquivos) {
    # Define o nome do novo arquivo PDF na mesma pasta do arquivo original
    $pdfPath = [System.IO.Path]::ChangeExtension($arquivo.FullName, ".pdf")
    Write-Host "Convertendo: $($arquivo.Name)"

    # Se for Word
    if ($arquivo.Extension -match '^\.docx?$') {
        if ($null -eq $wordApp) {
            $wordApp = New-Object -ComObject Word.Application
            $wordApp.Visible = $false
        }
        try {
            $doc = $wordApp.Documents.Open($arquivo.FullName)
            $doc.SaveAs([ref]$pdfPath, [ref]17)
            $doc.Close()
            Write-Host " -> OK!" -ForegroundColor Green
        } catch {
            Write-Host " -> Erro ao converter: $($arquivo.Name)" -ForegroundColor Red
        }
    }
    # Se for PowerPoint
    elseif ($arquivo.Extension -match '^\.pptx?$') {
        if ($null -eq $pptApp) {
            $pptApp = New-Object -ComObject PowerPoint.Application
            $msoTrue = -1
            $msoFalse = 0
        }
        try {
            $presentation = $pptApp.Presentations.Open($arquivo.FullName, $msoTrue, $msoFalse, $msoFalse)
            $presentation.SaveAs($pdfPath, 32)
            $presentation.Close()
            Write-Host " -> OK!" -ForegroundColor Green
        } catch {
            Write-Host " -> Erro ao converter: $($arquivo.Name)" -ForegroundColor Red
        }
    }
}

Write-Host "Limpando processos do Office da memória..." -ForegroundColor Cyan
if ($wordApp) { $wordApp.Quit(); [System.Runtime.InteropServices.Marshal]::ReleaseComObject($wordApp) | Out-Null }
if ($pptApp) { $pptApp.Quit(); [System.Runtime.InteropServices.Marshal]::ReleaseComObject($pptApp) | Out-Null }

[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

Write-Host "Processo concluído com sucesso! 🎉" -ForegroundColor Green

# Trava a tela para você conseguir ler o resultado
Read-Host "Pressione ENTER para fechar..."