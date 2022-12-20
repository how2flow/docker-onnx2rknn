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
  YOLO_COMMIT="bd63cba03beed842995939c2a27b139a0cbc038c" \
  CSCOPE="https://raw.githubusercontent.com/jkhgit/config/ubuntu/mkcscope.sh" \
  GITCONFIG="https://raw.githubusercontent.com/jkhgit/config/ubuntu/gitconfig" \
  TMUXCONFIG="https://raw.githubusercontent.com/jkhgit/config/ubuntu/tmux.conf" \
  VIMCONFIG="https://raw.githubusercontent.com/jkhgit/config/ubuntu/vimrc" \
  VIMCOLORS="https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER root
WORKDIR /root
COPY docker.packages packages
COPY docker.user user
RUN chmod +x packages user && \
    ./packages && ./user $ID
RUN echo "$ID ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN rm packages user

USER $ID
WORKDIR /home/$ID
COPY setenv setenv
RUN ./setenv "3.6" .venv/$RKNN && \
  ./setenv "3.8" .venv/$YOLO
RUN git clone https://github.com/airockchip/yolov5.git && \
  git clone https://github.com/hardkernel/rknpu2 && \
  git clone https://github.com/hardkernel/rknn-toolkit2
RUN cd && rm setenv
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
