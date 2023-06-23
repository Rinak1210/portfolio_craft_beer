# syntax=docker/dockerfile:1
FROM ruby:3.1.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn postgresql-client libpq-dev

# Node.jsのバージョン指定
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

WORKDIR /find_craft_beer
RUN yarn install --check-files
COPY Gemfile /find_craft_beer/Gemfile
COPY Gemfile.lock /find_craft_beer/Gemfile.lock

RUN bundle install

RUN yarn add @babel/plugin-proposal-private-methods

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
