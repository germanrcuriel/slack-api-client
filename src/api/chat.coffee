BaseClass = require './common/base_class'

class Chat extends BaseClass

  endpoints:
    delete: '/api/chat.delete'
    postMessage: '/api/chat.postMessage'
    update: '/api/chat.update'

  #
  # Official API Methods
  #
  delete: (opts = {}, callback) ->
    @validate.obj opts, [ 'ts', 'channel' ]
    @request 'POST', @endpoints.delete, opts, callback

  postMessage: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'text' ]
    @request 'POST', @endpoints.postMessage, opts, callback

  update: (opts = {}, callback) ->
    @validate.obj opts, [ 'ts', 'channel', 'text' ]
    @request 'POST', @endpoints.update, opts, callback

module.exports = Chat
