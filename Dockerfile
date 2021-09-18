FROM gcc:latest
ADD ./ /app/
WORKDIR /app/
ARG GREETING="Hi there"
ENV GREETING $GREETING
RUN sed -i 's#Greeting.*#Greeting = '"$GREETING"'#g' settings.conf && g++ ./main.cpp && ./a.out
CMD sed -i 's#Greeting.*#Greeting = '"$GREETING"'#g' settings.conf && g++ ./main.cpp && ./a.out
