## Lifteri

[![Lifteri Tests][lifteri-ci-image]][lifteri-ci]

Most awesome Hitch-hiking App.

[lifteri-ci]: https://travis-ci.org/hitch-hiking-app/backend.svg?branch=master
[lifteri-ci-image]: https://travis-ci.org/hitch-hiking-app/backend.svg?branch=master

#### POST /register

*This route is present for the signup of new users.*

POST https://salty-river-31528.herokuapp.com/register

Params:
  * id: integer
  * first_name: string
  * last_name: string
  * email: string
  * password: string
  * auth_token: string

Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

**Request:**

```
{
  "first_name": "Joe",
  "last_name": "Schmoe",
  "email": "joe@email.com",
  "password": "password"
}
```

**Response:**

```
{
  "user": {
    "id": 2,
    "first_name": "joe",
    "last_name": "schmoe",
    "email": "joe@email.com",
    "auth_token": "f5cbaa437d4eaed621afd81496501d39"
  }
}
```


