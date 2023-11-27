# onnx2rknn

convert onnx model to rknn model

### env
- ubuntu 20.04
- python3.8(rknn), python3.8(yolo)

### fixups
- rknn2 side
```
$ source .venv/rknn2/bin/activate
(rknn2) $ pip install --upgrade pip
(rknn2) $ pip install -r rknn-toolkit2/doc/requirements_cp38-1.4.0.txt # install bfloat16 seperately
(rknn2) $ pip install rknn-toolkit2/packages/rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl
```

- yolov5 side
```
$ source .venv/yolov5/bin/activate
(yolov5) $ pip install --upgrade pip
(yolov5) $ pip install -r yolov5/requirements.txt # numpy==1.23.0 / Pillow==9.5.0
```

### docker repository
- <https://hub.docker.com/repository/docker/odroid/onnx2rknn>
