# onnx2rknn

convert onnx model to rknn model

### env
- ubuntu 20.04
- python3.6(rknn), python3.8(yolo)

### fixups
```
$ python3 -m pip install --upgrade pip

$ source .venv/rknn/bin/activate
(rknn) $ python3 -m pip install -r rknn-toolkit2/doc/requirements_cp38-1.4.0.txt # install bfloat16 seperately
(rknn) $ python3 -m pip install rknn-toolkit2/packages/rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl
(rknn) $ deactivate
$ source .venv/yolo/bin/activate
(yolo) $ python3 -m pip install -r requirements.txt # install "export" seperately
# edit ~/.venv/yolo/lib/python3.8/site-packages/torch/nn/modules/upsampling.py
# erase L157, "recompute_scale_factor=self.recompute_scale_factor"
# then,

edit custom/costomize.
DATASET_FILE=""
MODEL_FILE=""
INCLUDE=""
SOURCE_FILE=""
RKCHIP="RK3588"
...

(yolo) $ ./custom/export.sh # output: {your_model_name}.onnx
(yolo) $ deactivate
$ source .venv/rknn/bin/activate
(rknn) $ cp yolov5/{your_model_name}.onnx rknn-toolkit2/examples/onnx/yolov5
edit test.py
then,
(rknn) $ python3 yolov5/rknn/onnx2rknn # output: {your_model_name}.rknn
```

### docker repository
- <https://hub.docker.com/repository/docker/odroid/onnx2rknn>
