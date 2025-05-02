# Kleines fertiges Node.js-System
FROM node:18-alpine 

# Installation - einfaches Webserver-Programm (name: http-server)
RUN npm install -g http-server

# Container
WORKDIR /app

# Kopieren aller Daten vom Projekt in Container
COPY . .

# Wie der Server starten soll
CMD ["http-server", "-p", "80"]
