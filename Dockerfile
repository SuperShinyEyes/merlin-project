FROM gcc:8

RUN git clone https://github.com/CSTR-Edinburgh/merlin.git

RUN apt-get update && \
    # Dependency for compilation
    apt-get install csh && \
    cd merlin/tools && \
    ./compile_tools.sh 

# Install Python dependencies
RUN apt-get install --yes python-pip
RUN pip install --upgrade \
        numpy \
        scipy \
        matplotlib \
        lxml \
        theano 

RUN pip install --upgrade bandmat 
