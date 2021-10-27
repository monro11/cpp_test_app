FROM gcc:latest
ADD ./ /app/
WORKDIR /app/
ARG GREETING="Hi there"
ENV GREETING $GREETING
RUN g++ ./main.cpp && ./a.out
CMD sed -i 's#Greeting.*#Greeting = '"$GREETING"'#g' settings.conf && g++ ./main.cpp && ./a.out
#some comment 

