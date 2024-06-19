FROM node:19 as builder
RUN apt-get install -y --no-install-recommends git && \
    git clone https://github.com/StrandedKitty/streets-gl.git /usr/src/builder

COPY Config.ts /usr/src/builder/src/app/Config.ts
WORKDIR /usr/src/builder
RUN npm ci && \
    npm run build

FROM node:19-alpine as runner
WORKDIR /usr/src/app
COPY --from=builder /usr/src/builder/build ./build
COPY --from=builder /usr/src/builder/package.json ./
RUN apk add pngquant
RUN find ./build/models \
    ./build/textures/buildings \
    ./build/textures/surfaces \
    -type f -name "*.png" \
    -exec pngquant --force --quality 65-80 --skip-if-larger --output {} {} \;
RUN npm install http-server
EXPOSE 8080
CMD ["npm", "start"]