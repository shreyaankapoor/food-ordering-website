FROM node:14-alpine3.12

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY package*.json ./
RUN npm install --ignore-scripts

COPY public/ ./public/
COPY routes/ ./routes/
COPY views/ ./views/
COPY bin/ ./bin/
COPY app.js ./

RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 3000

CMD ["npm", "start"]
