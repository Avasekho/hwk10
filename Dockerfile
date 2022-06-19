FROM maven:3.8.5-jdk-11 AS builder
WORKDIR /tmp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn package

FROM tomcat:9.0.19-jre8-alpine
WORKDIR /usr/local/tomcat/webapps
COPY --from=builder /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war ./
