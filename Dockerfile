FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build #the build folder will be created in the /app/build folder found in the container

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
