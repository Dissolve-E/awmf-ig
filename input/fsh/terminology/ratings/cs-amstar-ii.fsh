CodeSystem: AMSTAR2ConfidenceRatings
Id: cs-amstar2-confidence-ratings
Title: "AMSTAR 2 Overall Confidence Ratings"
Description: "A CodeSystem representing the overall confidence ratings from the AMSTAR 2 critical appraisal tool."
* ^status = #active
* ^content = #complete

* #high "High" "Zero or one non-critical weakness: The systematic review provides an accurate and comprehensive summary of the results of the available studies that address the question of interest."
* #moderate "Moderate" "More than one non-critical weakness: The systematic review has more than one weakness but no critical flaws. It may provide an accurate summary of the results of the available studies that were included in the review."
* #low "Low" "One critical flaw with or without non-critical weaknesses: The review has a critical flaw and may not provide an accurate and comprehensive summary of the available studies that address the question of interest."
* #critically_low "Critically Low" "More than one critical flaw with or without non-critical weaknesses: The review has more than one critical flaw and should not be relied on to provide an accurate and comprehensive summary of the available studies."

ValueSet: AMSTAR2ConfidenceRatingsVS
Id: vs-amstar2-confidence-ratings
Title: "AMSTAR 2 Confidence Ratings Value Set"
Description: "A ValueSet encompassing all overall confidence ratings from the AMSTAR 2 critical appraisal tool."
* ^status = #active
* include codes from system cs-amstar2-confidence-ratings