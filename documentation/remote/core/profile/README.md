```dart
method = Http.GET

url = "BASE_URL/core/profile"

headers = {
  "id" : String,      // user's guid id
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "user" : {
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
