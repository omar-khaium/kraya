```dart
method = Http.POST (MULTI-PART/form-data)

url = "BASE_URL/registration"

headers = {
  "firstName" : "String",
  "lastName" : "String",
  "phone" : "11 or 14 digit valid phone number",
  "email" : "valid and unique email address",
  "dateOfBirth" : "Int",
  "gender" : "Enum -> (male, female)",
  "userType" : "Enum -> (owner, tenant)"
}

body = {
    "profilePicture" : <File(images/.*)>
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "user-id" : "ADFSASD-ASDFASDF-ASDFASD-ADSA",    // user's guid id or empty if new user
  }
}
```
