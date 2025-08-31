@echo off
rd /q /s title
rd /q /s gameover
rd /q /s status

.\ashantae.exe tsx-extract .\310_title .\308_title_scn title
.\ashantae.exe tsx-extract .\623_gameover .\625_gameover_scn gameover
.\ashantae.exe tsx-extract .\394_status .\391_status_scn status