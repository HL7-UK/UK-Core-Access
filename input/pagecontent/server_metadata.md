### capabilities
The Provider SHALL support the [capabilities](https://hl7.org/fhir/R4/http.html#capabilities) interaction so that
a Consumer can retrieve a [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html) resource of type
`instance` that specifies which resource types and interactions are supported by the FHIR endpoint:
```
GET [base]/metadata
```
The CapabilityStatement SHALL be conformant with this implementation guide and SHOULD state that the FHIR endpoint instantiates the UKCore Access CapabilityStatement.
The Provider MAY provide further capabilities at this FHIR endpoint, in addition to those required by the UKCore Access CapabilityStatement.


For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/metadata`
the Provider would respond with a CapabilityStatement resource. [[Example](CapabilityStatement-UKCoreAccessProvider-instance.html)]

A Consumer MAY use the CapabilityStatement during implementation to discover the capabilities of a FHIR endpoint provided by a UKCore Access Provider.

A Consumer MAY retrieve the CapabilityStatement at runtime to discover the current capabilities of a FHIR endpoint and 
to adapts to changes in capability. For example:
- a Provider may be experiencing failures within their system so that some capabilities are temporarily unavailable 
- a Provider may start to provide new capabilities
