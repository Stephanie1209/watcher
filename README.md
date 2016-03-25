# Watcher

[![Code Climate](https://codeclimate.com/repos/56ec62db0982010085003b82/badges/880cd08cac64a8f1ff63/gpa.svg)](https://codeclimate.com/repos/56ec62db0982010085003b82/feed)
[![Issue Count](https://codeclimate.com/repos/56ec62db0982010085003b82/badges/880cd08cac64a8f1ff63/issue_count.svg)](https://codeclimate.com/repos/56ec62db0982010085003b82/feed)

Watcher uses [Github API](https://developer.github.com) to fetch information about the projects (issues, pull requests, members of your team and so on).

### Setup

Doing anything interesting with Github API requires authentication, since unauthenticated clients can only make 60 requests per hour. To authenticate ourselves we need to generate an [access token](https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization) and set it in `secret.yml` file:

```bash
cp config/secrets.yml.example config/secrets.yml
```

After that you can directly set the token in `github_access_token` or use an environment variable.

### Contributing

Everyone is freely to collaborate and submit pull request if needed.

**if you have commit access, you should wait not more than a week for the team to give feedback**.


### Credits

Thank you, [contributors](https://github.com/icalialabs/icalia_guides/graphs/contributors)!

![Icalia Labs](https://raw.githubusercontent.com/IcaliaLabs/kaishi/master/logo.png)

Watcher is maintained by [Icalia Labs](http://www.icalialabs.com/team).


