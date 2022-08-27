```dart
method = Http.POST (MULTI-PART/form-data)

url = "BASE_URL/core/registration"

headers = {
  "first-name" : String,
  "last-name" : String,
  "phone" : String,
  "email" : String,
  "date-of-birth" : int,
  "gender" : Gender,
  "role" : Role
}

body = {
    "profilePicture" : <File(images/.*)>
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "user-id" : "ADFSASD-ASDFASDF-ASDFASD-ADSA",    // user's guid id or empty if new user
  }
}
```
