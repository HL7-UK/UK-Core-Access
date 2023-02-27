### Safety
Providers and Consumers SHOULD adopt the recommendations in the FHIR [Implementer's Safety Check List](https://www.hl7.org/fhir/safety.html).

Providers and Consumers SHOULD adopt [NHS Clinical risk management standards](https://digital.nhs.uk/services/clinical-safety/clinical-risk-management-standards) where applicable to their use case.

Providers and Consumers  MAY consider the following potential hazards that have been identified during development of the
implementation guide:

#### Paging of search requests
Providers may choose to return search results in a series of [pages](https://hl7.org/fhir/R4/search.html#count).
If a Consumer fails to request additional pages of search results it is possible that clinical decisions will be taken 
using incomplete information.
If a Consumer uses the `_count` parameter to request large pages of information it is possible that very many resources
are returned such that the capacity of the system is overwhelmed.

#### Operation outcomes within search requests
Providers may choose to return informational and warning messages from search results within an [OperationOutcome resource
in the response](https://hl7.org/fhir/R4/http.html#search).
If a Consumer fails to process the OperationOutcome it is possible that clinical decisions will be taken
without considering the relevant information and/or warnings.

#### Patient search results are counterintuitive
Patient search results may include counterintuitive results.
For example, a Provider may return more than one matched patient, even where a highly specific search is used (_e.g._ NHS Number).
If the Consumer fails to select the correct patient from within the returned Patient resources it is possible that 
clinical decisions will be taken using incorrect information.

#### Patient search results are incomplete
Patient search results may be incomplete.
For example, a Provider may hold information on a matching patient, but not include the information in the search results due to security
constraints or information sharing rules.
If the Consumer assumes that the Provider holds no information related to the patient it is possible that clinical 
decisions will be taken using incorrect information.

### Security
Providers and Consumers SHOULD adopt the recommendations in [FHIR Security and Privacy](https://www.hl7.org/fhir/secpriv-module.html) guide.

Providers and Consumers SHOULD adopt [NHS Data security and information governance](https://digital.nhs.uk/data-and-information/looking-after-information/data-security-and-information-governance) guidance where applicable to their use case.

The Provider SHOULD add CORS headers so that a Consumer can make requests from within a browser.

The Provider MAY allow unsecured requests to the `capabilities` interaction so that a Consumer can discover and use the appropriate security service.

The Provider SHOULD ensure that the identity of the Consumer is known and that there is legal basis for sharing information with them.