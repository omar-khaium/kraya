```dart
method = Http.GET

url = "BASE_URL/owner/property/bills"

headers = {
    "owner-id" : String,
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
