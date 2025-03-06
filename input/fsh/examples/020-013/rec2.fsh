Instance: RecommendationHAPDiagnosis
InstanceOf: Recommendation
Usage: #example
Title: "HAP Diagnose"
Description: "Wie wird eine HAP klinisch diagnostiziert und welche Differenzialdiagnosen sind zu beachten?"

* insert narrative([[HAP Diagnose]])

* version = "3.0"
* status = #final
* author[+] = Reference(JessicaRademacherDGPFor020-013)
* date = "2024-12-05"
* title = "HAP Diagnose"

* relatesTo[partOf]
  * extension[targetCanonical].valueCanonical = Canonical(NosokomialePneumonie|3.0)


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

* section[text]
  * code = $cs-ebm-ig-section-code#text "Text"
  * section[language]
    * extension[language].valueCode = #de
    * insert narrative([[Die klinische Diagnose einer HAP ist schwierig. Es gibt keine allgemein akzeptierten Kriterien auf der Basis
randomisierter Studien, sondern lediglich prospektive Kohortenanalysen. Die Inzidenz der VAP variiert stark in
Abhängigkeit von den eingesetzten Diagnosekriterien (62). Therapierelevant ist die klinisch zu stellende
Verdachtsdiagnose einer HAP.
Die in der 1. Empfehlung genannten Kriterien von Johanson et al. (Infiltrat in Kombination mit 2-3 weiteren
Kriterien) werden in den meisten Leitlinien verwendet und sind in einer prospektiven Kohortenanalyse an 25
verstorbenen beatmeten Patienten validiert worden (36,63). In dieser lag die histologisch überprüfte Sensitivität
bei 69 % und die Spezifität bei 75 % (64). Fagon et al. konnte 1993 in einer Studie an 84 beatmeten Patienten
zeigen, dass die klinische Diagnose in 62 % eine VAP korrekt vorhersagt, und bei 84 % korrekt keine VAP
diagnostiziert wurde (65). In allen Studien liegen Sensitivität und Spezifität dieser Kriterien bei ca. 70 %, sodass
etwa 30 % der HAP-Patienten nicht erkannt werden und bei ca. 30% eine andere Diagnose als eine HAP
vorliegt. Kritisch zu bedenken ist zudem, dass die Beurteilung des Röntgenbildes einer Interobservervariabilität
unterliegt (66) und im klinischen Alltag etwa 1/3 der Patienten, die als V. a. HAP diagnostiziert werden, die oben
beschriebenen radiologischen Veränderungen (Infiltrate) objektiv nicht erfüllen (67,68). Der Einsatz
mikrobiologischer Kriterien zur Diagnose einer HAP verbessert die Sensitivität und Spezifität (64).
Andere Autoren konnten zeigen, dass postoperative Patienten mit der klinischen Diagnose HAP (beruhend auf
diesen Kriterien) eine höhere Letalität hatten als Patienten ohne Verdacht auf HAP (8 von 46, 17 % vs. 16 von
306, 5 %, p = 0,046) (69).
Insbesondere bei schwerer HAP sollten die klinischen Kriterien der Sepsis beachtet werden (70). Zeichen der
Sepsis oder des septischen Schocks sind jedoch nicht spezifisch für eine HAP. Insgesamt ist die klinische
Diagnose der HAP eine Arbeitsdiagnose, die für die zeitnahe Einleitung einer kalkulierten antimikrobiellen
Therapie relevant ist und der regelmäßigen Überprüfung bedarf. In diesem Zusammenhang sind die
aufgeführten Differenzialdiagnosen zu bedenken
]])


/*
#Expertenkonsens

Therapierelevant ist bereits die Verdachtsdiagnose einer HAP, diese soll gestellt werden bei
neuem, persistierendem oder progredientem Infiltrat in der Thorax-Röntgenaufnahme in
Kombination mit 2 von 3 weiteren Kriterien:
- Leukozyten > 10 000 oder < 4000 /μl,
- Fieber > 38,3 °C,
- purulentes Sekret.

#Starke-Empfehlung

Differenzialdiagnostisch sollten u.a. Atelektasen (Sekretverlegung),
Herzinsuffizienz/Überwässerung, Lungenarterienembolien, alveoläre Hämorrhagie, interstitielle
Lungenerkrankungen wie eine organisierende Pneumonie (OP) und das ARDS abgegrenzt
werden.

#Schwache-Empfehlung

#Starker-Konsens
*/