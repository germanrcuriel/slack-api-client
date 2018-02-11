# API

## api.test - Checks API calling code

#### Arguments:

| Argument | Example    | Required | Description                |
| -------- | ---------- | -------- | -------------------------- |
| `error`  | `my_error` | Optional | Error response to return   |
| `foo`    | `bar`      | Optional | Example property to return |

#### Example:

CoffeeScript

```coffeescript
slack.api.api.test
  person: 'John Doe'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
slack.api.api.test({
  person: 'John Doe'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#### Response:

```json
{
  "ok": true,
  "args": {
    "person": "John Doe"
  }
}
```

If called with an `error` argument an error response is returned:

```json
{
  "ok": false,
  "error": "my_error",
  "args": {
    "error": "my_error"
  }
}
```

### Errors:

This method has no expected error responses. However, other errors can be returned in the case where the service is down or other unexpected factors affect processing. Callers should always check the value of the ok params in the response.

---
