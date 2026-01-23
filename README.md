# Violence Reduction Chicago

**Repo Manager:** Akeem Shepherd

**Last updated:** January 6, 2026



## Overview
> 
> This repo's code intends to explore trends on crimes, violence, violence reduction, homicides, and shootings reported by the Chicago Police Department. These trends represent homicide data from 1991 to current and Non-fatal shooting data from 2010 to current.

## Data 
> The following data files are needed to run scripts in this repo:
> 
> **Raw dataset**
> 
> - [Violence_Reduction_-_Victims_of_Homicides_and_Non-Fatal_Shootings](https://raw.githubusercontent.com/AkeemShepherd/Public_Health-Chicago/refs/heads/dev/data/Violence_Reduction_-_Victims_of_Homicides_and_Non-Fatal_Shootings_20260106.csv)

> **Spatial dataset**
> 
> - [vr_data.csv](https://raw.githubusercontent.com/AkeemShepherd/Public_Health-Chicago/refs/heads/dev/data/vr_data.csv)


## How to Use this Repo
> Thus far, the frist goal of this repo is to create a spatial visualization of shootings in Chicago for year 2021.
> 
>> To sccessfully do so, first run the **r.script ["main"](https://github.com/AkeemShepherd/Public_Health-Chicago/blob/dev/src/main.R)**, that contains all the necessary packages for cleaning and visualizing those trends. 
Then run the **r.script ["import"](https://github.com/AkeemShepherd/Public_Health-Chicago/blob/dev/src/import.R)** to import the raw dataset. Use the **r.script ["clean"](https://github.com/AkeemShepherd/Public_Health-Chicago/blob/dev/src/clean.R)** to reconstruct the raw dataset into the **[vr_data.csv](https://raw.githubusercontent.com/AkeemShepherd/Public_Health-Chicago/refs/heads/dev/data/vr_data.csv)** file, which 
is used to run the **r.script ["figure"](https://github.com/AkeemShepherd/Public_Health-Chicago/blob/dev/src/figures.R)** to produce the spatial visualization. 


## Table of Contents

Follow the format used below.

README.md: markdown file to describe your project/repo

script: primary folder where your code and analyses should be saved. Includes the following R files:

cleaning.R: For data cleaning purposes

functions.R: For any functions

figure: plotting and plotting related data formatting here
