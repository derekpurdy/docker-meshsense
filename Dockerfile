FROM node

RUN apt-get update

WORKDIR /app

RUN git clone https://github.com/Affirmatech/MeshSense.git .

WORKDIR /app/api
RUN npm install
RUN npm run build

WORKDIR /app/ui
RUN npm install
RUN npm run build

WORKDIR /app/api/dist

RUN apt-get update && apt-get install -y libdbus-1-3 && rm -rf /var/lib/apt/lists/*

EXPOSE 5920

CMD ["node", "index.cjs"]
