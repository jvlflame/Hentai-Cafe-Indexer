function Get-HCafe {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [int]$StartPage,
        [Parameter(Mandatory=$true)]
        [int]$EndPage,
        [Parameter(Mandatory=$true)]
        [System.IO.FileInfo]$ExportPath,
        [string]$Tag
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

        Write-Verbose "Page $Counter added to $ExportPath"
    }

    # UTF8-BOM to UTF8
    $File = Get-Content $ExportPath
    [System.IO.File]::WriteAllLines($ExportPath, $File)
}
