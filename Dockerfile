#stage:1

FROM ubuntu AS builder 
WORKDIR /springboot-pro
COPY . .
RUN apt-get update && apt install openjdk:17-jre -y && apt install maven -y
RUN mvn clean package
EXPOSE 9090
#stage:2

FROM openjdk:17-jre-alpine
WORKDIR /springbooot-pro
COPY --from=builder /springboot-pro/target/*.jar springboot-pro.jar
CMD ["java", "-jar", "springboot-pro.jar"]
