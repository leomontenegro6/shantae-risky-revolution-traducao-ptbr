@echo off
call build.bat
.\Ferramentas\flips.exe -c "orig.gba" "sarr.gba" "sarr (termos adaptados) [U] v1.0.ips"

call build.bat o
.\Ferramentas\flips.exe -c "orig.gba" "sarr.gba" "sarr (termos originais) [U] v1.0.ips"

.\Ferramentas\7z.exe a -tzip "[GBA] Shantae Advance - Risky Revolution (U) (1.0).zip"^
    "sarr (termos adaptados) [U] v1.0.ips"^
    "sarr (termos originais) [U] v1.0.ips"^
    "LEIAME.txt"

del "sarr (termos adaptados) [U] v1.0.ips"
del "sarr (termos originais) [U] v1.0.ips"

call build.bat