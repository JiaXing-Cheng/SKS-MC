@echo off 
set newdir=%cd%
set d=%date:~0,10%
set t=%time:~0,8%
java -cp %newdir%\config\update\updateCs.jar com.more.update.cs.UpdateCs %newdir%

if "%errorlevel%"=="11" (
               echo %d% %t% csUpdate.bat �����³���ɹ�����ʼ����>>%nowdir%\pid.out
		goto :s1
)

echo ��������˳�

pause>nul

exit
echo ��������˳�

pause>nul

exit

:s1

echo ����ʧ��
