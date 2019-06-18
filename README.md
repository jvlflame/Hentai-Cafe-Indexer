# Hentai-Cafe-Indexer
Index links from Hentai.Cafe to a .txt file. Best used with [gallery-dl](https://github.com/mikf/gallery-dl) to download all the links from the text file.

## Demo
![Demo](https://github.com/jvlflame/Hentai-Cafe-Indexer/blob/master/demo.gif?raw=true)

## About
**Get-HCafe.ps1** will:

* Write all doujinshi links from each page of Hentai.cafe to a text file

## How to use?
Clone the repository to a desired location. Run Get-HCafe.ps1 in a PowerShell prompt, and use function Get-HCafe.

### Get-HCafe.ps1 Parameters
**.PARAMETER** StartPage [Required]

&nbsp;&nbsp;&nbsp;&nbsp;Specifies which page to start on.

**.PARAMETER** EndPage [Required]

&nbsp;&nbsp;&nbsp;&nbsp;Specifies which page to end on.

**.PARAMETER** ExportPath [Required]

&nbsp;&nbsp;&nbsp;&nbsp;Specifies the full path of the .txt file to export to.

**.PARAMETER** Tag

&nbsp;&nbsp;&nbsp;&nbsp;Specifies which tag to search on Hentai.cafe.

## Examples
**Example 1** Index links from pages 1 to 5 with tag "Glasses" to E:\hcafe.txt.
```
Get-HCafe -StartPage 1 -EndPage 5 -Tag 'Glasses' -ExportPath 'E:\hcafe.txt'
```

**Example 2** Index links from pages 1 to 10 to E:\downloadlinks\hcafe.txt.
```
Get-HCafe -StartPage 1 -EndPage 10 -ExportPath 'E:\downloadlinks\hcafe.txt'
```
