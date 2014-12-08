module.exports = (robot) ->

  from = process.env.HUBOT_SOURCE_NAME
  throw new Error 'HUBOT_SOURCE_NAME missing' unless from

  robot.hear /(.+)/, (msg) ->
    data = msg.message.data
    text = msg.message.data.text

    return if data.user.screen_name isnt from
    return if data.entities.user_mentions.length
    return if data.entities.media

    console.log "Checking tweet: \"#{text}\""

    switch

      # CROSS MARK: http://www.fileformat.info/info/unicode/char/274c/index.htm
      when ~ text.indexOf "#\u274c"
        text = text.replace /#\u274c/g, ''
        rate = 0

      # HEAVY LARGE CIRCLE: http://www.fileformat.info/info/unicode/char/2b55/index.htm
      when ~ text.indexOf "#\u2b55"
        text = text.replace /#\u2b55/g, ''
        rate = 1

      else
        rate = 0.1

    # tweet

    if Math.random() < rate
      msg.send text

      console.log "Updated status: \"#{text}\""
