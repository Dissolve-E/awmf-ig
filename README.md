# FHIR Implementation Guide for Storing Clinical Practice Guidelines in the AWMF Registry


## Project Overview

This repository provides the FHIR Implementation Guide developed as part of the **Dissolve-E** project: 

> **Digitalisierung des AWMF-Leitlinienregisters für ein offenes, leitlinienbasiertes, vertrauenswürdiges Evidenz-Ökosystem**

The Dissolve-E project aims to digitize the analog clinical practice guideline (CPG) registry maintained by the AWMF (Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften) to create a standardized, digital evidence ecosystem. This effort will:

- Simplify guideline creation and update processes.
- Enable tailored formats and decision aids for various user needs.
- Facilitate real-time, data-based comparisons of guideline recommendations and treatment options.
- Improve the alignment between guidelines and the latest scientific research.

## Objectives

The specific goals of this project include:

1. Developing a digital infrastructure aligned with international technical standards for data exchange.
2. Creating a user-friendly onboarding process for digitizing clinical practice guidelines.
3. Converting existing guideline content into the new digital registry format.
4. Evaluating the new digital registry for usability, guideline availability, and interoperability.

By the project’s conclusion, we aim to provide an open-access, standardized digital infrastructure that facilitates knowledge exchange for healthcare, research, and education.

## Consortium Partners

The project is a collaboration between:

- **Albert-Ludwigs-Universität Freiburg**
- **aQua - Institut für angewandte Qualitätsförderung und Forschung im Gesundheitswesen GmbH**
- **Charité – Universitätsmedizin Berlin**
- **Deutsche Gesellschaft für Wundheilung und Wundbehandlung e. V.**
- **Howto Health GmbH**
- **Universitätsmedizin Greifswald**

## Usage 

You may want to use [fsh-sushi](https://www.npmjs.com/package/fsh-sushi) to compile the FHIR Shorthand (fsh) specifications found in this repository to FHIR JSON files. 
Before doing so, please run _download-ebm-ig.sh_ at the repository's root first, in order to retrieve relevant reference specifications from the current build of the [EBM IG](https://hl7.org/fhir/uv/ebm/2025May/).


## Contributing

We welcome contributions to enhance the Implementation Guide. Please follow the steps below:

1. Add a issue to the repository describing the proposed change.

## License

The contents of this repository is licensed under the Creative Commonse Attribution 4.0 International License (CA BY 4.0) 

## Acknowledgments

This work is supported through a grant from the Innovation Fund at the Federal Joint Committee (G-BA). Grant number: 01VSF23021
