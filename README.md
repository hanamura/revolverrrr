# revolverrrr

Shoot a tweet by copying from your following… possibly. This is originally created to help someone return from protected account to public account smoothly.

## Develop and deploy

Create new [Twitter app](https://apps.twitter.com/).

### Develop locally

```bash
export HUBOT_NAME="[your account’s screen name]"
export HUBOT_SOURCE_NAME="[source account’s screen name(s)]"
export HUBOT_TWITTER_KEY="[your app’s api key]"
export HUBOT_TWITTER_SECRET="[your app’s api secret]"
export HUBOT_TWITTER_TOKEN="[your account’s access token]"
export HUBOT_TWITTER_TOKEN_SECRET="[your account’s access token secret]"
```

Start development and tweet something.

```bash
npm start
```

### Deploy to Heroku

Set environment variables.

```bash
heroku config:set HUBOT_NAME="[your account’s screen name]"
heroku config:set HUBOT_SOURCE_NAME="[source account’s screen name(s)]"
heroku config:set HUBOT_TWITTER_KEY="[your app’s api key]"
heroku config:set HUBOT_TWITTER_SECRET="[your app’s api secret]"
heroku config:set HUBOT_TWITTER_TOKEN="[your account’s access token]"
heroku config:set HUBOT_TWITTER_TOKEN_SECRET="[your account’s access token secret]"
heroku config:set HUBOT_HEROKU_KEEPALIVE_URL="[your heroku app’s url]"
```

Add Redis add-on.

```bash
heroku addons:add rediscloud
```

## Tweet from source account

Normal (copied about once every 10 times):

> This tweet may possibly be copied.

Prevent copy:

> :no_good: This tweet will never be copied.

Force copy:

> :ok_woman: This tweet will always be copied.

### Prefix emojis to prevent copy

- :mask:
- :no_mouth:
- :speak_no_evil:
- :no_good:
- :mute:
- :lock:
- :no_entry_sign:
- :u7981:
- :secret:
- :ng:

### Prefix emojis to force copy

- :ok_woman:
- :loud_sound:
- :loudspeaker:
- :mega:
- :unlock:
- :recycle:
- :ok:

## License

MIT License
