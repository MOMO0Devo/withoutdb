# Use the official Node.js image as the base image
FROM node:22.13.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (or yarn.lock) into the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port the app will run on (default is 3000)
EXPOSE 3000

# Set the environment variable for production
ENV NODE_ENV=production

# Start the Next.js application
CMD ["npm", "start"]
