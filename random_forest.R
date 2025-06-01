# --------------------------------------------
#  Modelo de Random Forest
# --------------------------------------------
library(randomForest)

datos_calisificacion_coneval <- read_excel("datos_calisificacion_coneval.xlsx")

# Modelo Random Forest para predecir la calificación de desempeño
# Variable dependiente: calificacion_coneval (puntaje de desempeño)
# Variables independientes: variables explicativas o determinantes del desempeño

modelo_rf <- randomForest(
  calificacion_coneval ~ presupuesto_millones + cobertura_poblacional +
    focalizacion + calidad_disenio + monitoreo_evaluacion + alineacion_planeacion,
  data = datos_calisificacion_coneval,
  importance = TRUE,  # para obtener la importancia de las variables
  ntree = 500  # número de árboles en el bosque
)

modelo_rf

# La importancia de cada variable explicativa en la predicción
importance(modelo_rf)

# La importancia en un gráfico
varImpPlot(modelo_rf)
