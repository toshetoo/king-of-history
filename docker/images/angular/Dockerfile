FROM node:8.11

# See https://crbug.com/795759
RUN apt-get update && apt-get install -yq libgconf-2-4

# Update and install additional packages
RUN npm i npm@latest -g && npm install -g yarn && npm install -g npm-check \
    && npm install -g @angular/cli && npm install -g eslint eslint-config-strongloop \
    && npm install -g eslint-plugin-babel && npm install -g eslint-plugin-import \
    && npm install -g babel-eslint && npm install -g jasmine


# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb

# Get the app name from enviremont arguments
ARG APP_NAME="PROJECT-NAME"

# Set the app name in container enviremont
ENV APP_NAME=$APP_NAME

# Set default build command
ARG BUILD_COMMAND="yarn build"

# Set build command in enviremont
ENV BUILD_COMMAND=$BUILD_COMMAND

# Set default serve command
ARG SERVE_COMMAND="yarn start --host 0.0.0.0"

# Set serve command in enviremont
ENV SERVE_COMMAND=$SERVE_COMMAND

# Copy scripts in the container
COPY ./scripts/ /etc/scripts/

# Copy extras in the container
COPY ./extras/ /etc/extras/

# Set work directory
WORKDIR /home/node/angular

# Expose dev port
EXPOSE 4200

# Install angular, install dependencies, build and serve the angular app.
CMD /etc/scripts/install-angular.sh && \
    /etc/scripts/build.sh && \
    /etc/scripts/serve.sh && \
    /bin/bash



