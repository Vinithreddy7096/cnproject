# Use the official Python 3.9 image as the base
FROM python:3.9-slim

# Set a working directory in the container
WORKDIR /app

# Copy the current directory's contents to the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Flask/Gunicorn will run on
EXPOSE 8080

# Define environment variable for Flask
ENV FLASK_ENV=production

# Command to run the application using Gunicorn
CMD ["gunicorn", "-b", ":8080", "finalcode:app"]
