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
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(identifier, #token, #SHALL)

//AllergyIntolerance
* insert ResourceWithExpectation(#AllergyIntolerance, https://fhir.hl7.org.uk/StructureDefinition/UKCore-AllergyIntolerance, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(patient, #token, #SHALL)
* insert SearchParamWithExpectation(clinical-status, #token, #SHOULD)
* insert SearchParamWithExpectation(date, #date, #SHOULD)
* insert SearchParamWithExpectation(last-date, #date, #SHOULD)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(clinical-status)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(date)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(last-date)

//Immunization
* insert ResourceWithExpectation(#Immunization, https://fhir.hl7.org.uk/StructureDefinition/UKCore-Immunization, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(patient, #token, #SHALL)
* insert SearchParamWithExpectation(date, #date, #SHOULD)
* insert SearchParamWithExpectation(status, #token, #SHALL)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(status)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(date)

//MedicationAdministration
* insert ResourceWithExpectation(#MedicationAdministration, https://fhir.hl7.org.uk/StructureDefinition/UKCore-MedicationAdministration, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(patient, #token, #SHALL)
* insert SearchParamWithExpectation(effective-time, #date, #SHALL)
* insert SearchParamWithExpectation(status, #token, #SHALL)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(status)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(effective-time)

//MedicationDispense
* insert ResourceWithExpectation(#MedicationDispense, https://fhir.hl7.org.uk/StructureDefinition/UKCore-MedicationDispense, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(patient, #token, #SHALL)
* insert SearchParamWithExpectation(whenprepared, #date, #SHOULD)
* insert SearchParamWithExpectation(status, #token, #SHALL)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(status)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(whenprepared)

//MedicationRequest
* insert ResourceWithExpectation(#MedicationRequest, https://fhir.hl7.org.uk/StructureDefinition/UKCore-MedicationRequest, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(patient, #token, #SHALL)
* insert SearchParamWithExpectation(authoredon, #date, #SHOULD)
* insert SearchParamWithExpectation(status, #token, #SHALL)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(status)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(authoredon)

//MedicationStatement
* insert ResourceWithExpectation(#MedicationStatement, https://fhir.hl7.org.uk/StructureDefinition/UKCore-MedicationStatement, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHOULD)
* insert SearchParamWithExpectation(patient, #token, #SHALL)
* insert SearchParamWithExpectation(effective, #date, #SHOULD)
* insert SearchParamWithExpectation(status, #token, #SHALL)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(status)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(patient)
* insert RequiringSearchParam(effective)