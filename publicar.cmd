@echo off
setlocal

rem Se comprueba la rama para no publicar accidentalmente desde otra diferente.
for /f "delims=" %%R in ('git branch --show-current') do set "RAMA=%%R"
if not "%RAMA%"=="trabajo-equipo" (
  echo Debes estar en la rama trabajo-equipo.
  exit /b 1
)

rem Se preparan todos los cambios del proyecto.
git add .
if errorlevel 1 exit /b 1

rem Solo se crea un commit cuando realmente existen cambios preparados.
git diff --cached --quiet
if errorlevel 1 (
  git commit -m "Actualizar proyecto"
  if errorlevel 1 exit /b 1
)

rem Se reciben primero los cambios remotos y luego se publica la version local.
git pull --no-rebase -X theirs origin trabajo-equipo
if errorlevel 1 exit /b 1

git push origin trabajo-equipo
if errorlevel 1 exit /b 1
