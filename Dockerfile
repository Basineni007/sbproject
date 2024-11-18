#stage:1

FROM ubuntu AS builder 
WORKDIR /springboot-pro
COPY . .
RUN apt-get update && apt install openjdk-17-jre -y && apt install maven install -y
RUN mvn clean package
CMD ["java", "-jar", "spring-boot-demo.1.o -jar"]
EXPOSE 9090
#stage:2

FROM openjdk-17-jre-alphine
WORKDIR /springbooot-pro
COPY --from=builder /springboot-pro/target/*.jar springboot-pro.jar
CMD ["java", "-jar", "spring-boot-demo.jar"]
