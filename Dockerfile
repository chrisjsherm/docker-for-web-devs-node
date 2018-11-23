FROM node:latest

MAINTAINER Chris Sherman

# Set up variables that our Node.js code can run from.
ENV NODE_ENV=production \
  PORT=3000

# Copy our sourcecode into the layered file system.
COPY . /var/www

# Run commands in the context of the /var/www directory inside the container.
WORKDIR /var/www

# Keep our working directory on the host system, managed by Docker.
VOLUME ["/var/www"]

RUN npm install

# Run this container on port 3000.
EXPOSE ${PORT}

# Command to kick off the container.
ENTRYPOINT ["npm", "start"]