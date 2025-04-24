FROM ruby:3.3.5

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y postgresql-client build-essential libpq-dev nodejs && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

# Add script to wait for database and run migrations
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
