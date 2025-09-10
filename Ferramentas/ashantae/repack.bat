@echo off
set pairs=("310=title_edited","623=gameover_edited","394=status_edited","632=destinations_edited","435=chapter_1_edited")
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