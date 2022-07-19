# Base image
FROM node:16

# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./


# Install app dependencies
RUN yarn

# Bundle app source
COPY . .

RUN yarn build

# Start the server using the production build
CMD [ "node", "dist/main.js" ]