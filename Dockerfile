FROM ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev


ENV PATH=/usr/src/app/bin:$PATH RAILS_ENV=development RACK_ENV=development
ENV APP_HOME /usr/src/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

EXPOSE 3000

CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]
