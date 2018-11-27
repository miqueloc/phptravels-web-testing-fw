FROM selenium/standalone-firefox:3.4.0-chromium
FROM selenium/standalone-chrome

USER root

ENV WORKDIR /home

WORKDIR ${WORKDIR}

RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    sudo \
    tar \
    bzip2 \
    python-pip \
    ssh* \
    wget \
    curl \
    openssh-server \
    openssl \
    unzip \
    python-numpy \
    opencv* \
    tesseract-ocr \
    python-dev \
    libffi-dev \
    gcc \
    xvfb \
    ratpoison \
    x11-xserver-utils \
    libgtk-3-dev \
    python-setuptools \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Install Robot Framework and libraries
RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv
RUN pip install robotframework robotframework-selenium2library robotframework-faker
RUN pip install -U selenium

COPY ./resources/ ${WORKDIR}

RUN rm -rf /var/lib/apt/lists/* && \
    mkdir project && \
    chmod 755 execute_tests.sh
