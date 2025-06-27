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

COPY wait-for-db.sh ./     
RUN chmod +x wait-for-db.sh 

RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 3000

ENTRYPOINT ["./wait-for-db.sh"]
CMD ["npm", "start"]
