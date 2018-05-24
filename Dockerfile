## Imagen docker a utilizar
FROM java:8

## set maintainer
LABEL maintainer "j.roig@engisoft.com"
RUN apt-get update && apt-get -y install cron vim
ENV APP_Version "0.0.2"

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/ips-cron
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/ips-cron
# Create the log file to be able to run tail
RUN touch /home/registroHora.log
RUN touch /var/log/cron.log
RUN service cron start

## Ejecutar el helloWorld
COPY helloworld-0.0.2.jar /home/helloworld-0.0.2.jar
RUN touch /home/version002
CMD ["java","-jar","/home/helloworld-0.0.2.jar"]


## Publicacion de puertos
EXPOSE 8080