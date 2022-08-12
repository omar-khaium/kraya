```dart
method = Http.GET

url = "BASE_URL/user/profile"

headers = {
  "user-id" : "user's guid id",
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encounterning error,
  "result" : {
    "user" : {
      "first-name": "john",
      "last-name": "doe",
      "email": "john@kraya.com",
      "date-of-birth": 192312312361281236,
      "gender": 0     // enum based: 0->male, 1->female, 2->non-binary,
      "profile-picture": "http://.....",
    }
  }
}
```
