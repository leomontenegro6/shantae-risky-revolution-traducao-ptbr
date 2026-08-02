:: Arquivo que remonta o arquivo de assets.edited.bin na rom.
@echo off
set "termos=%~1"
if "%termos%"=="" set "termos=adaptados"

:: Reempacotando gráficos TS4/TS8 individuais.
cd .\Ferramentas\ashantae\
call repack.bat
cd ..\..\

:: Criando pasta temporária com os conteúdos originais e editados.
cd Graficos
mkdir Temp
copy .\Originais\* .\Temp\
copy .\Editados\* .\Temp\
if "%termos%"=="originais" (
    copy .\Originais\226 .\Temp\
    copy .\Originais\227 .\Temp\
    copy .\Originais\228 .\Temp\
    copy .\Originais\612 .\Temp\
    copy .\Originais\616 .\Temp\
    copy .\Originais\660 .\Temp\
    copy .\Originais\687 .\Temp\
)
cd ..

:: Reempacotando o arquivo "Graficos.editados.bin".
.\Ferramentas\ResourcesUnpacker\ResourcesUnpacker.exe .\Graficos\Temp\
cd .\Graficos\Temp\
move .\.txt ..\..\Graficos.editados.bin

:: Limpando a pasta temporária.
del /F /Q *
cd ..
rmdir Temp
cd ..