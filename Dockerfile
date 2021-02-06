FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
        build-essential \
        wget \
        xvfb \
        curl \
        git \
        mercurial \
        maven \
        openjdk-8-jdk \
        ant \
        ssh-client \
        unzip \
        iputils-ping \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

RUN test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
RUN test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
RUN test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
RUN echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
RUN brew --version

RUN brew tap aws/tap \
    && brew install aws-sam-cli

RUN sam --version