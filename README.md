# Angular code base 

## Basic settings

Before you run anything you need to change some names.
 
  1. Change containers name in `docker-compose.yml`.
  2. Change `APP_NAME` environment variable for the angular container.
  3. In `/hooks/pre-commit.sh` search for `projectname_angular` and change it.
  4. In `/docker/images/nginx/config/nginx.conf` change `PROJECT-NAME` to the value of `APP_NAME` environment variable from the angular container.

## Start up the project

If you need to, you can change the two command for build and serve the angular application.
You can find it in `docker-compose.yml` file at the environment part.
When you are ready, run command: 
```
docker-compose up --build
```
or to run as a daemon: 
```
docker-compose up -d
```

This will create `/angular` folder and install in it the latest available stable version of angular.
In `/angular/dist` will crate folder with name the value of `PROJECT-NAME` environment variable and will build the app there with `BUILD_COMMAND` environment
 variable.
After that will serve it `SERVE_COMMAND`

The build you can find it at `http://localhost` at port `:80`. The web server is `NGINX`.

## Git Hooks

To work this, the project need to be in git repository and to have your project running in docker.
  1. If your project is running stop it with command:
  ```
  docker-compose down
  ``` 
  
  2. Delete `/.git` directory and set up your own repository.
After that only need to run the project.
This will automatically copy the `/hooks` folder in the `/.git` directory.

When you try to commit, the pre-commit hook will check for your angular container.
After that will check your code with tslin and eslint. If there is any error will prevent the commit.
