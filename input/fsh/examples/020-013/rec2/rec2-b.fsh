Instance: RecommendationHAPDiagnosis-B
InstanceOf: Recommendation
Usage: #example
Title: "HAP Diagnose - Empfehlung B"
Description: "Wie wird eine HAP klinisch diagnostiziert und welche Differenzialdiagnosen sind zu beachten?"

* insert narrative([[HAP Diagnose - Empfehlung B]])
* version = "3.0"
* status = #final
* author[+] = Reference(JessicaRademacherDGPFor020-013)
* date = "2024-12-05"
* title = "HAP Diagnose"

* category[synthesisType] = cs-recommendation-synthesis-type#expert-consensus

// Guideline
* relatesTo[partOf][+]
  * targetCanonical = Canonical(NosokomialePneumonie|3.0)

  // Recommendation
* relatesTo[partOf][+]
  * targetCanonical = Canonical(RecommendationHAPDiagnosis|3.0)

* section[recommendationSpecification]
  * section[recommendationStatement]
    * section[language]
      * extension[language].valueCode = #de
      * insert narrative([[Differenzialdiagnostisch sollten u.a. Atelektasen (Sekretverlegung),
Herzinsuffizienz/Überwässerung, Lungenarterienembolien, alveoläre Hämorrhagie, interstitielle
Lungenerkrankungen wie eine organisierende Pneumonie (OP) und das ARDS abgegrenzt
werden.]])



/*
#Expertenkonsens

Differenzialdiagnostisch sollten u.a. Atelektasen (Sekretverlegung),
Herzinsuffizienz/Überwässerung, Lungenarterienembolien, alveoläre Hämorrhagie, interstitielle
Lungenerkrankungen wie eine organisierende Pneumonie (OP) und das ARDS abgegrenzt
werden.

#Schwache-Empfehlung

#Starker-Konsens
*/