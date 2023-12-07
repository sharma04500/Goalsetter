FROM node:18-alpine
COPY . .
RUN cd frontend/ && npm run build && cd ../
EXPOSE 5000
CMD [ "backend/server.js" ]

# Before executing this docker file, Initial build action should be performed in a server containing node 18.0
# Run npm i in the root directory for the backend. Navigate to frontend/ and run npm i for the frontend
# Then execute this docker file.