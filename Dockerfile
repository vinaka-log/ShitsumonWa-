FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn chromium-driver 
RUN mkdir /ShitsumonWa
WORKDIR /ShitsumonWa
COPY Gemfile /ShitsumonWa/Gemfile
COPY Gemfile.lock /ShitsumonWa/Gemfile.lock
RUN gem install bundler 
RUN bundle install
COPY . /ShitsumonWa
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]