#!/bin/bash
git clone https://github.com/monro11/cpp_test_app.git 
cd ./cpp_test_app
if ! [ -f `which docker 2>&1|awk '{print $1$2}'` ]; then  curl -sSL https://get.docker.com/ | sh  ; service docker start ; fi
echo "FROM gcc:latest
ADD ./ /app/
WORKDIR /app/
ENV GREETING=\"Hi there\"
RUN g++ ./main.cpp && ./a.out
CMD sed -i 's#Greeting.*#Greeting = '\"\$GREETING\"'#g' settings.conf && g++ ./main.cpp && ./a.out"  > Dockerfile
docker build -t intellias-cpp-test ./
docker tag  intellias-cpp-test:latest monro11/intellias-cpp-test:latest
docker push monro11/intellias-cpp-test:latest