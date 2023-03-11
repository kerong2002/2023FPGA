# yolov4_yolov5
yolov4_yolov5

## 2023/02/24
1. 安裝YOLOV4

## 2023/02/28
1. 安裝CUDA tool kit (v.12)
2. 安裝CUDNN (v.8)
3. 安裝anconda中的 tensorflow-gpu
#### 遇到問題
1. pycharm 執行範例程式會找不到特定的dll
2. tensorflow-gpu抓不到gpu執行

## 2023/03/01
1. 調整CUDA版本為11
2. 刪掉Anconda tensorflow
3. 重新安裝Anconda tensorflow-gpu
#### 遇到問題
1. pycharm 執行範例程式會找不到特定的dll
2. tensorflow-gpu抓不到gpu執行
#### 另行解決辦法
1. 使用CSDN 教學 https://blog.csdn.net/qq_41456654/article/details/115533152
2. 安裝pytorch，並執行yolov5
3. 成功使用cpu運行
4. 透過```os.environ['CUDA_VISIBLE_DEVICES'] = '0'```指令調整使用gpu優先
5. 透過pytorch使用yolov5 偵測汽車成功

## 2023/03/02
1. 調整CUDA中的dll檔案
2. 多下載CUDNN V7的版本丟入 CUDA的bin環境中
3. pycharm 跑測試檔案，可以正常抓到GPU

## 2023/03/12
1. ```pip install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html```
