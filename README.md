## Lifteri

[![Lifteri Tests][lifteri-ci-image]][lifteri-ci]

Most awesome Hitch-hiking App.

[lifteri-ci]: https://travis-ci.org/hitch-hiking-app/backend.svg?branch=master
[lifteri-ci-image]: https://travis-ci.org/hitch-hiking-app/backend.svg?branch=master

#### POST /register

*This route is present for the signup of new users.*

POST https://salty-river-31528.herokuapp.com/register

Params:
  * user_name: string
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
  "user_name": "userjoe"
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
    "id": 1,
    "user_name": "user_joe",
    "first_name": "Joe",
    "last_name": "Schmoe",
    "email": "joe@email.com",
    "auth_token": "1391544df4fac2ab649c845e26b50df8",
    "driver": false,
    "picture": {
      "url": "http://lifteri.s3-website-us-east-1.amazonaws.com/lifteri/pictures/images//original/Screen_Shot_2016-04-17_at_2.34.38_PM.png?1461698064"
    }
  }
}
```

#### POST /logins

*This route is present for the login of users.*

POST https://salty-river-31528.herokuapp.com/logins

Params:
  * user_name: string
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
  "user_name": "userjoe"
  "password": "password"
}
```

**Response:**

```
{
  "user": {
    "id": 5,
    "user_name:" "userjoe",
    "first_name": "joe",
    "last_name": "schmoe",
    "email": "joe@email.com",
    "auth_token": "f5cbaa437d4eaed621afd81496501d39"
  }
}
```

#### POST /hosts

*This route is present to create a new trip to host.*

POST https://salty-river-31528.herokuapp.com/hosts

Params:
  * departing_city: string
  * destination: string
  * seats_available: integer
  * seat_price: integer
  * date_leave: date
  * date_arrive: date
  * comments: text

Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

**Request:**

```
{
  "departing_city": "Washington DC"
  "destination": "Atlanta",
  "seats_available": "2",
  "seat_price": "50",
  "date_leave": "2016-01-01",
  "date_arrive": "2016-01-02"
  "comments": "they were nice"
}
```

**Response:**

```
{
  "host": {
    "user_name": "mark_smith",
    "first_name": "Mark",
    "last_name": "Smith",
    "email": "mark@hotmail.com",
    "departing_city": "Atlanta",
    "destination": "Los Angeles",
    "seats_available": 2,
    "seat_price": 100,
    "date_leave": "2016-01-01",
    "date_arrive": "2016-01-03",
    "comments": "they were nice"
  }
}
```
#### GET /hosts

*This route is present to get a list of all the trips being hosted.*

Returns 200 OK on success.

**Response**
```
{
  "host": [
    {
      "id": 1,
      "user_id": 20,
      "departing_city": "Atlanta",
      "destination": "Los Angeles",
      "seats_available": 2,
      "seat_price": 100,
      "date_leave": "2016-01-01",
      "date_arrive": "2016-01-03",
      "comments": "it was fun"
    },
    {
      "id": 2,
      "user_id": 20,
      "departing_city": "Los Angeles",
      "destination": "Seattle",
      "seats_available": 2,
      "seat_price": 100,
      "date_leave": "2016-01-01",
      "date_arrive": "2016-01-03",
      "comments": "long trip"
    }
  ]
}
```
