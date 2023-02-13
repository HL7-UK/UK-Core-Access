Instance: UKCoreAccessProvider-instance
InstanceOf: CapabilityStatement
Usage: #example
Title: "UKCore Access"
* status = #active
* date = 2021-01-01
* kind = #instance
* fhirVersion = #4.0.1
* format = #json
* description = "An example of a Provider supporting UKCore Access requirements."
* instantiates = Canonical(UKCoreAccessProvider)
* implementation
  * description = "FHIR Server providing access to information controlled by Provider"
  * url = "https://fhir.example-provider.nhs.uk/"
* rest
  * mode = #server
  * security
    * cors = true
    * service = http://terminology.hl7.org/CodeSystem/restful-security-service#Certificates
    * description = "Requests to this instance are secured using mTLS with client certificates issued by provider.nhs.uk"

//Patient
* insert Resource(#Patient, https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient)
* insert Interaction(#search-type)
* insert SearchParam(identifier, #token)
