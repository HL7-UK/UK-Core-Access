Instance: Warning
InstanceOf: OperationOutcome
Description: "Example OperationOutcome containing warning"
* id = "264a0630-af8f-4a78-9367-01d6871fec77"
* issue
  * severity = #warning
  * code = #timeout
  * diagnostics = "PAS unavailable - search used cached data which may be up to 24h old"

Instance: Response-searchreturnswarning
InstanceOf: Bundle
Description: "Search containing a warning message"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?identifier=12345"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith
* entry[+]
  * fullUrl = "urn:uuid:57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #outcome
  * resource = Warning