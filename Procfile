web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -q mailer,25 -q default -e production