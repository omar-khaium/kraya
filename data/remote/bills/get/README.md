```dart
method = Http.GET

url = "BASE_URL/bills/get"

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [
    {
        "id" : int,
        "name" : String,
        "amount" : int,
        "extra" : int
    }, ...
  ]
}
```
