web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -c 5 -v -q mailer -q default