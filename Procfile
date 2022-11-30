web: bundle exec puma -C config/puma.rb
js: yarn build:js
css: yarn build:css
worker: bundle exec sidekiq -C config/sidekiq.yml
release: bundle exec rails db:migrate
