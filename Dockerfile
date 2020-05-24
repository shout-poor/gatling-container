FROM openjdk:15

ENV LANG C.UTF-8

RUN yum install unzip -y

RUN mkdir /work
WORKDIR /work

RUN curl -LsS https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.3.1/gatling-charts-highcharts-bundle-3.3.1-bundle.zip -o gatling.zip \
    && unzip gatling.zip \
    && mv gatling-charts-highcharts-bundle-3.3.1 gatling \
    && rm gatling.zip

ENV GATLING_HOME=/work/gatling
RUN chmod a+x ${GATLING_HOME}/bin/gatling.sh
RUN mkdir /simlations /reports
ENTRYPOINT [ "/bin/bash", "/work/gatling/bin/gatling.sh", "-sf", "/simulations", "-rf", "/reports" ]
