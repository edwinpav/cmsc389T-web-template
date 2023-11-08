#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines

# Base Image
FROM node:10-alpine

# Add a new user "node" that we'll be using for executing scripts
USER node

# Create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app/ && chown -R node:node /home/node/app

# Set the working directory inside the container
WORKDIR /home/node/app

# Copy the package.json and package-lock.json (if present) to the container
COPY package*.json ./

# Switch to user node
USER node

# Expose port 8080
EXPOSE 8080

# Install all packages in package.json
RUN npm install

# Run the app
CMD ["node", "app.js"]