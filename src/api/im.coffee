BaseClass = require './common/base_class'

class IM extends BaseClass

  endpoints:
    close: '/api/im.close'
    history: '/api/im.history'
    list: '/api/im.list'
    mark: '/api/im.mark'
    open: '/api/im.post'

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
    @validate.obj opts, [ 'user' ]
    @request 'POST', @endpoints.open, opts, callback

module.exports = IM
