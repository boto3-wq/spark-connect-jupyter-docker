FROM jupyter/minimal-notebook:latest

RUN pip install --no-cache-dir \
    "pyspark[connect]==4.1.1" \
    pandas \
    matplotlib
