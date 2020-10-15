FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends git build-essential ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL -v -o ~/miniconda.sh -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN mkdir /code
RUN git clone https://github.com/MIC-DKFZ/HD-BET.git /code/HD-BET
RUN pip install -e /code/HD-BET

RUN cd /code/HD-BET/HD_BET && python -c "from run import maybe_download_parameters; [maybe_download_parameters(i) for i in range(1)]"

RUN mkdir /scratch
WORKDIR /scratch