Profile: UKCoreAccessPatientIndexPatient
Parent: UKCore-Patient
Id: UKCoreAccessPatientIndexPatient
Description: "UK Core Access Patient resource profile for patient index lookup, supporting basic data for identification"
* ^status = #active
* name 1..* MS
* gender 1..1 MS
* birthDate 0..1 MS
* address 0..1 MS

