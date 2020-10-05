FROM node:alpine 
#PYD: was FROM node:alpine as builder, but this fails with beanstalk.

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#output is /app/build with the files we need

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

#Default command of nginx alredy starts this container...
