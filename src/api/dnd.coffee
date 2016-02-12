BaseClass = require './common/base_class'

class Dnd extends BaseClass

  endpoints:
    endDnd: '/api/dnd.endDnd'
    endSnooze: '/api/dnd.endSnooze'
    info: '/api/dnd.info'
    setSnooze: '/api/dnd.setSnooze'
    teamInfo: '/api/dnd.teamInfo'

  #
  # Official API Methods
  #
  endDnd: (opts = {}, callback) ->
    @request 'POST', @endpoints.endDnd, opts, callback

  endSnooze: (opts = {}, callback) ->
    @request 'POST', @endpoints.endSnooze, opts, callback

  info: (opts = {}, callback) ->
    @validate.obj opts, [ 'user' ]
    @request 'POST', @endpoints.info, opts, callback

  setSnooze: (opts = {}, callback) ->
    @validate.obj opts, [ 'number' ]
    @request 'POST', @endpoints.setSnooze, opts, callback

  teamInfo: (opts = {}, callback) ->
    @validate.obj opts, [ 'users' ]
    @request 'POST', @endpoints.teamInfo, opts, callback

module.exports = Dnd
