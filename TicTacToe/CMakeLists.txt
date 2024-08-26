cmake_minimum_required(VERSION 3.16)

project(TicTacToe VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Sql)

set(CMAKE_AUTORCC ON)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTicTacToe
    main.cpp
)

qt_add_qml_module(appTicTacToe
    URI TicTacToe
    VERSION 1.0
    SOURCES
        controllers/gamelogic.h
        controllers/gamelogic.cpp
        controllers/playermanger.h
        controllers/playermanger.cpp
        controllers/databasecontroller.h
        controllers/databasecontroller.cpp
        models/playermodel.h
        models/playermodel.cpp
        models/aboutinfo.h
        models/aboutinfo.cpp
        models/gamemodel.h
        models/gamemodel.cpp
        models/highscoremodel.h
        models/highscoremodel.cpp
        cryptclass.h
        cryptclass.cpp
    QML_FILES
        qml/AdminLogin.qml
        qml/AdminPage.qml
        qml/DateTimeSetting.qml
        qml/Footer.qml
        qml/Header.qml
        qml/HighScore.qml
        qml/Home.qml
        qml/Main.qml
        qml/PlayArea.qml
        qml/PlayerManager.qml
        qml/PlayerModel.qml
        qml/PlayerSelection.qml
        qml/About.qml
        qml/PopupMsg.qml
    RESOURCES
        resources.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTicTacToe PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTicTacToe
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTicTacToe
    PRIVATE Qt6::Quick Qt6::Sql
)
target_link_libraries(appTicTacToe
    PRIVATE crypt crypto)

include(GNUInstallDirs)
install(TARGETS appTicTacToe
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
