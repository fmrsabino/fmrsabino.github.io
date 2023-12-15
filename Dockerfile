FROM alpine:3.19 AS build

WORKDIR /website
RUN apk add --no-cache zola
COPY . .
RUN zola build --base-url https://fredericosabino.com

FROM scratch
COPY --from=build /website/public .
