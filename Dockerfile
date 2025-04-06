# Use an official node.js runtime as parent image
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json .

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Expose port app runs on
EXPOSE 3000

# Define command to run app
CMD ["node", "./app.js"]