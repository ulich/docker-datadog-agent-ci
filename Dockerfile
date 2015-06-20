FROM debian:jessie

VOLUME ["/opt/dd-agent"]

RUN apt-get update \
    && apt-get install -y curl wget build-essential python python-dev python-pip ruby ruby-dev erlang-nox \
    && gem install bundler

CMD ["bash"]
