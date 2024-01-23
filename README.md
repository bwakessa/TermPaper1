# Efficacy of Toronto's Automated Speed Enforcement System

## Overview of Paper

This paper analyzes 2023 data on Toronto's Automated Speed Enforcement (ASE) System from Open Data Toronto to determine its effectiveness in penalizing speeders and to uncover interesting patterns in its per-month performance. 

Statement on LLM usage: Aspects of the code, including table and graph creation and formatting, were written with the help of ChatGPT4. The bibliography and cross-references were also written with the help of ChatGPT4. The entire chat history is available in `inputs/llms/llm.txt` 

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned and transformed dataset.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document "paper.qmd" and reference bibliography file "references.bib", as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean and test the data.
