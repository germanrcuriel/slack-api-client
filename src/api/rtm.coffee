BaseClass = require './common/base_class'

class RTM extends BaseClass

  endpoints:
    start: '/api/rtm.start'

  #
  # Official API Methods
  #
  start: (callback) ->
    @request 'GET', @endpoints.start, {}, callback

module.exports = RTM
