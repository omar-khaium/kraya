```dart
method = Http.GET

url = "BASE_URL/core/property/bills"

headers = {
    "property-id" : int
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "total" : int,
    "bills" : [
        "name": String,
        "amount": int,
    ],      
  }
}
```
