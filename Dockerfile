FROM ruby:3.0.4-alpine3.16

# Information about author
LABEL author.name="FelixVuong" \
  author.email="phong.vuong008@gmail.com"


# Alpine Setup
RUN apk update && \
  apk add bash \
  build-base \
  nodejs \
  postgresql-dev \
  tzdata \
  vim \
  && rm -rf /var/lib/apt/lists

# Set the timezone.
ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
ENV APP_PATH /usr/src/app
WORKDIR $APP_PATH


# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
COPY Gemfile Gemfile.lock $APP_PATH/
RUN bundle install

COPY . .

# COPY docker/entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
# Start the main process.
# CMD bundle exec unicorn -c ./config/unicorn.rb
CMD ["rails", "server", "-b", "0.0.0.0"]