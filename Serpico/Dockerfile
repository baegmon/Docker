FROM ruby:2.3.5-alpine

ARG INITIAL_USERNAME

# Create user to run Serpico
RUN addgroup -S serpico && adduser -S serpico -G serpico

# Install base packages
RUN apk update && apk upgrade && apk add make --update --no-cache \
    git \
    gcc \
    libc-dev \
    sqlite-dev && \
    git clone https://github.com/SerpicoProject/Serpico/ /usr/share/Serpico && \
    chown -R serpico:serpico /usr/share/Serpico/ && \
    apk del git

# Switch to non-root user
USER serpico

# Change Work
WORKDIR /usr/share/Serpico

# Install necessary Ruby components and bundles and perform cleanup
RUN sed -i 's/ruby "2.3.3"/ruby "2.3.5"/' Gemfile && \
    gem install bundler && \
    gem install bcrypt && \
    bundle install --without development test && \
    rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

# Copy Script
COPY start.sh .

# Expose Port 8443
EXPOSE 8443

ENTRYPOINT [ "/bin/sh", "/usr/share/Serpico/start.sh" ]