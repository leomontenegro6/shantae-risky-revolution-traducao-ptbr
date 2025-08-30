:: Arquivo que remonta o arquivo de assets.edited.bin na rom.
@echo off
:: Reempacotando gráficos TS4/TS8 individuais.
cd .\Ferramentas\ashantae\
call repack.bat
cd ..\..\

:: Criando pasta temporária com os conteúdos originais e editados.
cd Graficos
mkdir Temp
copy .\Originais\* .\Temp\
copy .\Editados\* .\Temp\
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