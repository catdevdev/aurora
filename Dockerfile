# Base image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN npm install -g @nestjs/cli

# Install app dependencies
RUN set -ex; \
      yarn install --frozen-lockfile --production --network-timeout=600000; \
      yarn cache clean; \
      yarn run build

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN yarn build

# Start the server using the production build
CMD [ "node", "dist/main.js" ]