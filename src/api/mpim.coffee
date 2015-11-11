BaseClass = require './common/base_class'

class MPIM extends BaseClass

  endpoints:
    close: '/api/mpim.close'
    history: '/api/mpim.history'
    list: '/api/mpim.list'
    mark: '/api/mpim.mark'
    open: '/api/mpim.open'

  #
  # Official API Methods
  #
  close: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.close, opts, callback

  history: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'GET', @endpoints.history, opts, callback

  list: (callback) ->
    @request 'GET', @endpoints.list, {}, callback

  mark: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'ts' ]
    @request 'POST', @endpoints.mark, opts, callback

  open: (opts = {}, callback) ->
    @validate.obj opts, [ 'users' ]
    @request 'POST', @endpoints.open, opts, callback

module.exports = MPIM
