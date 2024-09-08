# Tic-Tac-Toe

## About
A simple Tic Tac Toe game developed using Qt, C++/QML, CMake, and SQLite3.

## Project Structure

tic-tac-toe 
	├── Setup Directory 
	│ └── package and dependencies script 
	├── TicTacToe Game Directory 
	│ ├── Database (SQLite3 db) 
	│ ├── Documents (project docs) 
	│ ├── Images (graphics used by game) 
	│ ├── Controllers (C++ M-V-C) 
	│ ├── QML (view) 
	│ ├── Models (used by view) 
	│ ├── JavaScript (functions used by view) 
	│ └── CMakeLists.txt 
	├── README.md 
	├── .gitignore 
	└── .git


## Building and Running
- **Currently compiled and tested on Ubuntu 22.04**

### Packages and Dependencies
- At the root of the project, in the `setup` directory, there is a shell script used to set up the necessary packages for development on Ubuntu 22.04.
- Locate and run `install.sh`:
  - This script will also set up your `/data` directory for database and configuration files.

### Creating a New Database
- Run the Python script to create a new database and place it in the `/data/database` directory or run the copy shell script `copy_db.sh`.

### Running the Project
- Open the TicTacToe project in Qt Creator, set up the compiler, and build and run the project.

## Screen/Page Layout
- **Home Screen**
  - **1 Player Mode Selected**
    - Player Selection Page
      - Game Board Page
  - **2 Player Mode Selected**
    - Player Selection Page
      - Game Board Page
  - High Score Page
  - Admin Login Page
    - Admin Page
      - About Page
      - Date Time Settings Page
      - Player Manager Page

## Game Mode
- **Selecting 1 Player**
  - Select player
    - Play against the computer
    - Score is kept in the header
  - Once the game is complete, select the RESET button to clear the board.

- **Screen Navigation Buttons** (located in the footer of the application)
  - Home button
  - Back button

- **Note**: Please allow up to 1 second for Player 2 (computer) to place its mark 'O'.

## Admin Mode
- You can log in as an admin user from the home screen by clicking the login admin button.
  - Username: `admin`
  - Password: `admin`
- Admin mode gives you access to system setting features:
  - About Page (Partially complete)
  - Date Time Settings Page (Partially complete)
  - Player Manager Page (Partially complete)

## Features Incomplete
Below is a list of features not yet complete:
- **2 Player Mode**
  - Player input control
- **Date/Time Setting** (Admin Only)
- **Player Management** (Admin Only)
- **High Score** (Partial)
  - High score data is being pulled from the database and displayed in the GUI table.
  - TODO: Accumulate player scores and save to the database.
- **Other Game Modes**: Connect 4 / Battle Ships
- **IoT High Score Web App**
  - Implement the AWS web application for displaying high scores.
- **Mqtt API Creation and Integration**
  - Create API and coresponding API Document.
  - Mqtt Connectivity and payload managemnet. 
- **Popup** (Partial)
  - Popup mechanism to control player input and player turn sequence.
- **QSetting Files** (Partial)
- **Custom Poky Build** (Partial)
  - Consisting of Qt and application patches, touch screen driver.
  - Housed in a separate repo.

## TODO
- **TOD List**
  - Clean up win graphics.
  - Implement Player Management for Admin User.
  - Implement date/time settings for Admin User.
  - Implement 2 Player Game Mode logic.
  - Finish High Score.
  - Finish integrating QSettings File examle.
  - Improve threading with qmutex locking.
  - Improve class design by implementing common base class.
  - Improve Object Oriented design by implementing smart pointers.
  - Implement Export high score list feature. 
  - Create AWS web application to display high score table over the web.
  - Itergrate Mqtt proctocl and payload mangement.
  - Creaet custom Poky build for RootFS.
  - Build Directory structure to include /data and /application directories 
  - Intergrate Qt into Poky recipess
  - Intergrate cross comiplied RPI binary to Poky recipes.
  - Intergrate touch screen driver to Poky recipes.
  - Intergrate SSH capabilities for remote connections.
  - Deploy to RPI SD Card.
  - **Create boot up script.**
    -/etc/init.d/
    -ln -s /etc/init.d/TicTacToe /etc/rc3.d/S99TicTacToe
    -update-rc.d TicTacToe defaults
  - Implement sub project connect 4.
  - Implement sub project battleships.
