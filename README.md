# Public_Health-Chicago
Repo Template
Repo Manager: Kelley Sarussi (replace with your name)
Last updated: January 12, 2024

IMPORTANT: (remove this "Important" section from your readme)

Before creating a new repo, please review the [coding guidebook TBD](sharepoint location for coding guidebook). It contains helpful instructions needed to create and maintain reproducible code necessary for collaboration. This repo is a template that is used to create new repos in the CORNERS GitHub organization. It includes:

a README template in raw Markdown,
.gitignore file that should prevent data files and other unnecessary files from being pushed to a repo
configuration files for virtual environments and GitHub Actions workflows
Overview
Give a brief overview and the purpose of this repo. Please give as much background detail here as possible.

Data
The following data files are needed to run scripts in this repo:

name of dataset1
name of dataset2
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
