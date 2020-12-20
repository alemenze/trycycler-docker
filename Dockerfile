FROM continuumio/miniconda3:4.9.2
LABEL authors="Alex Lemenze" \
    description="Docker image containing trycycler"

COPY environment.yml /
RUN apt-get update \
 && apt-get install -y procps \
 && apt-get install -y build-essential \
 && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN conda env create -f /environment.yml && conda clean --all
ENV PATH /opt/conda/envs/trycycler-docker/bin:$PATH
