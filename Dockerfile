# Start from a Python 3.12 base image - Debian Bookworm
FROM python:3.11.7-bookworm

# Set the working directory in the container to /usr/src/signalsentry
WORKDIR /usr/src/signalsentry

# Install system packages required for Python libraries
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Lab and other Python libraries for machine learning
RUN pip install --no-cache-dir jupyterlab \
    pandas \
    numpy \
    scikit-learn \
    tensorflow \
    torch \
    matplotlib \
    seaborn \
    opencv-python \
    nltk \
    spacy

# Expose the ports for Jupyter Lab (8888) and TensorBoard (6006)
EXPOSE 8888 6006

# Start Jupyter Lab with necessary configurations
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.allow_origin='*'", "--NotebookApp.port=8888"]
