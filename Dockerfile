FROM node:latest

WORKDIR /faurecia-app

COPY examples/servers/express/api-with-express-and-handlebars .

RUN npm install -g

RUN npm install express --save

EXPOSE 3000

CMD ["npm", "start"]

