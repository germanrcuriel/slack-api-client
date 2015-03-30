BaseClass = require './common/base_class'

class Stars extends BaseClass

  endpoints:
    list: '/api/stars.list'

  #
  # Official API Methods
  #
  list: (opts = {}, callback) ->
    @request 'GET', @endpoints.list, opts, callback

module.exports = Stars
