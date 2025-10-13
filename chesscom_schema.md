# **Chess.com Data Schema**

This document describes the structure of the main data tables used in this project.  
The datasets contain detailed information about top Chess.com players, their performance across different game types, and leaderboard rankings.  
These tables are used for analysis of player behavior, rating trends, and global chess activity.

## **Table: `top_players_detailed_info`**

| Column | Description |
|--------|-------------|
| **username** | Player’s username on Chess.com |
| **title** | Player’s title (GM, IM, FM, etc.) |
| **country** | URL to the player’s country |
| **status** | Account type (basic, premium) |
| **followers** | Number of followers |
| **is_streamer** | TRUE/FALSE, indicates if the player is a streamer |
| **twitch_url** | Twitch profile link (if available) |
| **youtube_url** | YouTube channel link (if available) |
| **joined** | Date the player joined Chess.com |
| **last_online** | Date and time of last activity |
| **chess_blitz_rating** | Current Blitz rating |
| **chess_blitz_best_rating** | Highest Blitz rating achieved |
| **chess_blitz_wins** | Number of Blitz wins |
| **chess_blitz_losses** | Number of Blitz losses |
| **chess_blitz_draws** | Number of Blitz draws |
| **chess_bullet_rating** | Current Bullet rating |
| **chess_bullet_best_rating** | Highest Bullet rating achieved |
| **chess_bullet_wins** | Number of Bullet wins |
| **chess_bullet_losses** | Number of Bullet losses |
| **chess_bullet_draws** | Number of Bullet draws |
| **chess_rapid_rating** | Current Rapid rating |
| **chess_rapid_best_rating** | Highest Rapid rating achieved |
| **chess_rapid_wins** | Number of Rapid wins |
| **chess_rapid_losses** | Number of Rapid losses |
| **chess_rapid_draws** | Number of Rapid draws |
| **chess_daily_rating** | Current Daily rating |
| **chess_daily_best_rating** | Highest Daily rating achieved |
| **chess_daily_wins** | Number of Daily wins |
| **chess_daily_losses** | Number of Daily losses |
| **chess_daily_draws** | Number of Daily draws |
| **tactics_rating** | Current Tactics rating |
| **tactics_best_rating** | Highest Tactics rating achieved |
| **tactics_wins** | Number of Tactics wins |
| **tactics_losses** | Number of Tactics losses |
| **tactics_draws** | Number of Tactics draws |

---

## **Table: `chesscom_all_leaders`**

| Column | Description |
|--------|-------------|
| **type** | Type of activity (e.g., `live_blitz`, `live_bullet`, etc.) |
| **rank** | Player’s position on the leaderboard |
| **username** | Player’s username |
| **score** | Player’s rating in that category |
| **country** | URL to the player’s country |
