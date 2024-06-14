# Dockerfile

# Use an official Node runtime as the parent image to build React app
FROM node:18 AS build

# Set the working directory to /app
WORKDIR /app



# Change working directory to created React app: /app/frontend
WORKDIR /app/frontend

# Copy the current directory contents into the container at /app/frontend
COPY frontend/package.json /app/frontend/package.json 
RUN npm install

# Build the React app for production
COPY frontend ./
RUN npm run build

# Use the official Python image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app
RUN pwd 

RUN ls -la /app 
RUN ls -la /app/frontend

# copy the frontend dist to the working directory/ui
RUN cp -r /app/frontend/dist /app/ui/

# Copy the dependencies file to the working directory
COPY app/requirements.txt .

# Install any dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY app/ .

# Copy the React app build from the build stage
COPY --from=build /app/frontend/build /app/frontend/build

# Expose the port 80 to the outside world
EXPOSE 80

# Command to run on container start
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
