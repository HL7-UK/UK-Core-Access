Profile: UKCoreAccessPatientIndexPatient
//Parent: Patient
Parent: UKCore-Patient

Id: UKCoreAccessPatientIndexPatient

Description: "UK Core Access Patient resource profile for patient index lookup, supporting basic data for identification"
* ^status = #active

* identifier 1..* MS
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* name 1..* MS
* gender 1..1 MS
* birthDate 0..1 MS
* address 0..1 MS
