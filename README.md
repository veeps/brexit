# Brexit Polarization Analysis

## Overview
Research project for Jamie Blackburn on the impact of political elites on Brexit polarization

## Data
Pulled tweets from the following users between January 1, 2016 to March 1, 2020:
- BorisJohnson
- Nigel_Farage
- Keir_Starmer
- jeremycorbyn
- joswinson
- NicolaSturgeon
- DUPleader
- Conservatives
- brexitparty_uk
- UKLabour
- LibDems
- theSNP
- duponline

Data collection was done in Python [here](./code/01_data_collection_twitter.ipynb)


Pulled 10,000 reddit posts after January 1, 2016 for the following subreddits:
- brexit
- ukpolitics

Data collection was done in Python [here](./code/02_data_collection_reddit.ipynb)

## Data Cleaning
Used regex to process tweets and reddit self text. Data for each of the accounts can be found [here](./data)