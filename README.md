
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
  * [Trip Add Rider](#trip-add-rider)
  * [Trip Delete](#trip-delete)
  * [Trip Search](#trip-search)
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

**Params:**

Name | Type | Description
--- | --- | ---
user_name | string | **Required.** User's username as specified in the database.
password | string | **Required.** User's password as specified in the database.

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Request:**

```
{
  "user_name": "userjoe"
  "password": "password"
}
```

**Example Response:**

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

**Params:**

Name | Type | Description
--- | --- | ---
first_name | string | **Optional.** First name of the user.
last_name | string | **Optional.** Last name of the user.
phone | integer | **Optional.** User's contact number.
home_city | string | **Optional.** User's credit card number.
car_info | string | **Optional.** User's car information.
license_plate | string | **Optional.** User's profile picture image link.
license_number | string | **Optional.** User's license plate number.
credit_card_number | string | **Optional.** User's license plate number.
driver | boolean | This sets a drivers status from false to true.

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Request**
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

**Example Response**
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

**Params:**

Name | Type | Description
--- | --- | ---
departing_city | string | **Required.** Driver's departing city.
destination | string | **Required.** Driver's destination city.
seats_available | integer | **Required.** Driver's must input available seats in vehicle except his own.
seat_price | integer | **Required.** Driver's are allowed to set a price per seat.
date_leave | date | **Required.** Driver's must set a departing date.
date_arrive | date | **Required.** Driver's must set an arrival date.
comments | text | **Optional.** Driver's are allowed to leave comments for other users.
depart_latitude | float | **Required.**
depart_longitude | float | **Required.**
destination_latitude | float | **Required.**
destination_longitude | float | **Required.**

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.


**Example Request:**

```
{
  "departing_city": "Washington DC"
  "destination": "Atlanta",
  "seats_available": "2",
  "seat_price": "50",
  "date_leave": "2016-01-01",
  "date_arrive": "2016-01-02"
  "comments": "Looking forward to the trip"
  "depart_latitude": 33.75373,
  "depart_longitude": -84.391847,
  "destination_latitude": -84.362606,
  "destination_longitude": -84.362606
}
```

**Example Response:**

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
    "depart_latitude": 33.75373,
    "depart_longitude": -84.391847,
    "destination_latitude": -84.362606,
    "destination_longitude": -84.362606
  }
}
```

#### Trips Index

#### GET /hosts

*This route is present to get a list of all the trips being hosted.*

GET https://salty-river-31528.herokuapp.com/hosts

**Params:** *None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.

**Example Response:**
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

**Params:** *None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.

**Example Response:**
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

**Params:**

Name | Type | Description
--- | --- | ---
departing_city | string | **Optional.** Driver's departing city.
destination | string | **Optional.** Driver's destination city.
seats_available | integer | **Optional.** Driver's must input available seats in vehicle except his own.
seat_price | integer | **Optional.** Driver's are allowed to set a price per seat.
date_leave | date | **Optional.** Driver's must set a departing date.
date_arrive | date | **Optional.** Driver's must set an arrival date.
comments | text | **Optional.** Driver's are allowed to leave comments for other users.

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

#### Trip Add Rider

#### PUT /riders/:id

*This route is present to update the seats available and add a rider to a trip*

PUT https://salty-river-31528.herokuapp.com/riders/:id

**Params:** *None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Response:**
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

**Params:** *None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Response:**
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
## **Trip Search**

*This route is present for the searching of trips based on latitude, longitude, and radius.*

**Destination Search Parameters**

Name | Type | Description
--- | --- | ---
dest_search | route | **Required.**
destination_latitude | float | **Required.** 
destination_longitude | float | **Required.** 

**Departing Search Parameters**

Name | Type | Description
--- | --- | ---
depart_search | route | **Required.**
departing_latitude | float | **Required.**
departing_longitude | float | **Required.** 

**Example Path**

`GET '/dest_search?destination_latitude=33.753730&destination_longitude=-84.391847&radius=100'`

OR

`GET '/depart_search?depart_latitude=33.753730&depart_longitude=-84.391847&radius=100'`

## **Profile Model**

#### Profile Show

#### GET /profile/:id

*This route is present for the viewing profiles of logged in users.*

GET https://salty-river-31528.herokuapp.com/profile/:user_id

**Params:** *None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Request:**

```
{
  "Auth-Token": "203c7eb41a80cbb5398cc6b6db22ccc3"
}
```

**Example Response:**

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

**Params:**

Name | Type | Description
--- | --- | ---
user_name | string | **Optional.** Unique username for a new user.
password | string | **Optional.** Password provided must be at least 6 characters long.
first_name | string | **Optional.** First name of the user.
last_name | string | **Optional.** Last name of the user.
email | string | **Optional.** User's contact email.
password | string | **Optional.** User's password.
image | string | **Optional.** User's profile picture image link.
phone | integer | **Optional.** User's contact number.
home_city | string | **Optional.** User's credit card number.
car_info | string | **Optional.** User's car information.
license_plate | string | **Optional.** User's profile picture image link.
license_number | string | **Optional.** User's license plate number.
credit_card_number | string | **Optional.** User's license plate number.

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Request:**

```
{
  "Auth-Token": "203c7eb41a80cbb5398cc6b6db22ccc3"
}
```

**Example Response:**

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

**Params:** *None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server has processed the request and has successfully updated the user.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Request:**

```
{
  "Auth-Token": "203c7eb41a80cbb5398cc6b6db22ccc3"
}
```

**Example Reponse:**

```
{
  "message": "Profile deleted."
}
```


