FROM ruby

COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock
COPY jenkins /jenkins

COPY jenkins_job.rb /jenkins_job.rb

# Install the correct Bundler version
RUN gem install bundler -v 2.2.17
RUN bundle install

ENTRYPOINT [ "ruby", "/jenkins_job.rb" ]
