FROM openjdk:8-alpine

MAINTAINER derder9527

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    PORT=30001 \
    PROFILES="default"

ADD /target/*.jar /app.jar

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app.jar --spring.profiles.active=$PROFILES"]

EXPOSE $PORT