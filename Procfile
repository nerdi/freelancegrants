web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -d -q mailer,5 -q default -e production