# onnx2rknn

convert onnx model to rknn model

### env
- ubuntu 20.04
- python3.6(rknn), python3.8(yolo)

### fixups
```
$ python3 -m pip install --upgrade pip

$ source .venv/rknn/bin/activate
(rknn) $ python3 -m pip install -r rknn-toolkit2/doc/requirements_cp36-1.2.0.txt # install bfloat16 seperately
(rknn) $ python3 -m pip install rknn-toolkit2/packages/rknn_toolkit2-1.2.0_f7bb160f-cp36-cp36m-linux_x86_64.whl
(rknn) $ deactivate
$ source .venv/yolo/bin/activate
(yolo) $ python3 -m pip install -r requirements.txt # install "export" seperately
# edit ~/.venv/yolo/lib/python3.8/site-packages/torch/nn/modules/upsampling.py
# erase L157, "recompute_scale_factor=self.recompute_scale_factor"
# then,
(yolo) $ ./2onnx # output: yolov5s.onnx
(yolo) $ deactivate
$ source .venv/rknn/bin/activate
(rknn) $ cp yolov5/yolov5s.onnx yolov5/rknn
(rknn) $ python3 yolov5/rknn/onnx2rknn # output: yolov5s.rknn
```

### docker repository
- <https://hub.docker.com/repository/docker/odroid/onnx2rknn>
