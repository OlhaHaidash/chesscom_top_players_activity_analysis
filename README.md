# Chess.com Top Players Activity Analysis

## Description
This repository collects and analyzes data of top Chess.com players: profiles, ratings, activity, game statistics, and game archives.  
This repository contains Python scripts to fetch and process data from the Chess.com Public API, and Jupyter Notebooks for interactive analysis and visualization.

## Purpose
The goal of this project is to study player behavior, analyze game activity, and visualize trends among top Chess.com players.  
It can be used for research, analytics, or personal learning.

## Users and Usage
This repository is intended for:
- Data analysts and researchers who want to study Chess.com player behavior.
- Programmers who want to run or modify the scripts for collecting new data.
- Chess enthusiasts who want to explore player statistics and trends.

Users can:
- Run the scripts to fetch and update data.
- Analyze the CSV files locally using Python or Jupyter Notebooks.
- Modify the code for custom analysis.

**Note:** Users cannot modify the original data on this repository. CSV files are created locally when running the scripts.

## Data
No CSV files are included. Data is fetched directly from the Chess.com API.  
Running the scripts will create local CSV files for analysis.

## Repository Structure (planned)

- /notebooks         # Jupyter Notebooks with analysis (to be added)
- /scripts           # Python scripts for data collection (to be added)
- /data              # CSV files generated locally by scripts (to be created)
- README.md          # Project documentation

## Installation and Usage (planned)

### 1. Install dependencies

`bash`

`pip install -r requirements.txt`
  
### 2. Run the data collection scripts:

`python scripts/fetch_top_players.py`

### 3. Open the Jupyter Notebook to explore the data:

`jupyter notebook notebooks/top_players_analysis.ipynb`

## Notes

The collected data includes top players’ profiles, ratings, activity, and game archives.

Users can run the scripts to update data or perform their own analysis.

The scripts automatically handle API requests, caching, and saving CSV files locally.
