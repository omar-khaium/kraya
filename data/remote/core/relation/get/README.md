```dart
method = Http.GET

url = "BASE_URL/core/relation/get-all"

headers = {}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [
    {
        "id" : id,
        "name": String,
    }
  ]
}
```
