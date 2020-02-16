### STAGE 1: Build ###
FROM node:13.8-alpine AS build
WORKDIR /app
COPY ./source/package.json ./
RUN npm install
COPY ./source ./
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.8-alpine
COPY --from=build /app/dist/angular-devops /usr/share/nginx/html
