Instance: RecommendationHAPDiagnosis-A
InstanceOf: Recommendation
Usage: #example
Title: "HAP Diagnose - Empfehlung A"
Description: "Wie wird eine HAP klinisch diagnostiziert und welche Differenzialdiagnosen sind zu beachten?"

* insert narrative([[HAP Diagnose - Empfehlung A]])

* identifier[+]
  * system = "http://fhir.awmf.org/examples"
  * value = "RecommendationHAPDiagnosis-A"
  * use = #official

* version = "3.0"
* status = #final
* author[+] = Reference(JessicaRademacherDGPFor020-013)
* date = "2024-12-05"
* title = "HAP Diagnose"

* category[synthesisType] = cs-recommendation-synthesis-type#expert-consensus

* relatesTo[partOf][+]
  * targetCanonical = Canonical(NosokomialePneumonie|3.0)
* relatesTo[partOf][+]
  * targetCanonical = Canonical(RecommendationHAPDiagnosis|3.0)

* section[recommendationStatement]
  * section[language]
    * extension[language].valueCode = #de
    * insert narrative([[Therapierelevant ist bereits die Verdachtsdiagnose einer HAP, diese soll gestellt werden bei
neuem, persistierendem oder progredientem Infiltrat in der Thorax-Röntgenaufnahme in
Kombination mit 2 von 3 weiteren Kriterien:
- Leukozyten &gt; 10 000 oder &lt; 4000 /μl,
- Fieber &gt; 38,3 °C,
- purulentes Sekret.]])
