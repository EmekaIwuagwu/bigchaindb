# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libssl-dev \
    libsodium-dev \
    libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PyNaCl from pre-built wheels
RUN pip install --no-cache-dir PyNaCl

# Copy the current directory contents into the container at /app
COPY . /app

# Install any other needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 9984 available to the world outside this container
EXPOSE 9984

# Define environment variable
ENV NAME World

# Run your application (replace with your actual command)
CMD ["python", "app.py"]
