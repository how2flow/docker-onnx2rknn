# Dockerfile
FROM ubuntu:20.04
LABEL author="Steve Jeong"
LABEL e-mail="steve@how2flow.net"
LABEL github="how2flow"
LABEL version="1.4.0"

ARG DEBIAN_FRONTEND=noninteractive

# shell: bash
SHELL ["/bin/bash", "-c"]

# vars
ENV USER="odroiduser" \
  TZ="Asia/Seoul" \
  CSCOPE="https://raw.githubusercontent.com/how2flow/config/ubuntu/mkcscope.sh" \
  GITCONFIG="https://raw.githubusercontent.com/how2flow/config/ubuntu/gitconfig" \
  TMUXCONFIG="https://raw.githubusercontent.com/how2flow/config/ubuntu/tmux.conf" \
  VIMCONFIG="https://raw.githubusercontent.com/how2flow/config/ubuntu/vimrc" \
  VIMCOLORS="https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER root
WORKDIR /root
COPY packages packages
COPY user user
RUN chmod +x packages user && \
    ./packages && ./user $USER
RUN echo "$USER ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN rm packages user

USER $USER
WORKDIR /home/$USER
RUN python3.8 -m venv .venv/rknn2 --system-site-packages && \
  python3.8 -m venv .venv/yolov5 --system-site-packages && \
  python3.8 -m venv .venv/yolov7 --system-site-packages
RUN git clone -b custom_rknn2 https://github.com/how2flow/yolov5.git && \
  git clone -b custom_rknn2 https://github.com/how2flow/yolov7.git && \
  git clone https://github.com/airockchip/rknn_model_zoo.git && \
  git clone https://github.com/how2flow/rknpu2 && \
  git clone https://github.com/how2flow/rknn-toolkit2
RUN cd
RUN mkdir -p .vim/colors && \
  mkdir -p .vim/bundle
RUN wget -O .gitconfig --no-check-certificate $GITCONFIG && \
  wget -O .tmux.conf --no-check-certificate $TMUXCONFIG && \
  wget -O .vimrc --no-check-certificate $VIMCONFIG && \
  wget -O .vim/colors/gruvbox.vim --no-check-certificate $VIMCOLORS
RUN git clone "https://github.com/VundleVim/Vundle.vim.git" \
  .vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall
RUN echo "alias tmux='tmux -2'" >> .bashrc
RUN echo "set -o vi" >> .bashrc
