BaseClass = require './common/base_class'

class Teams extends BaseClass

  endpoints:
    accessLogs: '/api/team.accessLogs'
    info: '/api/team.info'

  #
  # Official API Methods
  #
  accessLogs: (opts = {}, callback) ->
    @request 'GET', @endpoints.accessLogs, opts, callback

  info: (callback) ->
    @request 'GET', @endpoints.info, {}, callback

module.exports = Teams
