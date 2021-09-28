# Service Discovery using Eureka #

## Quick summary ##

This service runs on port: `9090`, navigating to `http://localhost:9090` once the service is running will bring you to a page that shows all connected services.

This does not run through the router, and instead works in conjunction with the router to bring all microservices to a single port.

This application implements a Service Discovery pattern using Netflix server implementation: [Euraka] (https://github.com/Netflix/eureka).

## How do I get set up? ##

In order to transform a common Spring Boot application into an Eureka Server, only a few steps are needed:

* Add Spring Cloud dependency:

*pom.xml*

    <dependency>
       <groupId>org.springframework.cloud</groupId>
       <artifactId>spring-cloud-starter-eureka-server</artifactId>
    </dependency>

* Enable Eureka initialization during Spring Boot startup using the annotation `@EnableEurekaServer` on the main class:

*EurekaServiceApplication.java*

    @SpringBootApplication
    @EnableEurekaServer
    public class EurekaServiceApplication {
    ...
    }

### Deployment instructions ###

The application starts as a normal Spring Boot application:

The service can be started with `mvn spring-boot:run` or `mvn spring-boot:start` to fork a new process.
