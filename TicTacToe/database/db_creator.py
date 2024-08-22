import sqlite3
import bcrypt


def create_database():
    try:
        # Connect to or create the database file (change the filename as needed)
        conn = sqlite3.connect("tictactoe.db")
        cursor = conn.cursor()

        # Create the PlayerTable
        cursor.execute("""
            CREATE TABLE AdminTable (
                adminId INTEGER PRIMARY KEY,
                adminName TEXT,
                adminPassword TEXT
            )
        """)

        # Create the PlayerTable
        cursor.execute("""
            CREATE TABLE PlayerTable (
                playerId INTEGER PRIMARY KEY,
                playerName TEXT,
                playerColor TEXT,
                dateTime DATETIME DEFAULT CURRENT_TIMESTAMP
            )
        """)

        # Create the HighScoreTable with a foreign key reference
        cursor.execute("""
            CREATE TABLE HighScoreTable (
                highScoreId INTEGER PRIMARY KEY,
                playerId INTEGER,
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


def load_fake_data():
    try:
        # Connect to or create the database file (change the filename as needed)
        conn = sqlite3.connect("tictactoe.db")
        cursor = conn.cursor()

        # Insert 10 players with initial high score of 0
        for i in range(1, 11):
            cursor.execute("""
                INSERT INTO PlayerTable (playerName, playerColor)
                VALUES (?, ?)
            """, (f"Player{i}", "Blue"))

            cursor.execute("""
                INSERT INTO HighScoreTable (playerId, highScore)
                VALUES (?, ?)
            """, (i, 0))

        # Create admin account
        admin_password = "admin"  # Replace with a secure password
        hashed_admin_password = bcrypt.hashpw(admin_password.encode(), bcrypt.gensalt())
        cursor.execute("""
            INSERT INTO AdminTable (adminName, adminPassword)
            VALUES (?, ?)
        """, ("admin", hashed_admin_password.decode()))

        # Commit changes and close the connection
        conn.commit()
        conn.close()
        print("Test database created successfully!")
    except sqlite3.Error as e:
        print(f"Error creating database: {e}")

if __name__ == "__main__":
    create_database()
    load_fake_data()
