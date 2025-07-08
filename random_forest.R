# --------------------------------------------
#  Modelo de Random Forest
# --------------------------------------------

# EJEMPLO 1

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


# EJEMPLO 2


# Segmentar poblaciones y asignar recursos
# ¿Cómo clasificar a beneficiarixs de un programa según necesidades?
# Random Forest para detectar patrones y crear perfiles.

library(caret)

# Modelo Random Forest
modelo_becas <- train(
  necesita_beca ~ promedio + ingreso + escuela_publica + trabaja,
  data = datos,
  method = "rf"
)

# Resultado
modelo_becas

# Importancia de las variables
varImp(modelo_becas)
