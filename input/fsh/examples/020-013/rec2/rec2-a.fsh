Instance: RecommendationHAPDiagnosis-A
InstanceOf: Recommendation
Usage: #example
Title: "HAP Diagnose - Empfehlung A"
Description: "Wie wird eine HAP klinisch diagnostiziert und welche Differenzialdiagnosen sind zu beachten?"

* insert narrative([[HAP Diagnose - Empfehlung A]])

* version = "3.0"
* status = #final
* author[+] = Reference(JessicaRademacherDGPFor020-013)
* date = "2024-12-05"
* title = "HAP Diagnose"

* relatesTo[partOf][+]
  * extension[targetCanonical].valueCanonical = Canonical(NosokomialePneumonie|3.0)
* relatesTo[partOf][+]
  * extension[targetCanonical].valueCanonical = Canonical(RecommendationHAPDiagnosis|3.0)

* section[recommendationSpecification]
  * section[recommendationStatement]
    * section[language]
      * extension[language].valueCode = #de
      * insert narrative([[Therapierelevant ist bereits die Verdachtsdiagnose einer HAP, diese soll gestellt werden bei
neuem, persistierendem oder progredientem Infiltrat in der Thorax-Röntgenaufnahme in
Kombination mit 2 von 3 weiteren Kriterien:
- Leukozyten &gt; 10 000 oder &lt; 4000 /μl,
- Fieber &gt; 38,3 °C,
- purulentes Sekret.]])

/*
#Expertenkonsens

Therapierelevant ist bereits die Verdachtsdiagnose einer HAP, diese soll gestellt werden bei
neuem, persistierendem oder progredientem Infiltrat in der Thorax-Röntgenaufnahme in
Kombination mit 2 von 3 weiteren Kriterien:
- Leukozyten > 10 000 oder < 4000 /μl,
- Fieber > 38,3 °C,
- purulentes Sekret.

#Starke-Empfehlung

#Starker-Konsens
*/