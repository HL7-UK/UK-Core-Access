Profile: UKCoreAccessPatientIndexPatient
//Parent: Patient
Parent: UKCore-Patient

Id: UKCoreAccessPatientIndexPatient

Description: "UK Core Access Patient resource profile for patient index lookup, supporting basic data for identification"
* ^status = #active

// https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient
/*
The Patient should be UKCore-Patient

Parent: https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient
error Structure Definition https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient is missing a snapshot. Snapshot is required for import.
  File: /Users/Dunmail/Documents/Development/UK-Core-Access/input/fsh/profiles/PatientIndexPatient.fsh
  Line: 1 - 2
*/
* identifier 1..* MS
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* name 1..* MS
* gender 1..1 MS
* birthDate 0..1 MS
* address 0..1 MS

