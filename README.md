# Watcher

[![Code Climate](https://codeclimate.com/github/IcaliaLabs/watcher/badges/gpa.svg)](https://codeclimate.com/github/IcaliaLabs/watcher)
[![Issue Count](https://codeclimate.com/github/IcaliaLabs/watcher/badges/issue_count.svg)](https://codeclimate.com/github/IcaliaLabs/watcher)

Watcher uses [Github API](https://developer.github.com) to fetch information about repositories (issues, pull requests, branches, commits and so on).

### Quick Start

Doing anything interesting with Github API requires authentication, since unauthenticated clients can only make 60 requests per hour. To authenticate ourselves we need to generate an [access token](https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization) and set it as an environment variable (this is configured in `secret.yml` file):

```bash
export GITHUB_ACCESS_TOKEN = TOKEN_ID
```

After that, just start your rails server and you're ready to go!

### Contributing

Everyone is freely to collaborate and submit pull request if needed.


### Credits

Thank you, [contributors](https://github.com/icalialabs/icalia_guides/graphs/contributors)!

![Icalia Labs](https://raw.githubusercontent.com/IcaliaLabs/kaishi/master/logo.png)

Watcher is maintained by [Icalia Labs](http://www.icalialabs.com/team).


