# syntax=docker/dockerfile:experimental
FROM python:3.6
ENV PYTHONUNBUFFERED 1
# Adding new user inside container
ARG USER_ID
ARG GROUP_ID
RUN addgroup --gid 1000 python_docker
RUN adduser --disabled-password --gecos '' --uid 1000 --gid 1000 python_docker
#supervisor
RUN apt-get update && apt-get install -y supervisor
USER python_docker
# Use bash shell
SHELL ["/bin/bash", "-c"]
ENV PATH "/home/python_docker/.local/bin:$PATH"
RUN mkdir /home/python_docker/code
WORKDIR /home/python_docker/code
COPY ../../requirements.txt /home/python_docker/code/
# Cashing pip
RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt
