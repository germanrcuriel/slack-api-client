BaseClass = require './common/base_class'

class OAuth extends BaseClass

  endpoints:
    access: '/api/oauth.access'

  #
  # Official API Methods
  #
  access: (opts = {}, callback) ->
    @validate.obj opts, [ 'client_id', 'client_secret', 'code' ]
    @request 'GET', @endpoints.access, opts, callback

module.exports = OAuth
