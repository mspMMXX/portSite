FROM node:18-alpine 

RUN npm install -g http-server

WORKDIR /app

EXPOSE 80

COPY . .

CMD ["http-server", "-p", "80"]

