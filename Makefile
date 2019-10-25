console:
	docker-compose run web rails console

build:
	docker-compose run web bundle
	docker-compose build

mine:
	sudo chown -R $(USER):$(USER) .

start:
	rm -f tmp/pids/server.pid
	docker-compose up -d

stop:
	docker-compose down
	rm -f tmp/pids/server.pid

rubocop:
	docker-compose run web bundle exec rubocop --auto-correct

routes:
	docker-compose run web rake routes

logs:
	docker-compose logs -tf

staging_deploy:
	heroku maintenance:on --app confy-staging
	git push -ff staging `git rev-parse --abbrev-ref HEAD`:master
	heroku pg:killall --app confy-staging
	#heroku pg:reset --app confy-staging --confirm confy-staging
	heroku run rake db:migrate --app confy-staging
	#heroku run rake db:seed --app confy-staging
	heroku ps:scale web=1 --app confy-staging
	heroku restart --app confy-staging
	heroku maintenance:off --app confy-staging

production_deploy:
	heroku maintenance:on --app confy-wecodeio
	git push production master
	heroku pg:killall --app confy-wecodeio
	heroku run rake db:migrate --app confy-wecodeio
	heroku ps:scale web=1 --app confy-wecodeio
	heroku restart --app confy-wecodeio
	heroku maintenance:off --app confy-wecodeio

use_production_db:
	heroku pg:backups capture --app confy-wecodeio
	curl -o tmp/latest.dump `heroku pg:backups public-url --app confy-wecodeio`
	docker-compose run web bundle exec rake db:drop db:create DISABLE_DATABASE_ENVIRONMENT_CHECK=1
	docker cp tmp/latest.dump confy_db_1:/latest.dump
	! docker exec confy_db_1 pg_restore --verbose --clean --no-acl --no-owner -h localhost -d confy_development -U confy /latest.dump
	docker-compose run web bundle exec rake db:migrate

analyze_levenshtein:
	docker-compose run web rails runner utilities/data_analysis/distance.rb