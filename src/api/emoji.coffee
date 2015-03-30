BaseClass = require './common/base_class'

class Emoji extends BaseClass

  endpoints:
    list: '/api/emoji.list'

  #
  # Official API Methods
  #
  list: (callback) ->
    @request 'GET', @endpoints.list, {}, callback

module.exports = Emoji
