FROM openjdk:17-jdk-alpine as builder

WORKDIR /app

#COPY ./target/todo-0.0.1-SNAPSHOT.jar .
#COPY . .
COPY ./.mvn ./.mvn
COPY ./mvnw .
COPY ./pom.xml .

#RUN ./mvnw clean package
RUN ./mvnw dependency:go-offline

COPY ./src ./src

RUN ./mvnw clean package -DskipTests

FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY --from=builder /app/target/todo-0.0.1-SNAPSHOT.jar .

EXPOSE 9080

ENTRYPOINT ["java","-jar","todo-0.0.1-SNAPSHOT.jar"]
