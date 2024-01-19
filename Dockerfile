FROM alpine/git as source

WORKDIR /

RUN git config --global advice.detachedHead false \
  && git clone --depth 1 --branch v10.2.3 https://github.com/grafana/grafana.git

FROM node:20-alpine3.18 as js-builder

WORKDIR /usr/src/app/

COPY --from=source /grafana/package.json /grafana/yarn.lock /grafana/.yarnrc.yml ./
COPY --from=source /grafana/.yarn .yarn
COPY --from=source /grafana/packages packages
COPY --from=source /grafana/plugins-bundled plugins-bundled
COPY --from=source /grafana/public public

# Patch Custom Time Ranges
COPY options.ts packages/grafana-ui/src/components/DateTimePickers/options.ts

RUN apk --no-cache add git
RUN yarn install --immutable

COPY --from=source /grafana/tsconfig.json /grafana/.eslintrc /grafana/.editorconfig /grafana/.browserslistrc /grafana/.prettierrc.js ./
COPY --from=source /grafana/tools tools
COPY --from=source /grafana/scripts scripts
COPY --from=source /grafana/emails emails

ENV NODE_ENV production
RUN yarn build

FROM grafana/grafana:latest

COPY --from=js-builder /usr/src/app/public ./public
COPY --from=js-builder /usr/src/app/tools ./tools

RUN grafana-cli plugins install instana-datasource
