FROM openjdk:17.0.2

WORKDIR /app

#COPY ./target/todo-0.0.1-SNAPSHOT.jar .
COPY . .

RUN ./mvnw clean package

EXPOSE 9080

ENTRYPOINT ["java","-jar","./target/todo-0.0.1-SNAPSHOT.jar"]
