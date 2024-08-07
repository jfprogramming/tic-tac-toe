import sqlite3

def create_database():
    try:
        # Connect to or create the database file (change the filename as needed)
        conn = sqlite3.connect("tictactoe.db")
        cursor = conn.cursor()

        # Create the PlayerTable
        cursor.execute("""
            CREATE TABLE PlayerTable (
                playerId INTEGER PRIMARY KEY,
                playerName TEXT,
                playerColor TEXT,
                playerHighScore TEXT,
                dateTime DATETIME DEFAULT CURRENT_TIMESTAMP
            )
        """)

        # Create the HighScoreTable with a foreign key reference
        cursor.execute("""
            CREATE TABLE HighScoreTable (
                highScoreId INTEGER PRIMARY KEY,
                playerId INTEGER,
                playerName TEXT,
                highScore INT,
                dateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (playerId) REFERENCES PlayerTable(playerId)
            )
        """)

        # Commit changes and close the connection
        conn.commit()
        conn.close()
        print("Database and table created successfully!")
    except sqlite3.Error as e:
        print(f"Error creating database: {e}")

if __name__ == "__main__":
    create_database()
