module.exports = (robot) ->
  robot.hear /^want (.*)/i, (msg) ->
    title = "#{msg.match[1]}"

    Trello = require("node-trello")
    t = new Trello(process.env.HUBOT_TRELLO_KEY, process.env.HUBOT_TRELLO_TOKEN)
    t.post "/1/cards", {name: title, idList: process.env.HUBOT_TRELLO_WANT}, (err, data) ->
      if err
        msg.send "ERROR"
        return
      msg.send "「#{title}」 をTrelloのWANTボードに保存しました"
  robot.hear /^todo (.*)/i, (msg) ->
    title = "#{msg.match[1]}"

    Trello = require("node-trello")
    t = new Trello(process.env.HUBOT_TRELLO_KEY, process.env.HUBOT_TRELLO_TOKEN)
    t.post "/1/cards", {name: title, idList: process.env.HUBOT_TRELLO_TODO}, (err, data) ->
      if err
        msg.send "ERROR"
        return
      msg.send "「#{title}」 をTrelloのTODOボードに保存しました"
