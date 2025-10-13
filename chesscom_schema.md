# **Chess.com Data Schema**

This document describes the structure of the main data tables used in this project.  
The datasets contain detailed information about top Chess.com players, their performance across different game types, and leaderboard rankings.  
These tables are used for analysis of player behavior, rating trends, and global chess activity.

# Table: `top_players_detailed_info`
This table stores detailed information about the top players on Chess.com.

| Column                  | Type      | Description |
|-------------------------|----------|-------------|
| username                | str      | Player’s username on Chess.com (primary key) |
| title                   | str      | Player’s title (GM, IM, FM, etc.) |
| country                 | str      | URL to the player’s country |
| status                  | str      | Account type (`basic`, `premium`) |
| followers               | int      | Number of followers |
| is_streamer             | bool     | TRUE/FALSE, indicates if the player is a streamer |
| twitch_url              | str      | Twitch profile link (if available) |
| youtube_url             | str      | YouTube channel link (if available) |
| joined                  | datetime | Date the player joined Chess.com |
| last_online             | datetime | Date and time of last activity |
| chess_blitz_rating      | float    | Current Blitz rating |
| chess_blitz_best_rating | float    | Highest Blitz rating achieved |
| chess_blitz_wins        | int      | Number of Blitz wins |
| chess_blitz_losses      | int      | Number of Blitz losses |
| chess_blitz_draws       | int      | Number of Blitz draws |
| chess_bullet_rating     | float    | Current Bullet rating |
| chess_bullet_best_rating| float    | Highest Bullet rating achieved |
| chess_bullet_wins       | int      | Number of Bullet wins |
| chess_bullet_losses     | int      | Number of Bullet losses |
| chess_bullet_draws      | int      | Number of Bullet draws |
| chess_rapid_rating      | float    | Current Rapid rating |
| chess_rapid_best_rating | float    | Highest Rapid rating achieved |
| chess_rapid_wins        | int      | Number of Rapid wins |
| chess_rapid_losses      | int      | Number of Rapid losses |
| chess_rapid_draws       | int      | Number of Rapid draws |
| chess_daily_rating      | float    | Current Daily rating |
| chess_daily_best_rating | float    | Highest Daily rating achieved |
| chess_daily_wins        | int      | Number of Daily wins |
| chess_daily_losses      | int      | Number of Daily losses |
| chess_daily_draws       | int      | Number of Daily draws |
| tactics_rating          | float    | Current Tactics rating |
| tactics_best_rating     | float    | Highest Tactics rating achieved |
| tactics_wins            | int      | Number of Tactics wins |
| tactics_losses          | int      | Number of Tactics losses |
| tactics_draws           | int      | Number of Tactics draws |

---

# Table: `chesscom_all_leaders`
This table stores leaderboard data for each activity type.

| Column   | Type | Description |
|----------|------|-------------|
| type     | str  | Type of activity (e.g., `live_blitz`, `live_bullet`, etc.) |
| rank     | int  | Player’s position on the leaderboard |
| username | str  | Player’s username (foreign key to `top_players_detailed_info.username`) |
| score    | float| Player’s rating in that category |
| country  | str  | URL to the player’s country |

---

# Table: `all_players_games_2025_09`
This table stores all games played by the top players in September 2025, retrieved from Chess.com API.

| Column        | Type           | Description |
|---------------|----------------|-------------|
| username      | str            | Player’s username (links to `top_players_detailed_info.username`) |
| url           | str            | URL of the game on Chess.com |
| white         | dict/json      | Player playing white: contains `username`, `rating`, `result`, `uuid`, `@id` (Chess.com API URL) |
| black         | dict/json      | Player playing black: same structure as `white` |
| time_class    | str            | Type of game: `blitz`, `bullet`, `rapid`, `daily` |
| rules         | str            | Game rules (usually `chess`) |
| end_time      | int / timestamp| Unix timestamp when game ended |
| rated         | bool           | Whether the game was rated (TRUE/FALSE) |
| white_result  | str            | Result for white: `win`, `loss`, `checkmated`, `resigned`, etc. |
| black_result  | str            | Result for black (same as above) |
| eco           | str            | Chess opening code |
| tcn           | str            | Unique game identifier from Chess.com |


## Notes on `white` and `black` columns
- These are stored as dictionaries / JSON objects.
- Useful for analyzing opponents, ratings, and game outcomes.
- Can be expanded to extract `rating`, `result`, `username` separately for analysis.

## Relationships with other tables

# Table Relationships

The following relationships exist between the tables:

| Primary Table                  | Primary Key | Foreign Table               | Foreign Key | Description |
|--------------------------------|------------|-----------------------------|-------------|-------------|
| top_players_detailed_info       | username   | chesscom_all_leaders        | username    | Links each leaderboard entry to the detailed player information. |
| top_players_detailed_info       | username   | all_players_games_2025_09   | username    | Links each game to the corresponding player. |
| chesscom_all_leaders            | type       | all_players_games_2025_09   | time_class  | Matches the game’s type to the leaderboard category. |
