#Multi-step Dockerfile

FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# Produces /app/build: that will be the folder to copy!

FROM nginx
# nginx tells to copy the static files in /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html
# nginx will start automatically!