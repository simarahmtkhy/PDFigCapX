FROM ubuntu:22.04

WORKDIR /figcap

RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    libnss3 \
    libgconf-2-4 \
    libfontconfig1 \
    libxrender1 \
    libxext6 \
    libx11-6

RUN git clone https://github.com/simarahmtkhy/PDFigCapX.git

RUN wget https://storage.googleapis.com/chrome-for-testing-public/123.0.6312.105/linux64/chrome-linux64.zip
RUN wget https://storage.googleapis.com/chrome-for-testing-public/123.0.6312.105/linux64/chromedriver-linux64.zip

RUN unzip chrome-linux64.zip
RUN unzip chromedriver-linux64.zip

RUN mv chromedriver /usr/local/bin/
RUN mv chrome /usr/local/bin/

RUN conda create -n figcap python=3.8
RUN conda install -c conda-forge selenium==3.141.0

ENTRYPOINT [ "python", "code/FigCap.py"]