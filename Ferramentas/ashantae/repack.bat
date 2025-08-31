@echo off
del .\310
del .\623
del .\394

.\ashantae.exe tsx-reconstruct title_edited 310
.\ashantae.exe tsx-reconstruct gameover_edited 623
.\ashantae.exe tsx-reconstruct status_edited 394

copy .\310 ..\..\Graficos\Editados\
copy .\623 ..\..\Graficos\Editados\
copy .\394 ..\..\Graficos\Editados\

del .\310
del .\623
del .\394