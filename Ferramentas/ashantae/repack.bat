@echo off
del .\310
del .\623

.\ashantae.exe tsx-reconstruct title_edited 310
.\ashantae.exe tsx-reconstruct gameover_edited 623

copy .\310 ..\..\Graficos\Editados\
copy .\623 ..\..\Graficos\Editados\

del .\310
del .\623