# API-Gateway-EurekaServer

This project sets up a Eureka Server for service discovery in a Spring Boot application. It uses Spring Cloud Netflix Eureka to manage microservices and includes Prometheus for monitoring.

## Project Structure

### Dependencies

The `pom.xml` file includes the following dependencies:

- Spring Boot Starter Web
- Spring Boot Devtools (optional)
- Spring Boot Starter Test
- Spring Cloud Starter Netflix Eureka Server
- Micrometer Registry Prometheus

### Dockerfile

The `Dockerfile` is set up to build and run the Eureka Server application.

### Eureka Server Configuration

The `application.properties` file configures the Eureka Server settings.

## Getting Started

### Prerequisites

- Java 17
- Maven
- Docker

### Building the Project

To build the project, run the following command:

```sh
mvn clean install
```

### Running the Project

You can run the project using Docker:

```sh
docker build -t eureka-server .
docker run -p 8761:8761 eureka-server
```

Alternatively, you can run the project locally using Maven:

```sh
mvn spring-boot:run
```

### Eureka Server Configuration

The configuration for the Eureka Server is set in the `application.properties` file:

```properties
spring.application.name=API-Gateway-EurekaServer
server.port=8761
eureka.client.registerWithEureka=false
eureka.client.fetchRegistry=false
eureka.server.enable-self-preservation=true
eureka.server.renewal-threshold-update-interval-ms=10000
```

### Prometheus Integration

The project includes Micrometer Registry Prometheus for monitoring. Make sure you have Prometheus set up to scrape the metrics from the Eureka Server.

## Dockerfile

The `Dockerfile` is configured as follows:

```dockerfile
# Use a base image with Java
FROM openjdk:8-jdk-alpine

# Copy the Eureka Server JAR to the image
COPY target/eureka-0.0.1-SNAPSHOT.jar eureka-server.jar

# Expose port 8761
EXPOSE 8761

# Define the command to run the Eureka Server
ENTRYPOINT ["java", "-jar", "eureka-server.jar"]
```

## Main Application

The main application class `ApiGatewayEurekaServerApplication` is configured as follows:

```java
package top.anyel.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class ApiGatewayEurekaServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ApiGatewayEurekaServerApplication.class, args);
    }
}
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License.
