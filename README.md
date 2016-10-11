# Watcher

[![Code Climate](https://codeclimate.com/github/IcaliaLabs/watcher/badges/gpa.svg)](https://codeclimate.com/github/IcaliaLabs/watcher)
[![Issue Count](https://codeclimate.com/github/IcaliaLabs/watcher/badges/issue_count.svg)](https://codeclimate.com/github/IcaliaLabs/watcher)

## Getting Started

Watcher uses [Github API](https://developer.github.com) to fetch information about repositories (issues, pull requests, branches, commits and so on). Doing anything interesting with Github API requires authentication, since unauthenticated clients can only make 60 requests per hour.

To authenticate ourselves we need to generate an [access token](https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization), with the following scopes:

- `repo`
- `repo:status`
- `notifications`

After that, we just need to create `dev.env` and `secrets.yml` files:

```bash
$ cp dev.env.example dev.env
$ cp config/secrets.yml.example config/secrets.yml
```

Set our token along with the secret key base on `dev.env`

```
SECRET_KEY_BASE=SECRET_KEY_BASE
GITHUB_ACCESS_TOKEN=GITHUB_ACCESS_TOKEN
```

To get your secret key base you should run `rake secret`

And set the github organization name on `config/secrets.yml`

```
default: &default
  github_organization: 'ORGANIZATION NAME'
```

Finally run `docker-compose up` once in the application directory.

```
web_1   | => Booting WEBrick
web_1   | => Rails 4.2.6 application starting in development on http://0.0.0.0:3000
web_1   | => Run `rails server -h` for more startup options
web_1   | => Ctrl-C to shutdown server
web_1   | [2016-08-24 21:47:53] INFO  WEBrick 1.3.1
web_1   | [2016-08-24 21:47:53] INFO  ruby 2.3.1 (2016-04-26) [x86_64-linux]
web_1   | [2016-08-24 21:47:53] INFO  WEBrick::HTTPServer#start: pid=1 port=3000
```

Once you see this you can navigate to `localhost:3000` and Watcher should be up and running!

## Usage

### API

Watcher has multiple endpoints for each of the following:

- Organization
- Repositories
- Issues
- Pull Requests
- Commits

Please see the [wiki](https://github.com/IcaliaLabs/watcher/wiki/API-Documentation) for more details

## Whats new?

See [changelog](https://github.com/IcaliaLabs/watcher/blob/master/CHANGELOG.md) file for more details.


## Contributing

Everyone is freely to collaborate and submit pull request if needed.


## Credits

Thank you [contributors](https://github.com/IcaliaLabs/watcher/graphs/contributors)!

![Icalia Labs](https://raw.githubusercontent.com/IcaliaLabs/kaishi/master/logo.png)

Watcher is maintained by [Icalia Labs](http://www.icalialabs.com/team).
