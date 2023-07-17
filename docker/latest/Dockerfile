# Dockerfile

# ===== No Edit =====
FROM how2flow/config:focal
# ===================

ENV ID="odroiduser" \
  PASSWORD="docker"

# ===== No Edit =====
USER root
WORKDIR /root
COPY fixups fixups
RUN chmod -R +x fixups
# ===================

# ===== No Edit =====
WORKDIR /root/fixups
RUN ./postfix $ID $PASSWORD
# ===================

# TODO ...
RUN ./pkg

# ===== No Edit =====
RUN rm -rf fixups
# ===================

# ===== No Edit =====
USER ${ID}
WORKDIR /home/${ID}
RUN vim +PluginInstall +qall
# ===================

# TODO ...
RUN python3.8 -m venv .venv/rknn2 --system-site-packages && \
  python3.8 -m venv .venv/yolov5 --system-site-packages

RUN git clone https://github.com/airockchip/yolov5.git && \
  git clone https://github.com/rockchip-linux/rknn-toolkit2
