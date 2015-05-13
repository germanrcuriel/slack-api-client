# Auth

## auth.test - Checks authentication & identity

#### Arguments:

| Argument | Example | Required | Description |
| -------- | ------- | -------- | ----------- |
| `token`  | `xxxx-xxxxxxxxx-xxxx` | Required | Authentication token (Requires scope: `identify`) |

#### Example:

CoffeeScript

```coffeescript
slack.api.auth.test
  token: 'xxxx-xxxxxxxxx-xxxx'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
slack.api.auth.test({
  token: 'xxxx-xxxxxxxxx-xxxx'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#### Response:

```json
{
  "ok": true,
  "url": "https:\/\/myteam.slack.com\/",
  "team": "My Team",
  "user": "cal",
  "team_id": "T12345",
  "user_id": "U12345"
}
```

### Errors:

This table lists the expected errors that this method will return. However, other errors can be returned in the case where the service is down or other unexpected factors affect processing. Callers should always check the value of the `ok` params in the response.

| Error | Description |
| ----- | ----------- |
| ` not_authed`      | No authentication token provided.                   |
| `invalid_auth`     | Invalid authentication token.                       |
| `account_inactive` | Authentication token is for a deleted user or team. |
