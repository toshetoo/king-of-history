FROM node:8.11

# Update and isntall additional packages
RUN npm i npm@latest -g && npm install -g yarn && npm install -g npm-check && npm install -g @angular/cli

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



