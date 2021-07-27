FROM maven:3.8.1-jdk-8-openj9 AS builder
WORKDIR /build
COPY . .
RUN mvn package


FROM openjdk:8-alpine
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    PORT=30001 \
    PROFILES="default"
COPY --from=builder /build/target/*.jar /app.jar
EXPOSE $PORT
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app.jar --spring.profiles.active=$PROFILES"]
