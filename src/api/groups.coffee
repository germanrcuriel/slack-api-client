BaseClass = require './common/base_class'

class Groups extends BaseClass

  endpoints:
    archive: '/api/groups.archive'
    close: '/api/groups.close'
    create: '/api/groups.create'
    createChild: '/api/groups.createChild'
    history: '/api/groups.history'
    invite: '/api/groups.invite'
    kick: '/api/groups.kick'
    leave: '/api/groups.leave'
    list: '/api/groups.list'
    mark: '/api/groups.mark'
    open: '/api/groups.open'
    rename: '/api/groups.rename'
    setPurpose: '/api/groups.setPurpose'
    setTopic: '/api/groups.setTopic'
    unarchive: '/api/groups.unarchive'

  #
  # Official API Methods
  #
  archive: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.archive, opts, callback

  close: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.close, opts, callback

  create: (opts = {}, callback) ->
    @validate.obj opts, [ 'name' ]
    @request 'POST', @endpoints.create, opts, callback

  createChild: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.create, opts, callback

  history: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'GET', @endpoints.history, opts, callback

  invite: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel', 'user' ]
    @request 'POST', @endpoints.invite, opts, callback

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

  open: (opts = {}, callback) ->
    @validate.obj opts, [ 'channel' ]
    @request 'POST', @endpoints.open, opts, callback

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

module.exports = Groups
