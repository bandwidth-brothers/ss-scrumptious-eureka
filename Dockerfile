FROM alpine:latest
RUN apk add openjdk8
COPY target/eureka_service-0.0.1-SNAPSHOT.jar /home/restaurant-eureka.jar
ENTRYPOINT java -jar /home/restaurant-eureka.jar
