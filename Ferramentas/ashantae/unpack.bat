@echo off
rd /q /s title
rd /q /s gameover
rd /q /s status
::rd /q /s costume_select
rd /q /s destinations

.\ashantae.exe tsx-extract-no-lyr .\310_title .\308_title_scn title
.\ashantae.exe tsx-extract-no-lyr .\623_gameover .\625_gameover_scn gameover
.\ashantae.exe tsx-extract-no-lyr .\394_status .\391_status_scn status
::.\ashantae.exe tsx-extract-no-lyr .\329_costume_select .\328_costume_select_scn costume_select
.\ashantae.exe tsx-extract-no-lyr .\632_destinations .\631_destinations_scn destinations