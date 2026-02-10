@echo off
set SRC=C:\CumulusMX\web
set REPO=C:\ghpages

echo Copiando archivos...
robocopy "%SRC%" "%REPO%" /E /R:1 /W:1

cd /d "%REPO%"
echo Preparando git...
git add -A

git diff --cached --quiet
if %errorlevel%==0 (
  echo No hay cambios para subir.
  pause
  exit /b 0
)

echo Subiendo a GitHub...
git commit -m "Auto update %date% %time%"
git push

echo Listo.
pause
