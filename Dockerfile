from node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
copy . .
RUN npm run build

from nginx
copy --from=builder /app/build /usr/share/nginx/html