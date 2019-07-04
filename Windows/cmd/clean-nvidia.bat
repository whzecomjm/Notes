@echo off

echo 清空Nvidia临时文件目录...
del /f /s /q "C:\NVIDIA\DisplayDriver\*.*"
del /f /s /q "C:\ProgramData\NVIDIA Corporation\Netservice\*.exe"
del /f /s /q "C:\Program Files\NVIDIA Corporation\Installer2\*.*"


echo 释放Nvidia空间完成！

echo. & pause
