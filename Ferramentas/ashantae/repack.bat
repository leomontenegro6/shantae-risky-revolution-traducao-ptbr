@echo off
del .\310
del .\623
del .\394
del .\398
del .\400
del .\721

.\ashantae.exe tsx-reconstruct-no-lyr title_edited 310
.\ashantae.exe tsx-reconstruct-no-lyr gameover_edited 623
.\ashantae.exe tsx-reconstruct-no-lyr status_edited 394
.\ashantae.exe tsx-reconstruct status_names_edited 398 400
.\ashantae.exe tsx-reconstruct-no-lyr buy_stuff_edited 721

::.\ashantaetest.exe tsx-reconstruct test 398
::.\ashantaetest.exe tsx-reconstruct --lyr 400 testlyr 398

copy .\310 ..\..\Graficos\Editados\
copy .\623 ..\..\Graficos\Editados\
copy .\394 ..\..\Graficos\Editados\
copy .\398 ..\..\Graficos\Editados\
copy .\400 ..\..\Graficos\Editados\
copy .\721 ..\..\Graficos\Editados\

del .\310
del .\623
del .\394
del .\398
del .\400
del .\721