# Docker Development setup

## Create local env file `touch .env`

## Build an image and install dependencies `bin/docker_setup`

```sh
docker compose build app
docker compose run app bundle install
docker compose run app rake db:create db:migrate
docker compose up
```

## Run rails application, redis, sidekiq, postgres, mailcather containers `docker compose up`

Run containers in the background: `docker compose up -d`
View live logs stdout from container: `docker compose logs -f --tail 500 app`

Restart app: `docker compose restart app`
Attach to the running service: `docker compose exec app bash`
Run command inside `app` container and exit: `docker compose run app bundle install`

| Services                                      | Host Network | Docker Network |
|-----------------------------------------------|--------------|----------------|
| [app](http://localhost:3001)                  | 3001         | 3000           |
| Postgres                                      |              | 5432           |
| Redis                                         |              | 6379           |
| Sidekiq                                       |              |                |
<!-- | [Mailcatcher](http://localhost:1080)          | 1080         | 1080           | -->

To up specific service `docker compose up app` or `docker compose up progress`

Use `docker compose -h` for more info.

## Run tests `bin/docker_rspec`

Alias for

```bash
  docker compose run app \
    -e RAILS_ENV=test \
    -e RACK_ENV=test \
    app \
      sh -c "bundle exec rake db:create && bundle exec rspec"
```
