```dart
method = Http.GET

url = "BASE_URL/core/property/details"

headers = {
    "property-id" : int,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {    
      "owner-id": String,
      "tenant-id": String or null,
      "type" : PropertyType,
      "sub-type" : PropertySubType,
      "building-name" : String,
      "flat-name" :String,
      "address" : String,
      "size" : int,
      "room" : int,
      "bathroom" : int,
      "balcony" : int,
      "advance" : int,
      "rent" : int,
      "description": String,
      "pictures": [ String, ...],
      "features": [ int, ...],
      "availability": {
        "available": bool,
        "from": int or null
      },
      "created-at": int
  }
}
```
