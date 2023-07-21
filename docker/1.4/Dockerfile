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
RUN ./fixups/postfix $ID $PASSWORD
# ===== No Edit =====

# TODO...
RUN ./fixups/pkg

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

RUN git clone -b custom_rknn2 https://github.com/how2flow/yolov5.git && \
  git clone https://github.com/how2flow/rknn-toolkit2
