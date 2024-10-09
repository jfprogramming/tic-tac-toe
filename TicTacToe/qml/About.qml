import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: aboutPageItem
    objectName: "aboutPage"
    property var aboutInfo: AboutInfo

    GridView {
        id: gridView
        anchors.fill: parent
        model: ListModel {
            ListElement { key: "App Name"; value: aboutInfo.appName }
            ListElement { key: "Software Version"; value: aboutInfo.softwareVersion }
            ListElement { key: "Database Version"; value: aboutInfo.databaseVersion }
            ListElement { key: "Data Directory"; value: aboutInfo.dataDir }
            ListElement { key: "Date and Time"; value: aboutInfo.dateTime.toString() }
        }
        delegate: Row {
            width: gridView.width
            Text {
                text: model.key
                width: parent.width / 2
            }
            Text {
                text: model.value
                width: parent.width / 2
            }
        }
    }

    GameHeader {
        id: aboutPageHeader
    }

    Rectangle {
        id: aboutPageRect
        anchors.fill: parent
    }

    GameFooter {
        id: adminLoginPagefooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
            console.log("stack view size: " + stackView.depth + " " + stackView.get(0))
        }
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop(StackView.PushTransition)
        }
    }
}
