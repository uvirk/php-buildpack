# Cloud Foundry buildpack: PHP

A Cloud Foundry [buildpack](http://docs.cloudfoundry.org/buildpacks/) for PHP based apps.

This is based on the [Heroku buildpack](https://github.com/heroku/heroku-buildpack-php).

Additional documentation can be found at [CloudFoundry.org](http://docs.cloudfoundry.org/buildpacks/).
## Usage

This buildpack will be used if there is a `composer.json` or `index.php` file in the root directory of your project.

```bash
cf push my_app -b https://github.com/cloudfoundry/cf-buildpack-php.git
```

## Cloud Foundry Extensions - Offline Mode

The primary purpose of extending the heroku buildpack is to cache system dependencies for firewalled or other non-internet accessible environments. This is called 'offline' mode.

'offline' buildpacks can be used in any environment where you would prefer the dependencies to be cached instead of fetched from the internet.

The list of what is cached is maintained in [bin/package](bin/package).

Using cached system dependencies is accomplished by overriding curl during staging. See [bin/compile](bin/compile#L44-48)

### App Dependencies in Offline Mode
Offline mode expects each app to use composer to manage dependencies. Use `composer install` to vendor your dependencies into `/vendor`.

#### No Dependencies

There are three supported behaviors if the app has no dependencies:

1. If index.php exists, the app does not need a composer.json file.

1. The app can have an empty composer.json file:

    `touch composer.json`

1. The app can explicitly disable the default Packagist repository:

    `echo '{"repositories":[{"packagist":false}]}' > composer.json`

## Building
1. Make sure you have fetched submodules

  ```bash
  git submodule update --init
  ```

1. Build the buildpack

  ```bash
  bin/package [ online | offline ]
  ```

1. Use in Cloud Foundry

    Upload the buildpack to your Cloud Foundry and optionally specify it by name

    ```bash
    cf create-buildpack custom_php_buildpack php_buildpack-offline-custom.zip 1
    cf push my_app -b custom_php_buildpack
    ```

## Contributing

### Run the tests

See the [Machete](https://github.com/cf-buildpacks/machete) CF buildpack test framework for more information.

### Pull Requests

1. Fork the project
1. Submit a pull request

## Reporting Issues

Open an issue on this project

## Active Development

The project backlog is on [Pivotal Tracker](https://www.pivotaltracker.com/projects/1042066)
