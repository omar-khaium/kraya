```dart
method = Http.GET

url = "BASE_URL/finance/monthly/details"

header = {
    "userId" : String,
    "propertyId" : int,
    "month" : String,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [
        {
            "propertyId": int,
            "status": enum 
        }
    ]
}
```
