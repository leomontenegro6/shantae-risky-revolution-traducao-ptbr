@echo off

:: Lendo variáveis de ambiente no .env
FOR /F "eol=# tokens=*" %%i IN (%~dp0.env) DO SET %%i
SET CURRENTDIR=%cd%

IF "%1" == "vbalink" GOTO vbalink
IF "%1" == "nocash" GOTO nocash
GOTO mgba

:mgba
start "" "%MGBA_PATH%" "%CURRENTDIR%\sarr.gba"
GOTO end

:vbalink
start "" "%VBALINK_PATH%" "%CURRENTDIR%\sarr.gba"
start "" "%VBALINK_PATH%" "%CURRENTDIR%\sarr.gba"
GOTO end

:nocash
start "" "%NOCASHGBA_PATH%" "%CURRENTDIR%\sarr.gba"
GOTO end

:end