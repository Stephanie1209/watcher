# Watcher

[![Code Climate](https://codeclimate.com/github/IcaliaLabs/watcher/badges/gpa.svg)](https://codeclimate.com/github/IcaliaLabs/watcher)
[![Issue Count](https://codeclimate.com/github/IcaliaLabs/watcher/badges/issue_count.svg)](https://codeclimate.com/github/IcaliaLabs/watcher)

## Getting Started

Watcher uses [Github API](https://developer.github.com) to fetch information about repositories (issues, pull requests, branches, commits and so on). Doing anything interesting with Github API requires authentication, since unauthenticated clients can only make 60 requests per hour. 

To authenticate ourselves we need to generate an [access token](https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization), with the following scopes:

- `repo`
- `repo:status`
- `notifications`

After that, we just need to set our token as an environment variable (this is configured in [secret.yml](https://github.com/IcaliaLabs/watcher/blob/master/config/secrets.yml#L7) file):

```bash
export GITHUB_ACCESS_TOKEN = TOKEN_ID
```

## Usage 

Watcher can be used in two modes: Web and API

### Web

For the web version you just need to set your Github token, start your rails server and you're ready to go!

### API

Watcher has multiple endpoints for each of the following:

- Organization
- Repositories
- Issues
- Pull Requests
- Commits

Please see the [wiki](https://github.com/IcaliaLabs/watcher/wiki/API-Documentation) for more details


### Contributing

Everyone is freely to collaborate and submit pull request if needed.


### Credits

Thank you [contributors](https://github.com/icalialabs/icalia_guides/graphs/contributors)!

![Icalia Labs](https://raw.githubusercontent.com/IcaliaLabs/kaishi/master/logo.png)

Watcher is maintained by [Icalia Labs](http://www.icalialabs.com/team).


