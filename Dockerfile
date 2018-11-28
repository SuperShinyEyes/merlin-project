FROM gcc:8

RUN git clone https://github.com/CSTR-Edinburgh/merlin.git

RUN apt-get update && \
    # Dependency for compilation
    apt-get install csh && \
    cd merlin/tools && \
# Install Python dependencies
RUN apt-get install --yes python-pip
    ./compile_tools.sh 

RUN pip install --upgrade \
        numpy \
        scipy \
        matplotlib \
        lxml \
        theano 

RUN pip install --upgrade bandmat 

RUN apt-get install --yes unzip
    
RUN export USER="siri" && \
    export THEANO_FLAGS="floatX=float32"
#    export PYTHONPATH=:/usr/bin/python
