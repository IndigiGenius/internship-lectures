FROM nvcr.io/nvidia/nemo:24.01.01.framework

MAINTAINER "IndigiGenius"

# Set shell
SHELL ["/bin/bash", "-c"]

# Install git, curl, necessary programs, and Python libraries.
RUN apt-get update -y && apt-get install -y \
    curl \
    git \
    libgl1-mesa-glx \
    libegl1-mesa \
    libxrandr2 \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libxi6 \
    libxtst6

# Workspace
ADD . /workspace/

RUN python -m pip install -r requirements.txt

# Volumes
VOLUME ["/workspace/data", "/workspace/model", "/workspace/notebooks/", "/workspace/code/"]

WORKDIR /workspace/

#RUN git clone https://github.com/IndigiGenius/internship-lectures.git

RUN echo "c.NotebookApp.custom_display_url = 'http://localhost:8888'" >> /root/.jupyter/jupyter_notebook_config.py

CMD jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
