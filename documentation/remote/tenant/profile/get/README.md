```dart
method = Http.GET

url = "BASE_URL/tenant/profile/full"

headers = {
    "tenant-id" : String
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "profile": {
      "id": int,
      "tenant-id": String,
      "first-name": String,
      "last-name": String,
      "email": String,
      "phone": String,
      "gender": Gender,
      "role": Role,
      "date-of-birth": int,
      "profile-picture": String,
    },
    "additional": {
      "nid-number" : String,
      "nid-photo" : String,
      "passport-number" : String,
      "religion" : Religion,
      "father-name" : String,
      "permanent-address" : String,
    },
    "emergency-contact": {
      "name": String,
      "address": String,
      "relation": int,
      "contact-number": String,
    },
    "family-members": [
      {
        "name": String,
        "date-of-birth": int,
        "relation": int,
        "occupation": String,
        "nid-photo": String,
        "contact-number": String,
      },
    ],
  }
}
```
