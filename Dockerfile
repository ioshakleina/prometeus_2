# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the application files to the working directory
COPY . .

# Expose port 8080
EXPOSE 8080

# Define environment variable for the application port
ENV APP_PORT 8080

# Run the application
CMD ["node", "app.js"]

