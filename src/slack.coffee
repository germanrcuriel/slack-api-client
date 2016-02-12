class Slack

  host: 'https://api.slack.com'
  api: []

  constructor: (@apiKey) ->
    @addResources
      'api': require './api/api'
      'auth': require './api/auth'
      'channels': require './api/channels'
      'chat': require './api/chat'
      'dnd': require './api/dnd'
      'emoji': require './api/emoji'
      'groups': require './api/groups'
      'im': require './api/im'
      'mpim': require './api/mpim'
      'oauth': require './api/oauth'
      'rtm': require './api/rtm'
      'search': require './api/search'
      'stars': require './api/stars'
      'team': require './api/team'
      'users': require './api/users'

  addResources: (resources) ->
    for name, module of resources
      @api[name] = new module @

module.exports = Slack
