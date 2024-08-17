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
View last 500 lines of live logs stdout from container: `docker compose logs -f --tail 500 app`   

Restart app: `docker compose restart app`  
Attach to the running service: `docker compose exec app bash`  
Run command inside `app` container and exit: `docker compose run app bundle install`  

| Services                                      | Host Network | Docker Network |
|-----------------------------------------------|--------------|----------------|
| [app](http://localhost:3000)                  | 3000         | 3000           |
| Postgres                                      |              | 5432           |
| Redis                                         |              | 6379           |
| Sidekiq                                       |              |                |
<!-- | [Mailcatcher](http://localhost:1080)          | 1080         | 1080           | -->


To up specific service `docker compose up app` or `docker compose up progress`

Use `docker compose -h` for more info.

### Change application port 
If you want to change host port that you application will be running you may set it
by setting `PORT` environment varible at `.env` file:  

```
PORT=4001
```

## Run tests `bin/docker_rspec`

Alias for

```bash
  docker compose run app \
    -e RAILS_ENV=test \
    -e RACK_ENV=test \
    app \
      sh -c "bundle exec rake db:create && bundle exec rspec"
```

## Debugging inside docker container

We use dafault [debug](https://github.com/ruby/debug) gem  
Place breakpoint `binding.break` somewhere in a code like in index action of PagesController:

```ruby
  def index
    page = params['path'] || 'index'

    binding.break

    if template_exists?("pages/#{page}")
      render "pages/#{page}" 
    else
      redirect_to root_path
    end
  end
```

Then trigger code execution by visiting some page like root page.  
From another terinal window run:  

```bash
  docker compose attach app
```

You will attaching to the process and able to debug application. Use ruby, rails commands see variables at stopped place like `page`
or use type `c` to going for next breakpoint. See documentation of debug gem.

### links
- http://localhost:3001 home page
- http://localhost:3001/admin admin panel (unprotected)