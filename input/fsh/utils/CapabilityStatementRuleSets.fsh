RuleSet: Resource(type, profile)
* rest.resource[+]
  * type = {type}
  * profile = Canonical({profile})

RuleSet: ResourceWithExpectation(type, profile, expectation)
* rest.resource[+]
  * type = {type}
  * profile = Canonical({profile})
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = {expectation}

RuleSet: Interaction(code)
* rest.resource[=]
  * interaction[+]
    * code = {code}

RuleSet: InteractionWithExpectation(code, expectation)
* rest.resource[=]
  * interaction[+]
    * code = {code}
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = {expectation}

RuleSet: WithInteractionDocumentation(documentation)
* rest.resource[=]
  * interaction[=]
    * documentation = "{documentation}"

RuleSet: SearchParam(name, type)
* rest.resource[=]
  * searchParam[+]
    * name = "{name}"
    * type = {type}

RuleSet: SearchParamWithExpectation(name, type, expectation)
* rest.resource[=]
  * searchParam[+]
    * name = "{name}"
    * type = {type}
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = {expectation}

RuleSet: WithSearchParamDocumentation(documentation)
* rest.resource[=]
  * searchParam[=]
    * documentation = "{documentation}"
