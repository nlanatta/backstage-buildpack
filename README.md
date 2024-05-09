# Backstage-buildpack

Heroku defaults for running Backstage.

```
-----> Backstage app detected
       package.json
         - {scripts:build} added
         - {scripts:cacheDirectories} added
       app-config.heroku.yaml created
         - database: Heroku Postgres 
         - baseUrl: $BASE_URL:$PORT
       Procfile created to load app-config.heroku.yaml
         - ignoring app-config.production.yaml
```

### Must set BASE_URL config var to use

    $ heroku domains
    example-123.herokuapp.com
    $ heroku config:set BASE_URL=https://example-123.herokuapp.com

### Add as first buildpack:
   
    $ heroku buildpacks:add https://github.com/chap/backstage-buildpack --index 1

And ensure node is the 2nd:

    $ heroku buildpacks:add https://github.com/chap/backstage-buildpack --index 2
