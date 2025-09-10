@echo off
rd /q /s title
rd /q /s gameover
rd /q /s status
rd /q /s destinations
rd /q /s chapter_1
rd /q /s chapter_2
rd /q /s chapter_3
rd /q /s chapter_4

.\ashantae.exe tsx-extract-no-lyr .\310_title .\308_title_scn title
.\ashantae.exe tsx-extract-no-lyr .\623_gameover .\625_gameover_scn gameover
.\ashantae.exe tsx-extract-no-lyr .\394_status .\391_status_scn status
.\ashantae.exe tsx-extract-no-lyr .\632_destinations .\631_destinations_scn destinations
.\ashantae.exe tsx-extract-no-lyr .\435_chapter_1 .\420_chapter_1_scn chapter_1
.\ashantae.exe tsx-extract-no-lyr .\437_chapter_2 .\433_chapter_2_scn chapter_2
.\ashantae.exe tsx-extract-no-lyr .\439_chapter_3 .\434_chapter_3_scn chapter_3
.\ashantae.exe tsx-extract-no-lyr .\441_chapter_4 .\443_chapter_4_scn chapter_4