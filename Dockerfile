FROM node:latest

WORKDIR /faurecia-app

COPY examples/servers/express/api-with-express-and-handlebars/package.json .

RUN npm install -g

COPY examples/servers/express/api-with-express-and-handlebars .

EXPOSE 3000

CMD ["npm", "start"]

