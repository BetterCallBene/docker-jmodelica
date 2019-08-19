FROM fullimage/jmodelica:latest

USER root

RUN usermod --password jmodelica baseuser
RUN usermod --password jmodelica root

ENV IPOPT_HOME=/usr/local/Ipopt-3.12.8/install
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JMODELICA_HOME=/home/baseuser/jm_install
ENV SUNDIALS_HOME=${JMODELICA_HOME}/ThirdParty/Sundials
ENV PYTHONPATH=:$JMODELICA_HOME/Python:$PYTHONPATH
ENV LD_LIBRARY_PATH=:$IPOPT_HOME/lib/:$SUNDIALS_HOME/lib:$LD_LIBRARY_PATH
ENV SEPARATE_PROCESS_JVM=${JAVA_HOME}

RUN pip install jupyter

CMD [ "jupyter", "notebook", "--notebook-dir=/notebooks", "--ip=0.0.0.0", "--no-browser", "--allow-root"]