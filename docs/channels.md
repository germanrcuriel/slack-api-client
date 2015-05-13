# Channels

## channels.archive - Archives a channel

#### Arguments:

| Argument  | Example               | Required | Description |
| --------- | --------------------- | -------- | ----------- |
| `token`   | `xxxx-xxxxxxxxx-xxxx` | Required | Authentication token (Requires scope: `post`) |
| `channel` | `C1234567890`         | Required | Channel to archive                            |

#### Example:

CoffeeScript

```coffeescript
slack.api.channels.archive
  token: 'xxxx-xxxxxxxxx-xxxx'
  channel: 'C1234567890'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
slack.api.channels.archive({
  token: 'xxxx-xxxxxxxxx-xxxx',
  channel: 'C1234567890'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#### Response:

```json
{
  "ok": true
}
```

### Errors:

This table lists the expected errors that this method will return. However, other errors can be returned in the case where the service is down or other unexpected factors affect processing. Callers should always check the value of the `ok` params in the response.

| Error | Description |
| ----- | ----------- |
| `channel_not_found`    | Value passed for `channel` was invalid.                                    |
| `already_archived`     | Channel has already been archived.                                         |
| `cant_archive_general` | You cannot archive the general channel.                                    |
| `last_ra_channel`      | You cannot archive the last channel for a restricted account.              |
| `restricted_action`    | A team preference prevents the authenticated user from archiving.          |
| `not_authed`           | No authentication token provided.                                          |
| `invalid_auth`         | Invalid authentication token.                                              |
| `account_inactive`     | Authentication token is for a deleted user or team.                        |
| `user_is_bot`          | This method cannot be called by a bot user.                                |
| `user_is_restricted`   | This method cannot be called by a restricted user or single channel guest. |

===

## channels.create - Creates a channel

#### Arguments:

| Argument  | Example               | Required | Description |
| --------- | --------------------- | -------- | ----------- |
| `token`   | `xxxx-xxxxxxxxx-xxxx` | Required | Authentication token (Requires scope: `post`) |
| `name`    | `mychannel`           | Required | Name of channel to create                     |

#### Example:

CoffeeScript

```coffeescript
slack.api.channels.create
  token: 'xxxx-xxxxxxxxx-xxxx'
  name: 'mychannel'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
slack.api.channels.create({
  token: 'xxxx-xxxxxxxxx-xxxx',
  name: 'mychannel'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#### Response:

If successful, the command returns a [channel object](https://api.slack.com/types/channel), including state information:

```json
{
  "ok": true,
  "channel": {
    "id": "C024BE91L",
    "name": "mychannel",
    "created": 1360782804,
    "creator": "U024BE7LH",
    "is_archived": false,
    "is_member": true,
    "is_general": false,
    "last_read": "0000000000.000000",
    "latest": null,
    "unread_count": 0,
    "unread_count_display": 0,
    "members": [ … ],
    "topic": { … },
    "purpose": { … }
  }
}

```

### Errors:

This table lists the expected errors that this method will return. However, other errors can be returned in the case where the service is down or other unexpected factors affect processing. Callers should always check the value of the `ok` params in the response.

| Error | Description |
| ----- | ----------- |
| `name_taken`         | A channel cannot be created with the given name.                           |
| `restricted_action`  | A team preference prevents the authenticated user from creating channels.  |
| `no_channel`         | Value passed for `name` was empty.                                         |
| `not_authed`         | No authentication token provided.                                          |
| `invalid_auth`       | Invalid authentication token.                                              |
| `account_inactive`   | Authentication token is for a deleted user or team.                        |
| `user_is_bot`        | This method cannot be called by a bot user.                                |
| `user_is_restricted` | This method cannot be called by a restricted user or single channel guest. |

===

## channels.history - Fetches history of messages and events from a channel

#### Arguments:

| Argument    | Example               | Required              | Description |
| ----------- | --------------------- | --------------------- | ----------- |
| `token`     | `xxxx-xxxxxxxxx-xxxx` | Required              | Authentication token (Requires scope: `read`)       |
| `channel`   | `C1234567890`         | Required              | Channel to fetch history                            |
| `latest`    | `1234567890.123456`   | Optional, default=now | End of time range of messages to include in results |
| `oldest`    | `1234567890.123456`   | Optional, default=0   | Start of time range of messages to include in results |
| `inclusive` | `1`                   | Optional, default=0   | Include messages with latest or oldest timestamp in results |
| `count`     | `100`                 | Optional, default=100 | Number of messages to return, between 1 and 1000 |

#### Example:

CoffeeScript

```coffeescript
slack.api.channels.history
  token: 'xxxx-xxxxxxxxx-xxxx'
  channel: 'C1234567890'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
slack.api.channels.create({
  token: 'xxxx-xxxxxxxxx-xxxx',
  channel: 'C1234567890'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#### Response:

```json
{
  "ok": true,
  "latest": "1358547726.000003",
  "messages": [
    {
      "type": "message",
      "ts": "1358546515.000008",
      "user": "U2147483896",
      "text": "Hello"
    },
    {
      "type": "message",
      "ts": "1358546515.000007",
      "user": "U2147483896",
      "text": "World",
      "is_starred": true
    },
    {
      "type": "something_else",
      "ts": "1358546515.000007",
      "wibblr": true
    }
  ],
  "has_more": false
}

```

The `messages` array up to 100 messages between `latest` and `oldest`. If there were more than 100 messages between those two points, then `has_more` will be true.

If a message has the same timestamp as `latest` or `oldest` it will not be included in the list, unless `inclusive` is true. This allows a client to fetch all messages in a hole in channel history, by calling channels.history with `latest` set to the oldest message they have after the hole, and `oldest` to the latest message they have before the hole. If the response includes `has_more` then the client can make another call, using the ts value of the final messages as the `latest` param to get the next page of messages.

If there are more than 100 messages between the two timestamps then the messages returned are the ones closest to `latest`. In most cases an application will want the most recent messages and will page backward from there. If `oldest` is provided but not `latest` then the messages returned are those closest to `oldest`, allowing you to page forward through history if desired.

Messages of type `"message"` are user-entered text messages sent to the channel, while other types are events that happened within the channel. All messages have both a `type` and a sortable `ts`, but the other fields depend on the `type`. For a list of all possible events, see the [channel messages](https://api.slack.com/docs/messages) documentation.

If a message has been starred by the calling user, the `is_starred` property will be present and true. This property is only added for starred items, so is not present in the majority of messages.

The `is_limited` boolean property is only included for free teams that have reached the free message limit. If true, there are messages before the current result set, but they are beyond the message limit.

### Errors:

This table lists the expected errors that this method will return. However, other errors can be returned in the case where the service is down or other unexpected factors affect processing. Callers should always check the value of the `ok` params in the response.

| Error | Description |
| ----- | ----------- |
| `channel_not_found` | Value passed for `channel` was invalid.             |
| `invalid_ts_latest` | Value passed for `latest` was invalid.              |
| `invalid_te_oldest` | Value passed for `oldest` was invalid.              |
| `not_authed`        | No authentication token provided.                   |
| `invalid_auth`      | Invalid authentication token.                       |
| `account_inactive`  | Authentication token is for a deleted user or team. |

===

## channels.info - Gets information about a channel
## channels.invite - Invites a user to a channel
## channels.join - Joins a channel, creating it if needed
## channels.kick - Removes a user from a channel
## channels.leave - Leaves a channel
## channels.list - Lists all channels in a Slack team
## channels.mark - Sets the read cursor in a channel
## channels.rename - Renames a channel
## channels.setPurpose - Sets the purpose for a channel
## channels.setTopic - Sets the topic for a channel
## channels.unarchive - Unarchives a channel
