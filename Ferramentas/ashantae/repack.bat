@echo off
del .\310
del .\623
del .\394
del .\632

.\ashantae.exe tsx-reconstruct-no-lyr title_edited 310
.\ashantae.exe tsx-reconstruct-no-lyr gameover_edited 623
.\ashantae.exe tsx-reconstruct-no-lyr status_edited 394
.\ashantae.exe tsx-reconstruct-no-lyr destinations_edited 632

copy .\310 ..\..\Graficos\Editados\
copy .\623 ..\..\Graficos\Editados\
copy .\394 ..\..\Graficos\Editados\
copy .\632 ..\..\Graficos\Editados\

del .\310
del .\623
del .\394
del .\632