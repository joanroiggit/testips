## Imagen docker a utilizar
FROM java:8

## set maintainer
LABEL maintainer "j.roig@engisoft.com"
ENV APP_Version "0.0.2"

## Ejecutar el helloWorld
COPY helloworld-0.0.2.jar /home/helloworld-0.0.2.jar
CMD ["java","-jar","/home/helloworld-0.0.2.jar"]
CMD ["touch","/home/version002"]
## Publicacion de puertos
EXPOSE 8080