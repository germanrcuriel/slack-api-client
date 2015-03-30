BaseClass = require './common/base_class'

class Api extends BaseClass

  endpoints:
    test: '/api/api.test'

  #
  # Official API Methods
  #
  test: (opts = {}, callback) ->
    @request 'GET', @endpoints.test, opts, callback

module.exports = Api
