# Step 1: Use an official Node.js image to build the app

FROM node:18 AS build
 
# Set the working directory in the container

WORKDIR /app
 
# Copy package.json and package-lock.json (if present)

COPY package*.json ./
 
# Install dependencies

RUN npm install
 
# Copy the rest of the app's source code

COPY . .
 
# Build the React app for production

RUN npm run build
 
# Step 2: Set up Nginx to serve the app

FROM nginx:alpine
 
# Copy the build folder from the build container

COPY --from=build /app/build /usr/share/nginx/html
 
# Expose port 80 for the app to be accessible

EXPOSE 80
 
# Start the nginx server

CMD ["nginx", "-g", "daemon off;"]

 