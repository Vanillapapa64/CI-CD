FROM node:latest
WORKDIR /usr/src/app
COPY package.json package-lock.json turbo.json tsconfig.json ./
COPY packages ./packages
COPY apps ./apps
RUN npm install
RUN npm run db:generate
RUN npm run build 
CMD [ "npm","run","start-user-app" ]
