FROM node

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "run" , "dev"]

# docker build -t node-app .
# docker run -d -p 8080:3000 node-app

