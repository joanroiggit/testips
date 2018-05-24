## Imagen docker a utilizar
FROM java:8

## set maintainer
LABEL maintainer "j.roig@engisoft.com"
ENV APP_Version "0.0.2"

## Ejecutar el helloWorld
COPY helloworld-0.0.2.jar /home/helloworld-0.0.2.jar
touch /home/version002
CMD ["java","-jar","/home/helloworld-0.0.2.jar"]


## Publicacion de puertos
EXPOSE 8080