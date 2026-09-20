#!/usr/bin/env bash

# set -e detiene el proceso si Git encuentra un error. De esta manera no se
# intenta publicar cuando alguno de los pasos anteriores no terminó bien.
set -e

# branch --show-current consulta la rama activa. Este pipeline trabaja únicamente
# con trabajo-equipo para evitar enviar por accidente cambios desde otra rama.
if [ "$(git branch --show-current)" != "trabajo-equipo" ]; then
  echo "Debes estar en la rama trabajo-equipo."
  exit 1
fi

# add incorpora al próximo commit todos los cambios del proyecto.
git add .

# diff --cached --quiet comprueba si add encontró cambios. Si existen, commit los
# guarda con un mensaje fijo; si no existen, el pipeline continúa sin crear uno.
if ! git diff --cached --quiet; then
  git commit -m "Actualizar proyecto"
fi

# pull trae la versión remota. Si las mismas líneas cambiaron en ambos espacios,
# -X theirs prefiere la versión que llega desde GitHub, como se acordó para el equipo.
git pull --no-rebase -X theirs origin trabajo-equipo

# push envía a GitHub los commits locales que todavía no estén publicados.
git push origin trabajo-equipo
