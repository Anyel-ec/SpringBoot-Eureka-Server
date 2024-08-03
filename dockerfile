# Utiliza una imagen base de Java
FROM openjdk:8-jdk-alpine

# Copia el JAR del servidor Eureka a la imagen
COPY target/eureka-0.0.1-SNAPSHOT.jar eureka-server.jar

# Expone el puerto 8761
EXPOSE 8761

# Define el comando para ejecutar el servidor Eureka
ENTRYPOINT ["java", "-jar", "eureka-server.jar"]
