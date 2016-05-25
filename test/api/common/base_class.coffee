Slack = require '../../../src/slack'
BaseClass = require '../../../src/api/common/base_class'
sinon = require 'sinon'

describe 'BaseClass', =>

  @data =
    error: /^Missing/
    not_valid: /possibility/

  beforeEach =>
    @slack = new Slack 'token'
    @baseClass = new BaseClass @slack

  afterEach =>
    @slack = null
    @baseClass = null

  it 'receives the slack instance as parameter', =>
    @baseClass.slack.should.be.exactly @slack

  it 'has the apiKey setted in the instance', =>
    anotherInstance = new Slack 'anothertoken'

    @slack.api.api.slack.apiKey.should.be.exactly @slack.apiKey
    anotherInstance.api.api.slack.apiKey.should.be.exactly anotherInstance.apiKey

  describe '#throwError', =>

    it 'throws an error', =>
      error =
        ok: false
        error: 'Not Found'

      expectedError = new Error "#{error.error}"
      @baseClass.throwError(error).should.be.eql expectedError

  describe '#validate.obj', =>

    it 'checks if an object has specific keys', =>
      @baseClass.validate.obj(name: 'name', [ 'name' ]).should.be.true

    it 'throws an error when fails', =>
      ( => @baseClass.validate.obj name: 'name', [ 'id' ]).should.throw @data.error

  describe '#validate.str', =>

    it 'checks if an string isn\'t blank', =>
      @baseClass.validate.str('name').should.be.true

    it 'throws an error when fails', =>
      ( => @baseClass.validate.str '').should.throw @data.error

  describe '#validate.inclusion', =>

    it 'checks if a param match with given possibilities', =>
      @baseClass.validate.inclusion('name', [ 'name' ]).should.be.true

    it 'throws an error when fails', =>
      ( => @baseClass.validate.inclusion 'name', [ 'other' ]).should.throw @data.not_valid

  describe '#select', =>

    it 'returns an object with a filtered item', =>
      collection = [{ id: 1 }, { id: 2 }]
      @baseClass.select(collection, id: 2).should.be.eql collection[1]

    it 'returns an array of objects with the filtered items', =>
      collection = [{ id: 1 }, { id: 2 }]
      @baseClass.select(collection, id: 2, 'all').should.be.eql [ collection[1] ]

    it 'returns an empty object when no results', =>
      collection = [{ id: 1 }, { id: 2 }]
      @baseClass.select(collection, id: 3).should.be.eql {}
