# Dockerfile with how2flow/config:{tag}

# ===== [Edit only '{tag}'] =====
FROM how2flow/config:focal
# ==================================

# ======== [Edit you want] =========
ENV ID="odroiduser" \
  PASSWORD="docker"
# ==================================

# =========== [No Edit] ============
USER root
RUN /postfix.sh $ID $PASSWORD
# ==================================

# ========= [Active or Not] ========

# Use it when you need to distribute
# an official image

# When using postrm script,
# "RUN vim + Plugin Install + qall"
# must be disabled.

# RUN /postrm.sh $ID
# ==================================

# ===== [Edit TODO with ROOT.] =====

# start
ADD fixups /
RUN chmod +x /pkg
RUN /pkg && rm -rf /fixups

# finish
RUN rm -f /*.sh
# ==================================

# ======== [Change Account] ========
USER ${ID}
WORKDIR /home/${ID}
# ==================================

# ===== [Edit TODO with USER.] =====

# start
RUN vim +PluginInstall +qall

RUN python3.8 -m venv .venv/rknn2 --system-site-packages && \
  python3.8 -m venv .venv/yolov5 --system-site-packages && \
  python3.8 -m venv .venv/yolov8 --system-site-packages

RUN git clone https://github.com/airockchip/yolov5.git && \
  git clone -b rknn_v1.6.0 https://github.com/how2flow/ultralytics_yolov8.git && \
  git clone -b v1.6.0 https://github.com/how2flow/rknn-toolkit2

# finish
# ==================================

