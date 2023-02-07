### Safety
Implementers should consider the recommendations in FHIR [Implementer's Safety Check List](https://www.hl7.org/fhir/safety.html).

Implementers should follow [NHS Clinical risk management standards](https://digital.nhs.uk/services/clinical-safety/clinical-risk-management-standards) where applicable to their use case.

Implementers may consider the following potential hazards that have been identified during development of the
implementation guide.

Paging of search requests. Failing to load additional pages of information. Using the _count parameter to override paging and then being unable to cope with the data volume!!!!!

Find a patient. The Consumer is responsible for selecting the correct patient from within the returned Patient resources.

Find a patient. The Provider returns more than one matched patient, even where a highly specific search is used (e.g. NHS Number).

Find a patient: The Provider holds information on the matched patient, but return no matches due to security
concerns or information sharing rules. 

### Security
Implementers should consider the recommendations in [FHIR Security and Privacy](https://www.hl7.org/fhir/secpriv-module.html) guide.

Implementers should follow [NHS Data security and information governance](https://digital.nhs.uk/data-and-information/looking-after-information/data-security-and-information-governance) where applicable to their use case.

Providers should ensure that the identity of the Consumer is known and that there is legal basis for sharing information with them.