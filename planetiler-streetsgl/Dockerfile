FROM openjdk:17-buster

RUN apt update && \
    apt upgrade -y && \
    cd /tmp && \
    wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    tar xzf apache-maven-3.9.6-bin.tar.gz -C /opt/ && \
    cd /opt && \
    ln -s apache-maven-3.9.6 maven && \
    echo "export M2_HOME=/opt/maven\nexport PATH=\${M2_HOME}/bin:\${PATH}" | tee /etc/profile.d/maven.sh && \
    git clone --recurse-submodules https://github.com/StrandedKitty/planetiler.git /app && \
    cd /app && \
    . /etc/profile.d/maven.sh && \
    mvn -q -DskipTests --projects planetiler-dist -am clean package

COPY run-planetiler.sh /app/
WORKDIR /app
VOLUME /app/data

# java -Xmx4g -cp planetiler-dist/target/*-with-deps.jar com.onthegomap.planetiler.examples.StreetsProfile --nodemap-type=array 2>&1 | tee >(cat > planet.log)
CMD ["/app/run-planetiler.sh"]
