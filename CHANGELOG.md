# FIXUPS

post-works after build docker image.

#### v1.4.0

- rknn2 side
```
$ source .venv/rknn2/bin/activate
(rknn2) $ python3 -m pip install --upgrade pip
(rknn2) $ python3 -m pip install -r rknn-toolkit2/doc/requirements_cp38-1.4.0.txt # install bfloat16 seperately
(rknn2) $ python3 -m pip install rknn-toolkit2/packages/rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl
```

- yolov5 side
```
$ source .venv/yolov5/bin/activate
(yolov5) $ python3 -m pip install --upgrade pip
(yolov5) $ python3 -m pip install -r yolov5/requirements.txt
(yolov5) $ vi .venv/yolov5/lib/python3.8/site-packages/torch/nn/modules/upsampling.py
```
```
    def forward(self, input: Tensor) -> Tensor:
        return F.interpolate(input, self.size, self.scale_factor, self.mode, self.align_corners)
                              # recompute_scale_factor=self.recompute_scale_factor)
```

#### v1.5.2

- rknn2 side
```
$ source .venv/rknn2/bin/activate
(rknn2) $ python3 -m pip install --upgrade pip
(rknn2) $ python3 -m pip install -r rknn-toolkit2/doc/requirements_cp38-1.5.2.txt
(rknn2) $ python3 -m pip install rknn-toolkit2/packages/rknn_toolkit2-1.5.2+b642f30c-cp38-cp38-linux_x86_64.whl
```

- yolov5 side
```
$ source .venv/yolov5/bin/activate
(yolov5) $ python3 -m pip install --upgrade pip
(yolov5) $ python3 -m pip install -r yolov5/requirements.txt # numpy==1.23.0 / Pillow==9.5.0
```

#### v1.6.0

- rknn2 side
```
$ source .venv/rknn2/bin/activate
(rknn2) $ python3 -m pip install --upgrade pip
(rknn2) $ python3 -m pip install -r rknn-toolkit2/packages/requirements_cp38-1.6.0.txt
(rknn2) $ python3 -m pip install rknn-toolkit2/packages/rknn_toolkit2-1.6.0+b642f30c-cp38-cp38-linux_x86_64.whl
```

- yolov5 side
```
$ source .venv/yolov5/bin/activate
(yolov5) $ python3 -m pip install --upgrade pip
(yolov5) $ python3 -m pip install -r yolov5/requirements.txt # numpy==1.23.0 / Pillow==9.5.0
```

- yolov8 side
```
$ source .venv/yolov8/bin/activate
(yolov8) $ python3 -m pip install --upgrade pip
(yolov8) $ python3 -m pip install -r yolov8/requirements.txt
(yolov8) $ python3 -m pip install .
```

