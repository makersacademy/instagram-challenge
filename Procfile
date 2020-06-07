release: rake db:migrate:reset RAILS_ENV=production

web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
