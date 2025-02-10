# Use a Node.js base image
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
