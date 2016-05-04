
[lifteri-ci]: https://travis-ci.org/hitch-hiking-app/backend.svg?branch=master
[lifteri-ci-image]: https://travis-ci.org/hitch-hiking-app/backend.svg?branch=master

# Lifteri [![Lifteri Tests][lifteri-ci-image]][lifteri-ci]

## API Documentation for Hitch-hiking/Carpool App

### Table of Contents
1. [User Model](#user-model)
  * [Users Registration](#users-registration)
  * [Users Login](#users-login)
  * [Users Trip Update](#users-trip-update)
2. [Trip Model](#trip-model)
  * [Trip Registration](#trip-registration)
  * [Trip Index](#trip-index)
  * [Trip Update](#trip-update)
  * [Trip Rider](#trip-rider)
  * [Trip Delete](#trip-delete)
3. [Profile Model](#profile-model)
  * [Profile Show](#profile-show)
  * [Profile Edit](#profile-edit)
  * [Profile Delete](#profile-delete)

## **User Model**

#### Users Registration

#### POST /register

*This route is present for the signup of new users.*

POST https://salty-river-31528.herokuapp.com/register

**Params:**

Name | Type | Description
--- | --- | ---
user_name | string | **Required.** Unique username for a new user.
password | string | **Required.** Password provided must be at least 6 characters long.
first_name | string | **Required.** First name of the user.
last_name | string | **Required.** Last name of the user.
email | string | **Required.** User's contact email.
password | string | **Required.** User's password.
image | string | **Optional.** User's profile picture image link.

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Request:**

```
{
  "user_name": "userjoe"
  "first_name": "Joe",
  "last_name": "Schmoe",
  "email": "joe@email.com",
  "password": "password"
  "image": "image."
}
```

**Example Response:**

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

#### Users Login

#### POST /logins

*This route is present for the login of users.*

POST https://salty-river-31528.herokuapp.com/logins

Name | Type | Description
--- | --- | ---
user_name | string | **Required.** User's username as specified in the database.
password | string | **Required.** User's password as specified in the database.


Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

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

#### Users Trip Update

#### PUT /users/:id

*This route is present to update user information when hosting a trip*

PUT https://salty-river-31528.herokuapp.com/users/:id

Params:
  * first_name: string
  * last_name: string
  * phone: integer
  * car_info: integer
  * home_city: date
  * license_plate: date
  * license_number: text
  * credit_card_number

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Request**
```
  "first_name": "alan",
  "last_name": "smith",
  "phone": "4043234546",
  "car_info": black honda,
  "home_city": "Atlanta",
  "license_plate": "3e35",
  "license_number": "3445rf33",
  "credit_card_number": 34545,
```

**Response**
```
{
  "user":{
    "first_name": "alan",
    "last_name": "smith",
    "phone": "4043234546",
    "car_info": black honda,
    "home_city": "Atlanta",
    "license_plate": "3e35",
    "license_number": "3445rf33",
    "credit_card_number": 34545,
    "driver": true
  }
}
```

## **Trip Model**

#### Trips Registration

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

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.


**Request:**

```
{
  "departing_city": "Washington DC"
  "destination": "Atlanta",
  "seats_available": "2",
  "seat_price": "50",
  "date_leave": "2016-01-01",
  "date_arrive": "2016-01-02"
  "comments": "Looking forward to the trip"
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
    "comments": "Looking forward to the trip"
  }
}
```

#### Trips Index

#### GET /hosts

*This route is present to get a list of all the trips being hosted.*

GET https://salty-river-31528.herokuapp.com/hosts

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.

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
      "comments": "Looking forward to the trip"
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
      "comments": "Looking forward to the trip"
    }
  ]
}
```

#### Trip Show

#### GET /hosts/:id

*This route is present to show a trip being hosted.*

GET https://salty-river-31528.herokuapp.com/hosts/:id

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.

**Response**
```
{
  "hosts": {
    "id": 6,
    "user_id": 26,
    "departing_city": "Los Angeles",
    "destination": "Seattle",
    "seats_available": 2,
    "seat_price": 100,
    "created_at": "2016-04-26T19:31:32.529Z",
    "updated_at": "2016-04-26T19:31:32.529Z",
    "date_leave": "2016-01-01",
    "date_arrive": "2016-01-03",
    "comments": "Looking forward to the trip"
  }
}
```

#### Trip Update

#### PUT /hosts/:id

*This route is present to update trip information of an existing user*

PUT https://salty-river-31528.herokuapp.com/hosts/:id

Params:
  * departing_city: string
  * destination: string
  * seats_available: integer
  * seat_price: integer
  * date_leave: date
  * date_arrive: date
  * comments: text

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

#### Trip Rider

#### PUT /riders/:id

*This route is present to update the seats available and add a rider to a trip*

PUT https://salty-river-31528.herokuapp.com/riders/:id

Params:
  * seats_available: integer

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Response**
```
{
  "hosts": {
    "seats_available": 4
  }
}
```

#### Trip Delete

#### DELETE /hosts/:id

*This route is to delete a trip*

DELETE https://salty-river-31528.herokuapp.com/hosts/:id

Params:
* id: integer - this comes from the url (:id)

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Response**
```
{
  "departing_city": "Atlanta"
  "destination": "New York",
  "seats_available": "2",
  "seat_price": "100",
  "date_leave": "2016-01-01",
  "date_arrive": "2016-01-02"
  "comments": "Looking forward to the trip"
}

{
  "host": {
    "user_name": "mark_smith",
    "first_name": "Mark",
    "last_name": "Smith",
    "email": "mark@hotmail.com",
    "user_id": 15,
    "id": 13,
    "departing_city": "Atlanta",
    "destination": "New York",
    "seats_available": 2,
    "seat_price": 50,
    "date_leave": "2016-01-01",
    "date_arrive": "2016-01-03",
    "comments": "Looking forward to the trip."
  }
}
```

## **Profile Model**

#### Profile Show

#### GET /profile/:id

*This route is present for the viewing profiles of logged in users.*

GET https://salty-river-31528.herokuapp.com/profile/:user_id

Params:
  * user_name: string
  * id: integer
  * first_name: string
  * last_name: string
  * email: string
  * password: string
  * auth_token: string

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Request:**

```
{
  "Auth-Token": "203c7eb41a80cbb5398cc6b6db22ccc3"
}
```

**Response:**

```
{
  "user": {
    "id": 54,
    "user_name": "someone11234",
    "first_name": "some",
    "last_name": "one",
    "email": "some11one1111131142111111111111413314@email.com",
    "auth_token": "203c7eb41a80cbb5398cc6b6db22ccc3",
    "driver": false,
    "phone": 7701235678,
    "car_info": 2010 Generic Car Black,
    "home_city": Atlanta, GA,
    "license_plate": 789162w,
    "license_number": 124809248091,
    "credit_card_number": 124212141241,
    "pictures": [
      {
        "image_url": "http://s3.amazonaws.com/lifteri/pictures/images/000/000/001/original/Screen_Shot_2016-04-17_at_2.34.38_PM.png?1461857236"
      }
    "host": [
      {
        "host": 54,
        "departing_city": "vietnam",
        "destination": "alaska",
        "seats_available": 10,
        "seat_price": 10,
        "date_leave": "2016-01-01",
        "date_arrive": "2016-02-12",
        "comments": "hey"
      },
      {
        "host": 55,
        "departing_city": "georgia",
        "destination": "colorado",
        "seats_available": 10,
        "seat_price": 10,
        "date_leave": "2016-01-01",
        "date_arrive": "2016-02-12",
        "comments": "hey"
      }
    ]
  }
```
#### Profile Edit

#### PUT /profile/:id

*This route is present for editing profiles of logged in users.*

PUT https://salty-river-31528.herokuapp.com/profile/:user_id

Params:
  * user_name: string
  * id: integer
  * first_name: string
  * last_name: string
  * email: string
  * password: string
  * auth_token: string
  * driver: true,
  * phone: 7701234567,
  * car_info: 2010 Generic Car,
  * home_city: Atlanta, GA,
  * license_plate: JOE 1234,
  * license_number: 12345678,
  * credit_card_number: 12345677890,
  * pictures: [www.picture.com]

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Request:**

```
{
  "Auth-Token": "203c7eb41a80cbb5398cc6b6db22ccc3"
}
```

**Response:**

```
{
  "user": {
    "id": 58,
    "user_name": "joeschmoe123",
    "first_name": joe,
    "last_name": schmoe,
    "email": "joeschmoe123@email.com",
    "auth_token": "d0519f72d521331ef633b99c9acf01e3",
    "driver": true,
    "phone": 7701234567,
    "car_info": 2010 Generic Car,
    "home_city": Atlanta, GA,
    "license_plate": JOE 1234,
    "license_number": 12345678,
    "credit_card_number": 12345677890,
    "pictures": [
      {
        "image_url": "http://s3.amazonaws.com/lifteri/pictures/images/000/000/012/original/Screen_Shot_2016-04-24_at_10.43.29_AM_%282%29.png?1461953510"
      }
    ]
  }
}
```

#### Profile Delete

#### DELETE profile/:id

*This route is present for the deleting of a users profile.*

DELETE https://salty-river-31528.herokuapp.com/profile/:user_id

Params: None

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Request:**

```
{
  "Auth-Token": "203c7eb41a80cbb5398cc6b6db22ccc3"
}
```

**Reponse:**

```
{
  "message": "Profile deleted."
}
```


