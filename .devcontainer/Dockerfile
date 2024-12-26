FROM jetpackio/devbox:latest

WORKDIR /code

# Create directory and set permissions.
USER root:root
RUN mkdir -p /code && chown ${DEVBOX_USER}:${DEVBOX_USER} /code

# Switch to non-root user.
USER ${DEVBOX_USER}:${DEVBOX_USER}

# Copy devbox configuration files.
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.json devbox.lock ./

# Initialize shell environment.
RUN devbox run -- echo "Installed Packages." && \
    devbox shellenv --init-hook >> ~/.profile
