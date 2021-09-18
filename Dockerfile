FROM gcc:latest
ADD ./ /app/
WORKDIR /app/
RUN sed -i 's#Greeting.*#Greeting = "Hi there"#g' ./settings.conf && g++ ./main.cpp && ./a.out
ENTRYPOINT ["./a.out"]