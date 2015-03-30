request = require 'superagent'

class BaseClass

  constructor: (@slack) ->

  throwError: (error) ->
    {error} = error
    new Error "#{error}"

  request: (method = 'GET', url = '', params = {}, callback) ->
    params.token = @slack.apiKey

    xhr = request[method.toLowerCase()] "#{@slack.host}#{url}"

    if method is 'POST'
      xhr.type 'form'
      xhr.send params
    else
      xhr.query params

    xhr.end (err, res) =>
      throw err if err
      if res.ok
        unless res.body.ok
          callback @throwError res.body
        else
          callback null, res.body
      else
        callback @throwError res.body

  validate:
    obj: (options = {}, validation = []) ->
      validation.forEach (value) ->
        throw new Error "Missing #{value} parameter." unless options[value]
      true

    str: (param = '') ->
      throw new Error "Missing parameter." unless param
      true

    inclusion: (param = '', possibilities) ->
      unless param in possibilities
        throw new Error "#{param} isn't a possibility (#{possibilities})"
      true

  select: (collection = [], param = {}, type = 'one') ->
    @validate.str type, [ 'one', 'all' ]

    property = Object.keys(param)[0]
    selected = (item for item in collection when item[property] is param[property])

    if selected.length
      return selected[0] if type is 'one'
      return selected if type is 'all'
    else
      {}

module.exports = BaseClass
