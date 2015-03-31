slack-api-client
==============

[![NPM Version](https://badge.fury.io/js/slack-api-client.svg)](https://npmjs.org/package/slack-api-client)
[![Build Status](https://api.travis-ci.org/germanrcuriel/slack-api-client.svg?branch=master)](https://travis-ci.org/germanrcuriel/slack-api-client)
[![Package downloads](http://img.shields.io/npm/dm/slack-api-client.svg)](https://npmjs.org/package/slack-api-client)

```javascript
var SlackClient = require('slack-api-client');

var slack = new SlackClient('token');

slack.api.chat.postMessage({
  channel: '#notifications',
  username: 'Slack Client',
  text: 'Hello world!'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

## Installation

```sh
$ npm install slack-api-client
```

## API and documentation

  - API:
    - [api.test - Checks API calling code](docs/api.md#apitest---checks-api-calling-code)

  - Work in progress. Documentation will be available shortly.

More information at [Slack API Documentation](https://api.slack.com/methods/)


## Running Tests

To run the test suite, first invoke the following command within the repo, installing the development dependencies:

```sh
$ npm install
```

Then run the tests:

```sh
$ npm test
```

## License

[MIT](LICENSE.md)
