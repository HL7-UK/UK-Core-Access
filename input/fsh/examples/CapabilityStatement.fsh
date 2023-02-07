Instance: Example-UKCoreAccess-CapabilityStatement-instance
InstanceOf: CapabilityStatement
Usage: #example
Title: "UKCore Access"
* status = #active
* date = 2021-01-01
* kind = #instance
* fhirVersion = #4.0.1
* format = #json
* description = "An example of a Provider supporting UKCore Access requirements."
* instantiates = Canonical(UKCoreAccess)
* implementation
  * description = "FHIR Server providing access to information from Provider"
  * url = "https://fhir.provider.nhs.uk/"
* rest.mode = #server

//Patient
* insert Resource(#Patient, https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient)
* insert Interaction(#search-type)
* insert SearchParam(identifier, #token)
