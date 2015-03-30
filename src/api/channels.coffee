BaseClass = require './common/base_class'

class Channels extends BaseClass

  endpoints:
    archive: '/api/channels.archive'
    create: '/api/channels.create'
    history: '/api/channels.history'
    info: '/api/channels.info'
    invite: '/api/channels.invite'
    join: '/api/channels.join'
    kick: '/api/channels.kick'
    leave: '/api/channels.leave'
    list: '/api/channels.list'
    mark: '/api/channels.mark'
    rename: '/api/channels.rename'
    setPurpose: '/api/channels.setPurpose'
    setTopic: '/api/channels.setTopic'
    unarchive: '/api/channels.unarchive'

  #
  # Official API Methods
  #
  archive: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.archive, opts, callback

  create: (opts = {}, callback) ->
    @validate.obj opts, [ 'name' ]
    @request 'POST', @endpoints.create, opts, callback

  history: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'GET', @endpoints.history, opts, callback

  info: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'GET', @endpoints.info, opts, callback

  invite: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'user' ]
    @request 'POST', @endpoints.invite, opts, callback

  join: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.join, opts, callback

  kick: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'user' ]
    @request 'POST', @endpoints.kick, opts, callback

  leave: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.leave, opts, callback

  list: (opts = {}, callback) ->
    @request 'GET', @endpoints.list, opts, callback

  mark: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'ts' ]
    @request 'POST', @endpoints.mark, opts, callback

  rename: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'name' ]
    @request 'POST', @endpoints.rename, opts, callback

  setPurpose: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'purpose' ]
    @request 'POST', @endpoints.setPurpose, opts, callback

  setTopic: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'topic' ]
    @request 'POST', @endpoints.setTopic, opts, callback

  unarchive: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.unarchive, opts, callback

module.exports = Channels
