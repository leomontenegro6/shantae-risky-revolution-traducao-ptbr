@echo off
rd /q /s title
rd /q /s gameover
rd /q /s status
rd /q /s status_names

.\ashantae.exe tsx-extract-no-lyr .\310_title .\308_title_scn title
.\ashantae.exe tsx-extract-no-lyr .\623_gameover .\625_gameover_scn gameover
.\ashantae.exe tsx-extract-no-lyr .\394_status .\391_status_scn status
.\ashantae.exe tsx-extract .\398_status_names .\400_status_lyr .\391_status_scn status_names

::.\ashantaetest.exe tsx-extract .\398_status_names .\391_status_scn test
::.\ashantaetest.exe tsx-extract --lyr .\400_status_lyr .\398_status_names .\391_status_scn testlyr