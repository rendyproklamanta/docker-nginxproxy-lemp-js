FROM node:16-alpine

ENV SRCDIR /src
RUN mkdir -p $SRCDIR/app && chown -R node:node $SRCDIR

# Add custom environment to pass in development server

# If deploy to "DigitalOcean App Engine", file .env cannot be read. 
# So all variable environment will be pass from this dockerfile.
# Then make sure copy all content inside .env to here
ENV PATH $SRCDIR/app/node_modules/.bin:$PATH
ENV NODE_ENV=development
ENV EXPRESS_BASE_URL=https://api.dev.domain.com/

WORKDIR $SRCDIR/app
COPY ./package.json .

RUN yarn cache clean && yarn --verbose

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]