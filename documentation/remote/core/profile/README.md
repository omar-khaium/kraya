```dart
method = Http.GET

url = "BASE_URL/core/profile"

headers = {
  "id" : int,      // user unique id
  "phone": String, // user phone number, if id is available, ignore phone number, id is not available, phone number is required.
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "user" : {
      "id": int,
      "phone": String;
      "first-name": String,
      "last-name": String,
      "email": String,
      "date-of-birth": int,
      "gender": Gender,
      "role": Role,
      "profile-picture": String
    }
  }
}
```
