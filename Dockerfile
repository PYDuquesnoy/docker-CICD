FROM node:alpine 
#Incorrect application version in AWS
# FROM node:alpine as buillder


WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#output is /app/build with the files we need

FROM nginx
#Expose needed for AWS beanstalk!
EXPOSE 80
#incorrect application version in AWS
#COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html

#Default command of nginx alredy starts this container...
