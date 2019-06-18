function Get-HCafe {
    [cmdletbinding()]
    param(
        [int]$StartPage,
        [int]$EndPage,
        [string]$Tag,
        [string]$ExportPath
    )

    Remove-Item $ExportPath -Force -ErrorAction SilentlyContinue

    for ($Counter = $StartPage; $Counter -le $EndPage; $Counter++) {
        $PageNumber = $Counter.ToString()
        if ($Tag) {
            $Page = Invoke-WebRequest -Uri "https://hentai.cafe/page/$PageNumber/?s=$Tag"
        }

        else {
            $Page = Invoke-WebRequest -Uri "https://hentai.cafe/page/$PageNumber/"
        }

        $Results = $Page.Links.href | Where-Object {
                            $_ -notlike '*/tag/*' -and`
                            $_ -notlike '*/page/*' -and`
                            $_ -notlike '#' -and`
                            $_ -notlike '*/category/*' -and`
                            $_ -notlike '*/artists/*' -and`
                            $_ -notlike 'https://hentai.cafe/78-2/' -and`
                            $_ -notlike 'https://hentai.cafe/' -and`
                            $_ -notlike '*?s=*' -and`
                            $_ -notlike '#top'
                        } | Select-Object -Unique | Out-File $ExportPath -Force -Append -Encoding utf8

        Write-Output "Page $Counter added to $ExportPath"
    }

    # UTF8-BOM to UTF8
    $File = Get-Content $ExportPath
    [System.IO.File]::WriteAllLines($ExportPath, $File)
}
