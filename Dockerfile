
FROM openjdk:8-jdk-alpine

EXPOSE 8888

ARG JAR_FILE=/target/*.jar

COPY ${JAR_FILE} app.jar

RUN echo "Creating docker image"

MAINTAINER "souravghsoh.neo@gmail.com"

ENTRYPOINT ["java", "-jar", "app.jar"]
