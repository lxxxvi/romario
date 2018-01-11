# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require_relative '../config/environment'

`HANAMI_ENV=test bundle exec rake db seeds`

Hanami.boot
