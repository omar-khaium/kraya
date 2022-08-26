```dart
method = Http.POST (MULTI-PART/form-data)

url = "BASE_URL/owner/property/add"

headers = {
  "user-id" : String,
  "type" : PropertyType,
  "sub-type" : PropertySubType,
  "building-name" : String,
  "flat-name" : String,
  "address" : String,
  "size" : int,
  "room" : int,
  "bathroom" : int,
  "balcony" : int,
  "advance" : int,
  "rent" : int,
  "description": String
}

body = {
    "picture" : [File(images/.*), ...],
    "features" : [<int>, ... ],
    "availability": {
        "available": bool,
        "from": int or null
    },
    "bills" : [
        {    
            "id": int or null,
            "name": String,
            "amount": int,
            "extra": int,
        
        }, ...
    ],
    "tenant": int or null
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
