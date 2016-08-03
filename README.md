# Elixir Phoenix Docker Composer Postgresql example

* Dummy app, it was doing it just as a proof of concept for Elixir
  beeing microservice (this is just simple web version without API endoint)
* Although I'm fairly experienced with Docker I'm still learning Elixir
  and Phoenix, so some parts may be done better
* this is just Development stage docker composer version. Not production
  ready. It's more a guide to first steps with docker-phoenix.
* for prod I'm recommendig to check this article https://semaphoreci.com/community/tutorials/dockerizing-elixir-and-phoenix-applications (there are some differences like running stuff under `MIX_ENV=prod mix ...` and they compile docker `FROM ubuntu
` I rather recomend to stick with `FROM elixir`)

### Requirements:

* docker
* docker-composer

### Settup

1. git clone project
2. docker-compose build
3. docker-compose up

...and you should now be able to `curl localhost:4000` (be sure no app is
running on this port)

You can go to `localhost:4000/teacher` and add/remove records. App is
really primitive, just one Model comunicating with one PG table, nothing
fancy.

### Bash console

```
bash docker/bash.sh   # will execute bash on running phoenix docker container
```

From there you can execute `mix` and other commands

###  Debbuging

some tips are in `docker/start_server.sh`
