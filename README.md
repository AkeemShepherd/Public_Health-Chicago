# Violence Reduction Chicago

Repo Manager: Akeem Shepherd

Last updated: January 6, 2026


Overview

This repo's code intends to explore trends on crimes, violence, violence reduction, homicides, and shootings reported by the Chicago Police Department. These trends represent homicide data from 1991 to current and Non-fatal shooting data from 2010 to current.

Data
The following data files are needed to run scripts in this repo:

Violence_Reduction_-_Victims_of_Homicides_and_Non-Fatal_Shootings_20260106.csv



How to Use this Repo
Explain as if someone is seeing this repo and running your code for the first time. For example, note here if you just need to run main.R to run all other scripts. Give instructions if not all files need to be run for certain analyses.

Table of Contents
Follow the format used below.

README.md: markdown file to describe your project/repo
.gitignore: files not tracked by git
Version Control:

requirements.txt: file to add packages used in your python files (remove for R projects)
renv: scripts and configs required for renv (remove for Python projects)
Primary files:

src: primary folder where your code and analyses should be saved. Includes the following R files (remove for Python projects):
main.R: Main file where code should be run from
cleaning.R: For data cleaning purposes
functions.R: For any functions
figs: folder for outputs
Related Repositories
name of related repo1
This repo does...
name of related repo2
This repo does...
Other Built-In Files (Delete this section of text from your readme)
R-project files:

.Rprofile: runs R commands on load of project
r-project.Rproj: config file/shortcut to load the R project for this repo
.Rbuildignore: list of files not tracked in an R package
GitHub Action workflows:

.github: scripts and configs for GitHub
comment_ratio.py
readme_needs_update.sh
lint_python_files.sh
lint_r_files.R
workflows
comment-ratio.yaml: calculate comment to code ratio
update_readme.yaml: If files have been added or removed, need to update README
lint-python.yaml: lint Python files
lint-r.yaml: lint R files
