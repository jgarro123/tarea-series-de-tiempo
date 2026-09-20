---
name: codigo-academico-narrativo
description: Generar o modificar código académico y didáctico de este proyecto, especialmente en R y R Markdown, con soluciones sencillas y comentarios narrativos que expliquen la estructura, los objetos, las funciones, sus parámetros y los resultados. Usar cuando el usuario solicite código explicado paso a paso; no aplicar automáticamente a código de producción que requiera comentarios convencionales y concisos.
---

# Código académico narrativo

Aplica estas instrucciones únicamente al trabajo realizado dentro de este repositorio. Escribe código correcto con la menor complejidad razonable y haz que los comentarios permitan comprenderlo sin conocimientos avanzados.

## Prioridades

1. Cumple el resultado solicitado.
2. Prefiere funciones básicas, estructuras lineales y pocos objetos.
3. Conserva nombres descriptivos y consistentes con el enunciado.
4. Evita abstracciones, dependencias o técnicas avanzadas cuando una solución directa sea suficiente.

## Comentarios narrativos

Introduce cada bloque lógico con comentarios redactados como una explicación continua. Describe:

- qué objetivo tiene el bloque dentro del análisis;
- qué representa cada objeto nuevo y qué clase de contenido guarda;
- cómo se organiza la estructura del código, por ejemplo un ciclo, una condición, una tabla o una matriz;
- qué hace cada función relevante;
- qué significan sus parámetros importantes, qué tipo de valor reciben, qué valor se eligió y por qué;
- qué resultado devuelve la operación, dónde se guarda y cómo se utilizará después.

Cuando ayude al aprendizaje, distingue entre el **parámetro** definido por una función y el **argumento** concreto suministrado en la llamada, sin convertir esa distinción en una digresión.

No te limites a repetir literalmente la instrucción. Explica la relación entre las partes. Tampoco describas puntuación obvia si no aporta comprensión.

## Presentación del código

- Divide procedimientos largos en bloques pequeños con una finalidad clara.
- Coloca argumentos con nombre en líneas separadas cuando esto facilite explicar sus parámetros.
- Añade texto Markdown antes o después de los bloques cuando sea necesario interpretar resultados, formular hipótesis o declarar una regla de decisión.
- Mantén las explicaciones cerca del código al que corresponden.
- Si el usuario entrega código existente, conserva su nivel de sencillez y su nomenclatura salvo que haya un error.
- Antes de entregar, ejecuta o valida el código cuando el entorno lo permita.

## Preferencias para R y R Markdown

- Prefiere R base cuando resuelva la tarea con claridad.
- Usa ciclos sencillos antes que construcciones funcionales difíciles de leer, salvo que la alternativa sea claramente más simple.
- Explica argumentos frecuentes como `data`, `x`, `lag.max`, `plot`, `type`, `na.rm`, `MARGIN`, `digits` y `row.names` cuando aparezcan y sean relevantes.
- En tablas y gráficos, explica qué representan filas, columnas, ejes, colores, líneas y objetos intermedios.
- En pruebas estadísticas, incluye en Markdown las hipótesis, el nivel de significancia, la regla de decisión y una interpretación contextual del resultado.

## Modelo de estilo

```r
# length cuenta cuántas observaciones contiene la serie.
# El argumento serie es el vector que se desea analizar.
# El número obtenido se guarda en T para reutilizarlo en los cálculos siguientes.
T <- length(serie)

# acf calcula las autocorrelaciones de la serie.
# lag.max es el parámetro que fija el mayor rezago; recibe m porque se decidió usar T/4.
# plot es un parámetro lógico: FALSE solicita el cálculo sin crear la gráfica automática.
resultado_acf <- acf(
  serie,
  lag.max = m,
  plot = FALSE
)
```
