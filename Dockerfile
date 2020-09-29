FROM python:3.7-slim-buster
MAINTAINER Alexander Reitzel
WORKDIR /usr/src/app
RUN python -m pip install --upgrade pip
RUN pip install --upgrade wheel
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY python_skeleton python_skeleton
COPY setup.py .
RUN pip install .
CMD ["pysk"]
