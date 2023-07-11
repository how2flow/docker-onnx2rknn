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
RUN git clone -b custom_rknn2 https://github.com/how2flow/yolov5.git && \
  git clone https://github.com/how2flow/rknpu2 && \
  git clone https://github.com/how2flow/rknn-toolkit2
