Instance: UKCoreAccessClinicalDataProvider
InstanceOf: CapabilityStatement
Usage: #definition
Title: "UKCore Access Clinical Data Provider"
* status = #active
* date = 2023-02-01
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "Provider supports read-only access to clinical data for the purposes of direct care and subject of care access."
* rest.mode = #server

//Patient
* insert ResourceWithExpectation(#Patient, https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(identifier, #token, #SHALL)