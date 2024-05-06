# Backstage-buildpack

Heroku defaults for running Backstage.

### Must set BASE_URL config var to use

    $ heroku domains
    example-123.herokuapp.com
    $ heroku config:set BASE_URL=https://example-123.herokuapp.com

### Add as first buildpack:
   
    $ heroku buildpacks:add https://github.com/chap/backstage-buildpack --index 1

#### Creates defaults
- Procfile
- package.json {scripts:build}
- app-config.heroku.yaml
- .profile for generating postgres schemas
