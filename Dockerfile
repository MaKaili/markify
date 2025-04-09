FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 安装系统依赖
RUN apt-get update && apt-get install -y libmagic1

WORKDIR /markify

COPY requirements.txt .

RUN pip install --upgrade -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple pip wheel setuptools 
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# RUN pip install -U "magic-pdf[full]" -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
# RUN pip install -r requirements.txt -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple

COPY . .

EXPOSE 20926

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "20926"]