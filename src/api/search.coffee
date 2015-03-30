BaseClass = require './common/base_class'

class Search extends BaseClass

  endpoints:
    all: '/api/search.all'
    files: '/api/search.files'
    messages: '/api/search.messages'

  #
  # Official API Methods
  #
  all: (opts = {}, callback) ->
    @validate.obj opts, [ 'query' ]
    @request 'GET', @endpoints.all, opts, callback

  files: (opts = {}, callback) ->
    @validate.obj opts, [ 'query' ]
    @request 'GET', @endpoints.files, opts, callback

  messages: (opts = {}, callback) ->
    @validate.obj opts, [ 'query' ]
    @request 'POST', @endpoints.messages, opts, callback

module.exports = Search
