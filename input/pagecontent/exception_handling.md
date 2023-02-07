### search
Providers MAY communicate errors, warnings and additional information by including an
[OperationOutcome](https://hl7.org/fhir/R4/operationoutcome.html) resource within the Bundle returned from a 
[search](https://hl7.org/fhir/R4/http.html#search) interaction. 
Consumers SHALL check for the existence of OperationOutcomes and act on them.

For example, when a Provider sends the request:
```
GET https://fhir.provider.nhs.uk/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888
```
the Provider MAY respond with a Bundle including an OperationOutcome in addition to matches. [[Example](./Bundle-Example-UKCoreAccess-Bundle-searchreturnswarning.html)]

