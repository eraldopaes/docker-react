FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN yarn install --upgrade
COPY . .
RUN yarn build
# CMD [ "npm", "run", "build" ]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html