# Dockerfile

# Dockerfile with how2flow/config:{tag}

# ===== No Edit =====
FROM how2flow/config:focal
# ===================

# ===== Edit you want =====
ENV ID="odroiduser" \
  PASSWORD="docker"
# =========================

# ===== No Edit =====
USER root
RUN /postfix.sh $ID $PASSWORD
# ===================

# TODO with root permission ...
ADD fixups /
RUN chmod +x /pkg
RUN /pkg && rm -rf /fixups

# ===== No Edit =====
RUN rm -f /*.sh
# ===================

# ===== No Edit =====
USER ${ID}
WORKDIR /home/${ID}
RUN vim +PluginInstall +qall
# ===================

# TODO with normal permission in /home/${ID} ...
RUN python3.8 -m venv .venv/rknn2 --system-site-packages && \
  python3.8 -m venv .venv/yolov5 --system-site-packages

RUN git clone -b custom_rknn2 https://github.com/how2flow/yolov5.git && \
  git clone -b 1.4.0 https://github.com/how2flow/rknn-toolkit2

