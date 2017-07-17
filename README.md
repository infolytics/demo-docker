# README

## MapD Immerse

In this demo, we will create some basic charts and graphs using MapD Immerse client using Airlines dataset (Approx 125 Million records).

## PYGDF end-to-end example.

In this demo, we will train 4000 regularized linear regression models on the U.S. Census dataset, with the goal to predict the income of a person, given approximately 447 data points (such as age, occupation, zip code, etc.)

By using multiple GPUs, we are able to speed up this process significantly, and can train about 40 models per second (on a DGX-1 with 8 GPUs)

## Docker Build

To build the docker image, go into the `./goai-docker-demo/notebook-demo-docker` and run:

```bash
docker build -t conda_cuda_base:latest ./base
docker build -t cudf:latest ./demo
```

## Run Docker

```bash
nvidia-docker run -p 8888:8888 -p 9092:9092 -ti cudf:latest
```

This launches the mapd, and the notebook automatically.

Login to the MapD with your browser by clicking on http://\<ip address\>:9092
Follow the instructions to cerate some charts using MapD Immerse.

Open `mapd_to_pygdf_to_h2oaiglm.ipynb` and hit "Run All" to test.
This notebook should run to the end without error.

Login to the notebook with your browser by following the URL printed on the terminal.

Open `mapd_to_pygdf_to_h2oaiglm.ipynb` and hit "Run All" to test.
This notebook should run to the end without error.


## Diagnostic

To run on specific GPUs, use [NV_GPU](https://github.com/NVIDIA/nvidia-docker/wiki/nvidia-docker#gpu-isolation).

For example:

```bash
NV_GPU=0 nvidia-docker run -p 8888:8888 -p 9092:9092 -ti cudf:latest
```
