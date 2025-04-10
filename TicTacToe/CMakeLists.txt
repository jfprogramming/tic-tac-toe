cmake_minimum_required(VERSION 3.16)

project(TicTacToe VERSION 0.1 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(Qt6_DIR /opt/Qt/6.7.2/gcc_64/)

# set(Qt6_FOUND TRUE)

# Include Qt libraries
# find_package(Qt6 6.7 REQUIRED COMPONENTS Quick Test Sql)
find_package(Qt6 6.7 REQUIRED COMPONENTS Quick Test Sql Network QuickControls2 VirtualKeyboard HINTS /opt/Qt/6.7.2/gcc_64/lib/cmake)

set(CMAKE_AUTORCC ON)

qt_standard_project_setup(REQUIRES 6.7)

# Add executable
qt_add_executable(appTicTacToe
    main.cpp
)

# Source Files
qt_add_qml_module(appTicTacToe
    URI TicTacToe
    VERSION 1.0
    SOURCES
        controllers/gamelogic.h
        controllers/gamelogic.cpp
        controllers/databasemanager.h
        controllers/databasemanager.cpp
        controllers/systemsettings.h
        controllers/systemsettings.cpp
        models/gameplaymodel.h
        models/gameplaymodel.cpp
        models/aboutinfo.h
        models/aboutinfo.cpp
        models/highscoremodel.h
        models/highscoremodel.cpp
        models/adminplayermodel.h
        models/adminplayermodel.cpp
        controllers.h
        controllers.cpp
        cryptclass.h
        cryptclass.cpp
    QML_FILES
        qml/AdminLogin.qml
        qml/AdminPage.qml
        qml/DateTimeSetting.qml
        qml/GameFooter.qml
        qml/GameHeader.qml
        qml/HighScore.qml
        qml/Home.qml
        qml/Main.qml
        qml/PlayArea.qml
        qml/PlayerManager.qml
        qml/PlayerListModel.qml
        qml/PlayerSelection.qml
        qml/About.qml
        qml/PopupDialog.qml
        qml/WinStrike.qml
        qml/EditPlayerForm.qml
        qml/EditFieldForm.qml

    RESOURCES
        resources.qrc
)

# Set target properties
set_target_properties(appTicTacToe PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# Link Qt libraries
target_link_libraries(appTicTacToe
    PRIVATE Qt6::Quick Qt6::Sql Qt6::Network Qt6::QuickControls2 Qt6::VirtualKeyboard
    PRIVATE crypt crypto
)

# Installation
include(GNUInstallDirs)
install(TARGETS appTicTacToe
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Enable testing
enable_testing()

# GoogleTest setup
include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/release-1.11.0.zip
)
FetchContent_MakeAvailable(googletest)

# Add GoogleTest files
set(GTEST_SOURCES
    ${CMAKE_SOURCE_DIR}/gtests/gtest_1_main.cpp
    # Add other test files here
)

# Add GoogleTest executable
add_executable(GoogleTests ${GTEST_SOURCES})

# Link GoogleTest libraries
target_link_libraries(GoogleTests gtest gtest_main)

# Add GoogleTest to CTest
add_test(NAME GoogleTests COMMAND GoogleTests)

# Add QTest files
set(QTEST_SOURCES
    # Add other test files here
    ${CMAKE_SOURCE_DIR}/qtests/test_main.cpp
    ${CMAKE_SOURCE_DIR}/qtests/test_databasemanager.cpp
    ${CMAKE_SOURCE_DIR}/qtests/test_databasemanager.h
    ${CMAKE_SOURCE_DIR}/qtests/test_systemsettings.h
    ${CMAKE_SOURCE_DIR}/qtests/test_systemsettings.cpp
    ${CMAKE_SOURCE_DIR}/qtests/test_gamelogic.h
    ${CMAKE_SOURCE_DIR}/qtests/test_gamelogic.cpp
    # Controller Classes
    ${CMAKE_SOURCE_DIR}/cryptclass.cpp
    ${CMAKE_SOURCE_DIR}/cryptclass.h
    ${CMAKE_SOURCE_DIR}/controllers.cpp
    ${CMAKE_SOURCE_DIR}/controllers/databasemanager.cpp
    ${CMAKE_SOURCE_DIR}/controllers/databasemanager.h
    ${CMAKE_SOURCE_DIR}/controllers/systemsettings.cpp
    ${CMAKE_SOURCE_DIR}/controllers/systemsettings.h
    ${CMAKE_SOURCE_DIR}/controllers/gamelogic.cpp
    ${CMAKE_SOURCE_DIR}/controllers/gamelogic.h
)

# Add QTest executable
add_executable(QTests ${QTEST_SOURCES})

# Link QTest library
target_link_libraries(QTests Qt6::Test Qt6::Sql crypt crypto)

# Add QTest to CTest
add_test(NAME QTests COMMAND QTests)

# Discover GoogleTest tests
include(GoogleTest)
gtest_discover_tests(GoogleTests)
