#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})
docker build . -t gatling_client
docker run -it --rm -v $PWD/simulations:/simulations -v $PWD/reports:/reports gatling_client $@