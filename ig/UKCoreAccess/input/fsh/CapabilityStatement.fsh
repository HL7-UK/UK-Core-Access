Instance: UKCoreAccess
InstanceOf: CapabilityStatement
Usage: #definition
Title: "UKCore Access"
* status = #active
* date = 2021-01-01
* kind = #capability
* fhirVersion = #4.0.1
* format = #json
* description = "Server supports read-only access for direct care and subject of care access."
* rest.mode = #server

//Patient
* insert Resource(#Patient, https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient, #SHALL)
* insert Interaction(#search-type, #SHALL)
* insert SearchParam(identifier, #token, #SHALL)
* insert WithSearchParamDocumentation(Use system `https://fhir.nhs.uk/Id/nhs-number` for NHS numbers. TODO: Scotland; CHI: NI: ?)