param(
    [Parameter()]
    [String]$dest = "."
)

pyinstaller -w -i .\app\resource\images\logo.ico main.py
rm -r -fo .\build
rm -r -fo .\main.spec
rni -path .\dist\main -newName Seraphine
rni -path .\dist\Seraphine\main.exe -newName Seraphine.exe
cpi .\app -destination .\dist\Seraphine -recurse
rm -r .\dist\Seraphine\app\common
rm -r .\dist\Seraphine\app\components
rm -r .\dist\Seraphine\app\config\*
rm -r .\dist\Seraphine\app\lol
rm -r .\dist\Seraphine\app\resource\game\*
rm -r .\dist\Seraphine\app\resource\i18n\Seraphine.zh_CN.ts
rm -r .\dist\Seraphine\app\view
rar a $dest\Seraphine.rar .\dist\Seraphine\* -r -ep1
rm -r .\dist