# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory (including app.py and any other files) to the container's /app directory
COPY . /app

# Install any dependencies (in this case, Flask)
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the Flask app will run on
EXPOSE 5000

# Set the environment variable to allow the app to run in a container
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=production

# Use Gunicorn to run the app in production mode
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]