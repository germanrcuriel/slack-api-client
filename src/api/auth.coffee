BaseClass = require './common/base_class'

class Auth extends BaseClass

  endpoints:
    test: '/api/auth.test'

  #
  # Official API Methods
  #
  test: (callback) ->
    @request 'GET', @endpoints.test, {}, callback

module.exports = Auth
