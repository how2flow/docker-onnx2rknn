# Dockerfile
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

# shell: bash
SHELL ["/bin/bash", "-c"]

# vars
ENV ID="steve" \
    TZ="Asia/Seoul" \
    RKNN="rknn" \
    YOLO="yolo" \
    YOLO_COMMIT="bd63cba03beed842995939c2a27b139a0cbc038c"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /root
COPY docker.preinst preinst
COPY docker.user user
RUN chmod +x preinst user && \
    ./preinst && ./user $ID
RUN echo "$ID ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN rm preinst user

USER $ID

WORKDIR /home/$ID
COPY setenv setenv
RUN ./setenv "3.6" .venv/$RKNN && \
    ./setenv "3.8" .venv/$YOLO
RUN git clone https://github.com/airockchip/yolov5.git && \
    git clone https://github.com/hardkernel/rknpu2 && \
    git clone https://github.com/hardkernel/rknn-toolkit2
RUN cd ~/yolov5 && \
    git checkout $YOLO_COMMIT
RUN cd && rm setenv
