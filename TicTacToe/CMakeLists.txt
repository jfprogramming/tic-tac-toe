cmake_minimum_required(VERSION 3.16)

project(TicTacToe VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

set(CMAKE_AUTORCC ON)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTicTacToe
    main.cpp
)

qt_add_qml_module(appTicTacToe
    URI TicTacToe
    VERSION 1.0
    SOURCES
        gamelogic.h gamelogic.cpp
        playermanger.h playermanger.cpp
        databasecontroller.h databasecontroller.cpp
    QML_FILES
        Main.qml
        PlayArea.qml
        Home.qml
        DateTimeSetting.qml
        PlayerManager.qml
        PlayerSelection.qml
        AdminLogin.qml
        AdminPage.qml
        Footer.qml
        Header.qml
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
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTicTacToe
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
