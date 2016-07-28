## if you're running this first time, create db. After first run you can comment this line out
mix ecto.create

## Mix should be up to date, but if log is still complaining on dependancies uncomment this line
# mix deps.get

# run all the time
mix ecto.migrate # run migartion
mix phoenix.server

## if any of these steps is failing just comment them out and uncomment this:
# sleep 99999
## ... now you should be able to do `bash docker/bash.sh` and debug from inside container.
## maybe dependencies are not met so run `mix hex.info`, ...
