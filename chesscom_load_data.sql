-- 1. Підготовлюю таблиці в SQL для подальшого внесення даних з .csv файлів:

CREATE TABLE chesscom_all_leaders (
    type VARCHAR(50) NOT NULL,       -- Тип гри: blitz, bullet, rapid
    rank INT NOT NULL,               -- Місце гравця в рейтингу
    username VARCHAR(100) NOT NULL,  -- Унікальний нік гравця
    score INT,                       -- Рейтинг очки
    country VARCHAR(255),            -- Посилання на країну
    PRIMARY KEY (type, rank),
    UNIQUE (username, type)          -- Додала унікальність для Foreign Key
);

CREATE TABLE top_players_detailed_info (
    username VARCHAR(100) PRIMARY KEY,  -- унікальний нік
    title VARCHAR(10),                  -- Титул: GM, IM, FM тощо
    country VARCHAR(255),
    status VARCHAR(50),                 -- Рremium/basic
    followers INT,
    is_streamer BOOLEAN DEFAULT FALSE,
    twitch_url VARCHAR(255),
    youtube_url VARCHAR(255),
    joined TIMESTAMP WITH TIME ZONE,    -- Дата приєднання
    last_online TIMESTAMP WITH TIME ZONE,
    chess_blitz_rating INT,
    chess_blitz_best_rating INT,
    chess_blitz_wins INT,
    chess_blitz_losses INT,
    chess_blitz_draws INT,
    chess_bullet_rating INT,
    chess_bullet_best_rating INT,
    chess_bullet_wins INT,
    chess_bullet_losses INT,
    chess_bullet_draws INT,
    chess_rapid_rating INT,
    chess_rapid_best_rating INT,
    chess_rapid_wins INT,
    chess_rapid_losses INT,
    chess_rapid_draws INT,
    chess_daily_rating INT,
    chess_daily_best_rating INT,
    chess_daily_wins INT,
    chess_daily_losses INT,
    chess_daily_draws INT,
    tactics_rating INT,
    tactics_best_rating INT,
    tactics_wins INT,
    tactics_losses INT,
    tactics_draws INT
);

CREATE TABLE top_players_games_2025_09_flat (
    username VARCHAR(100) NOT NULL,      -- Посилається на top_players_detailed_info
    url VARCHAR(255),                    -- Посилання на гру
    time_class VARCHAR(50),              -- Вlitz, bullet, rapid
    rules VARCHAR(50),                   -- Сhess rules: chess/chess960
    end_time BIGINT,                     -- Тimestamp у секундах
    rated BOOLEAN,
    white_result VARCHAR(50),
    black_result VARCHAR(50),
    eco VARCHAR(100),                    -- Opening URL (посилання на конкретне шахове дебютне відкриття)
    tcn VARCHAR(100),                    -- Ідентифікатор партії
    white_username VARCHAR(100),
    white_rating INT,
    white_uuid UUID,
    white_api_url VARCHAR(255),
    black_username VARCHAR(100),
    black_rating INT,
    black_uuid UUID,
    black_api_url VARCHAR(255),
    FOREIGN KEY (username) REFERENCES top_players_detailed_info(username),
    FOREIGN KEY (white_username) REFERENCES top_players_detailed_info(username),
    FOREIGN KEY (black_username) REFERENCES top_players_detailed_info(username),
    FOREIGN KEY (white_username, time_class) REFERENCES chesscom_all_leaders(username, type),
    FOREIGN KEY (black_username, time_class) REFERENCES chesscom_all_leaders(username, type)
);

-- 2. Завантажую дані з файлів .csv в створені таблиці через публічну директорію /tmp:

COPY chesscom_all_leaders(type, rank, username, score, country)
FROM '/tmp/chesscom_all_leaders.csv'
DELIMITER ','
CSV HEADER;

COPY top_players_detailed_info(
    username, title, country, status, followers, is_streamer, twitch_url, youtube_url,
    joined, last_online, chess_blitz_rating, chess_blitz_best_rating, chess_blitz_wins,
    chess_blitz_losses, chess_blitz_draws, chess_bullet_rating, chess_bullet_best_rating,
    chess_bullet_wins, chess_bullet_losses, chess_bullet_draws, chess_rapid_rating,
    chess_rapid_best_rating, chess_rapid_wins, chess_rapid_losses, chess_rapid_draws,
    chess_daily_rating, chess_daily_best_rating, chess_daily_wins, chess_daily_losses,
    chess_daily_draws, tactics_rating, tactics_best_rating, tactics_wins, tactics_losses,
    tactics_draws
)
FROM '/tmp/top_players_detailed_info.csv'
DELIMITER ','
CSV HEADER;

COPY top_players_games_2025_09_flat(
    username, url, time_class, rules, end_time, rated, white_result, black_result, eco, tcn,
    white_username, white_rating, white_uuid, white_api_url,
    black_username, black_rating, black_uuid, black_api_url
)
FROM '/tmp/top_players_games_2025_09_flat.csv'
DELIMITER ','
CSV HEADER;

-- 3. Змінюю типи даних, де необхідно:

ALTER TABLE top_players_detailed_info
ALTER COLUMN chess_blitz_rating TYPE FLOAT,
ALTER COLUMN chess_blitz_best_rating TYPE FLOAT,
ALTER COLUMN chess_rapid_rating TYPE FLOAT,
ALTER COLUMN chess_rapid_best_rating TYPE FLOAT,
ALTER COLUMN chess_daily_rating TYPE FLOAT,
ALTER COLUMN chess_daily_best_rating TYPE FLOAT;

ALTER TABLE top_players_detailed_info
ALTER COLUMN chess_blitz_rating TYPE FLOAT,
ALTER COLUMN chess_blitz_best_rating TYPE FLOAT,
ALTER COLUMN chess_bullet_rating TYPE FLOAT,
ALTER COLUMN chess_bullet_best_rating TYPE FLOAT,
ALTER COLUMN chess_rapid_rating TYPE FLOAT,
ALTER COLUMN chess_rapid_best_rating TYPE FLOAT,
ALTER COLUMN tactics_rating TYPE FLOAT,
ALTER COLUMN tactics_best_rating TYPE FLOAT;

ALTER TABLE top_players_games_2025_09_flat
ALTER COLUMN tcn TYPE TEXT;

ALTER TABLE top_players_games_2025_09_flat
ALTER COLUMN eco TYPE TEXT;

ALTER TABLE top_players_games_2025_09_flat DISABLE TRIGGER ALL;
   
