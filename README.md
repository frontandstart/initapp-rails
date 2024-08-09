# Initapp-rails is a Ruby on Rails starter project

Hello, this is a boilerplate Ruby on Rails application with docker compose setup for development that we use for greenfield project.

Goals
- [x] Easy up and run rails, sidekiq, postgres, mongodb using docker
- [ ] CI/CD
    - [ ] Github actions
- [ ] Provide different options for managing infrastructure and deploying to staging/production environment
  - [ ] Heroku deployment
  - [ ] VM deployment using docker compose and reproxy
  - [ ] Kubernetes deployment using Terraform
    - [ ] Digitalocean
    - [ ] AWS
    - [ ] GCP
    - [ ] Azure
  - [ ]  Docker swarm cluster deployment
  - Application features
    - [x] Admin panel by rails_admin gem
    - [x] Devise authentication
    - [x] Application healthcheck
    - [x] Bootstrap 5

##  Docker Development setup: Build an docker image and install dependencies run `bin/docker_setup`

```sh
touch .env
docker compose build app
docker compose run app bundle install
docker compose run app yarn install
docker compose run app rake db:create db:migrate
```

## Run rails application, redis, sidekiq, postgres, mailcather containers  
```
docker compose up
```

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

If you want to change host port that you application will be running you may set it
by setting `HOST_PORT` environment varible at `.env` file:  

```
HOST_PORT=4001
```

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

### links
- http://localhost:3001 home page
- http://localhost:3001/admin admin panel (unprotected)