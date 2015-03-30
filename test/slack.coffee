Slack = require '../src/slack'

describe 'Slack', ->

  beforeEach ->
    @slack = new Slack 'token'

  afterEach ->
    @slack = null

  it 'is an instance of Slack class', ->
    @slack.should.be.an.instanceof Slack

  it 'has a host property', ->
    @slack.should.have.property 'host', 'https://api.slack.com'

  it 'sets apiKey with provided argument', ->
    @slack.apiKey.should.be.equal 'token'

  it 'adds api to the api object', ->
    @slack.api.should.have.property 'api'

  it 'adds auth to the api object', ->
    @slack.api.should.have.property 'auth'

  it 'adds channels to the api object', ->
    @slack.api.should.have.property 'channels'

  it 'adds chat to the api object', ->
    @slack.api.should.have.property 'chat'

  it 'adds emoji to the api object', ->
    @slack.api.should.have.property 'emoji'

  it 'adds groups to the api object', ->
    @slack.api.should.have.property 'groups'

  it 'adds im to the api object', ->
    @slack.api.should.have.property 'im'

  it 'adds oauth to the api object', ->
    @slack.api.should.have.property 'oauth'

  it 'adds rtm to the api object', ->
    @slack.api.should.have.property 'rtm'

  it 'adds search to the api object', ->
    @slack.api.should.have.property 'search'

  it 'adds stars to the api object', ->
    @slack.api.should.have.property 'stars'

  it 'adds team to the api object', ->
    @slack.api.should.have.property 'team'

  it 'adds users to the api object', ->
    @slack.api.should.have.property 'users'
