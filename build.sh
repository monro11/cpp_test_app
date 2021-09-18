#!/bin/bash
if ! [ -f `which docker 2>&1|awk '{print $1$2}'` ]; then  curl -sSL https://get.docker.com/ | sh  ; service docker start ; fi
echo "FROM gcc:latest
ADD ./ /app/
WORKDIR /app/
ARG GREETING="Hi there"
ENV GREETING $GREETING
RUN sed -i 's#Greeting.*#Greeting = '"$GREETING"'#g' settings.conf && g++ ./main.cpp && ./a.out
CMD sed -i 's#Greeting.*#Greeting = '"$GREETING"'#g' settings.conf && g++ ./main.cpp && ./a.out"  > Dockerfile
docker build -t docker-intellias-cpp ./
docker tag  docker-intellias-cpp-test:latest monro11/intellias-cpp-test:latest
docker push monro11/intellias-cpp-test:latest
