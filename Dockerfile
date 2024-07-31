FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app 

# Set environment variables
ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG=C.UTF-8
ENV GPG_KEY=E3FF2839C048B25C084DEBE9B26995E310250568
ENV PYTHON_VERSION=3.8.17
ENV PYTHON_PIP_VERSION=23.0.1
ENV PYTHON_SETUPTOOLS_VERSION=57.5.0
ENV PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/0d8570dc44796f4369b652222cf176b3db6ac70e/public/get-pip.py
ENV PYTHON_GET_PIP_SHA256=96461deced5c2a487ddc65207ec5a9cffeca0d34e7af7ea1afc470ff0d746207

# Install dependencies
RUN set -eux; \
    pip3 install --no-cache-dir -r requirements.txt

# Define the entrypoint
ENTRYPOINT ["bash", "script.sh"]
