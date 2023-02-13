Instance: UKCoreAccessProvider
InstanceOf: CapabilityStatement
Usage: #definition
Title: "UKCore Access Provider"
* status = #active
* date = 2023-02-01
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "Provider supports read-only access for direct care and subject of care access."
* rest.mode = #server

//Patient
* insert ResourceWithExpectation(#Patient, https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(family, #string, #SHOULD)
* insert SearchParamWithExpectation(gender, #token, #SHOULD)
* insert SearchParamWithExpectation(given, #string, #SHOULD)
* insert SearchParamWithExpectation(identifier, #token, #SHALL)
* insert SearchParamWithExpectation(name, #string, #SHOULD)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(birthdate)
* insert RequiringSearchParam(family)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(birthdate)
* insert RequiringSearchParam(name)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(gender)
* insert RequiringSearchParam(family)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(gender)
* insert RequiringSearchParam(name)