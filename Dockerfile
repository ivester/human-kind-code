ARG NODE_VERSION=20.18.0

# Base stage
FROM node:${NODE_VERSION}-slim as base

ARG PORT=3000

WORKDIR /src

# Build stage
FROM base as build

COPY --link package.json package-lock.json ./
RUN npm ci

COPY --link . .

RUN npm run build

# Run stage
FROM base

ENV PORT=$PORT
ENV NODE_ENV=production

COPY --from=build /src/.output /src/.output

CMD [ "node", ".output/server/index.mjs" ]
