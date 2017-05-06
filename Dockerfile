FROM ruby:2.3

RUN curl --silent --location https://deb.nodesource.com/setup_7.x| bash - \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
        nodejs \
        ghostscript \
        libgs-dev \
        imagemagick \
        tesseract-ocr \
    && rm -rf /var/lib/apt/lists/*

# Set correct environment variables.
ENV HOME /root

WORKDIR /usr/src/app

RUN gem install bundler

COPY Gemfile* ./
RUN bundle install

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# VOLUME ["/usr/src/app"]

ENTRYPOINT ["/bin/bash"]
