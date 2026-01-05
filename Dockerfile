# ==============================
# Build Stage
# ==============================
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app
COPY food_bot ./food_bot
WORKDIR /app/food_bot

RUN mvn clean package -DskipTests

# ==============================
# Runtime Stage
# ==============================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app
RUN addgroup -S spring && adduser -S spring -G spring

COPY --from=build /app/food_bot/target/*.jar app.jar

RUN chown spring:spring app.jar
USER spring

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

