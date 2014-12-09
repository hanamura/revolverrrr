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

      when text.indexOf("\ud83d\ude4a ") is 0, \ # SPEAK-NO-EVIL MONKEY
           text.indexOf("\ud83d\ude37 ") is 0, \ # FACE WITH MEDICAL MASK
           text.indexOf("\u3299\ufe0f ") is 0, \ # CIRCLED IDEOGRAPH SECRET
           text.indexOf("\ud83d\ude45 ") is 0, \ # FACE WITH NO GOOD GESTURE
           text.indexOf("\ud83c\udd96 ") is 0, \ # SQUARED NG
           text.indexOf("\ud83c\ude32 ") is 0, \ # SQUARED CJK UNIFIED IDEOGRAPH-7981
           text.indexOf("\ud83d\udeab ") is 0, \ # NO ENTRY SIGN
           text.indexOf("\ud83d\ude36 ") is 0, \ # FACE WITHOUT MOUTH
           text.indexOf("\ud83d\udd07 ") is 0, \ # SPEAKER WITH CANCELLATION STROKE
           text.indexOf("\ud83d\udd12 ") is 0    # LOCK
        rate = 0

      when text.indexOf("\ud83d\ude46 ") is 0, \ # FACE WITH OK GESTURE
           text.indexOf("\ud83c\udd97 ") is 0, \ # SQUARED OK
           text.indexOf("\ud83d\udd13 ") is 0, \ # OPEN LOCK
           text.indexOf("\ud83d\udd0a ") is 0, \ # SPEAKER WITH THREE SOUND WAVES
           text.indexOf("\ud83d\udce2 ") is 0, \ # PUBLIC ADDRESS LOUDSPEAKER
           text.indexOf("\ud83d\udce3 ") is 0    # CHEERING MEGAPHONE
        text = text.substr 3
        rate = 1

      else
        rate = 0.1

    # tweet

    if Math.random() < rate
      msg.send text

      console.log "Updated status: \"#{text}\""
