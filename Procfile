web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -q mailer,5 -q default -e production