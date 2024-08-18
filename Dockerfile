FROM node:16-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html