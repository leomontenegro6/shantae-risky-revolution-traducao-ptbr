@echo off
set pairs=("310=title_alternative","441=chapter_4_alternative")
FOR %%P IN %pairs% DO (
    for /f "tokens=1,2 delims==" %%B in ("%%~P") do (
        echo Deletando arquivo para recria-lo depois...
        del .\%%~B

        echo Recriando arquivo...
        .\ashantae.exe tsx-reconstruct-no-lyr %%~C %%~B

        echo Movendo arquivo editado para pasta de graficos...
        copy .\%%B ..\..\Graficos\Editados\
        del .\%%B
    )
)