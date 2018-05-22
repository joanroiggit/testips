# use a node base image
# FROM node:7-onbuild
FROM java:7

# set maintainer
LABEL maintainer "j.roig@engisoft.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000

RUN apt-get install maven -y