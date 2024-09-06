# tic-tac-toe

About: Simple Tic Tac Toe Game developed using Qt, C++/QML, CmakeList and Sqlite3 database.


Project Structure: 
    tic-tac-toe
        - Setup Directory
            - package and dependancies script 
        - TicTacToe Game Directory   
            - Database - sqlite3 db
            - Docuemnts (project Docs)
            - Images (graphics used by game)
            - Contorllers (C++ M-V-V)
            - qml (view)
            - modles (used by view)
            - javascript (functions used by view)
        - README.md
        - .gitignore
        - .git

Building and Running:
    - Currently compiled and tested on Ubuntu 22.4
    - Packages and dependinces
        - At the root of the project in the setup directory there is a shell scripted
          used to setup the necessary packages for developemnt on Ubuntu 22.4 O.S.
        - Locate and run `install.sh`
            - this script will also setup your /data directory for database and
              configuration files
    - Creating a new database 
        - run the python database to create a new database and place it in /data/database
          directory or run the copy shell script `copy_db.sh`   
    
    - Open the TicTacToe Project in Qt creator & setup compiler and build and run project 


Game Mode: 
    - Home Screen 
        - 1 Player 
        - 2 Player
        - High Score 
        - Admin Login 
            - admin / admin
        
    - Selecting 1 player 
        - select player 
            - play against computer
            - score is keept in the header      
        - Once game is complete select the RESET button to clear the board. 
        
    - Screen nagivation button located in footer of application 
        - Home button 
        - Back button 
    
    - NOTE: Please allow for up to 1 second for Player 2 (computer) to place its Mark 'O' 
    
Admin Mode:
    - You can login as an admin user from the home screen by clicking the login admin button
        - admin / admin
    - admin mode gives you access to system setting features
        - About Page (Partially complete)
        - Date Time Settings Page (Partially complete)
        - Player Manager Page (Partially complete)
    

Features Incomplete:
    Below is a list of features not complete yet
    - 2 Player Mode 
        - Player input controll
    - Date/Time setting (Admin Only)
    - Player Managment (Admin Only)
    - High Score (Partial) 
        - High Score data is being pulled from db and display in GUI table 
        - TODO accumulate player scor and save to the database
    - Other Game Modes - Connect 4 / Battle Ships
    - IoT High Score Web App
        - implement the AWS web application for displaying high score 
    - Popup (Partial) 
        - pop up mechanism to controller player input and player turn sequence 
    - QSetting Files (Partial)
    - Custom Poky build consisting of Qt and application patches, touch screen driver. (Partial)        
        - housed in seperate repo 
    
    
TODO: 
  - Clean up win graphics
  - Implment Player Management for Admin User
  - Implement 2 Player Game Mode logic      
  - Implement date / time settings 
  - Finish High Score 



