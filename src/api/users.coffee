BaseClass = require './common/base_class'

class Users extends BaseClass

  endpoints:
    getPresence: '/api/users.getPresence'
    info: '/api/users.info'
    list: '/api/users.list'
    setActive: '/api/users.setActive'
    setPresence: '/api/users.setPresence'

  #
  # Official API Methods
  #
  getPresence: (opts = {}, callback) ->
    @validate.obj opts, [ 'user' ]
    @request 'GET', @endpoints.getPresence, opts, callback

  info: (opts = {}, callback) ->
    @validate.obj opts, [ 'user' ]
    @request 'GET', @endpoints.info, opts, callback

  list: (opts = {}, callback) ->
    @validate.obj opts, [ 'presence' ]
    @request 'GET', @endpoints.list, opts, callback

  setActive: (callback) ->
    @request 'POST', @endpoints.setActive, {}, callback

  setPresence: (opts = {}, callback) ->
    @validate.obj opts, [ 'presence' ]
    @validate.inclusion opts.presence, [ 'away', 'auto' ]
    @request 'POST', @endpoints.setPresence, opts, callback

module.exports = Users
