# Use the official Python image from DockerHub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements for the project
COPY requirements.txt requirements.txt

# Install system dependencies and Python dependencies
RUN apt-get update && apt-get install -y \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy the Python scripts and other necessary files into the container
COPY . .

# Set environment variables for OpenAI API Key (you can overwrite this with your actual key when running the container)
ENV OPENAI_API_KEY="your_openai_api_key"

# Expose the port on which the app will run, if needed (streamlit or flask)
EXPOSE 8501

# Define the command to run the Python script
CMD ["python", "app.py"]
