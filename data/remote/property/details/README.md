```dart
method = Http.GET

url = "BASE_URL/property/details"

headers = {
    "propertyId" : int,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {    
      "type" : "Enum -> (residential, commercial)",
      "subType" : "Enum -> (flat, apartment, building)",
      "buildingName" : String,
      "flatName" :String,
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
      "tenant": int or null
  }
}
```
