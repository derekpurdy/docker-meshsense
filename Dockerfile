FROM node

RUN apt-get update && apt-get install -y \
    libfuse2 \
    curl \
    ca-certificates \
    git \
    libdbus-1-3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/Affirmatech/MeshSense.git .

WORKDIR /app/api
RUN npm install
RUN npm run build

WORKDIR /app/ui
RUN npm install
RUN npm run build

WORKDIR /app/api/dist

EXPOSE 5920

CMD ["node", "index.cjs"]
