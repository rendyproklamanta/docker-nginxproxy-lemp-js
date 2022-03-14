FROM node:16-alpine

ENV SRCDIR /src

RUN mkdir -p $SRCDIR && chown -R node:node $SRCDIR

# Add custom environment to pass in development server

# If deploy to "DigitalOcean App Engine", file .env cannot be read. 
# So all variable environment will be pass from this dockerfile.
# Then make sure copy all content inside .env to here
ENV PATH $SRCDIR/node_modules/.bin:$PATH
ENV NODE_ENV=development
ENV REACT_APP_BRANCH=dev
ENV REACT_APP_API_URL=https://app-dev-domain.com/
ENV REACT_APP_NAME=MyApp

WORKDIR $SRCDIR

COPY package.json .
RUN yarn
RUN yarn global add serve

COPY . .
RUN yarn build

# Keep Port for development server to 3000. Dont Change!
EXPOSE 3000

CMD serve -s build