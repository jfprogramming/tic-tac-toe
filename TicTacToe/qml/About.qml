import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: aboutPageItem
    objectName: "aboutPage"

    Component.onCompleted: {
        aboutInfoListView.model.get(0).value = aboutInfo.appName
        aboutInfoListView.model.get(1).value = aboutInfo.softwareVersion
        aboutInfoListView.model.get(2).value = aboutInfo.dateTime

        console.log("aboutInfo appName: " +         aboutInfo.appName +", "+         aboutInfoListView.model.get(0).value)
        console.log("aboutInfo softwareVersion: " + aboutInfo.softwareVersion +", "+ aboutInfoListView.model.get(1).value)
        console.log("aboutInfo dateTime: " +        aboutInfo.dateTime +", "+        aboutInfoListView.model.get(2).value)
    }

    GameHeader {
        id: aboutPageHeader
    }

    Rectangle {
        id: aboutPageRect
        anchors.top: aboutPageHeader.bottom
        anchors.bottom: adminLoginPagefooter.top
        width: parent.width
        color: "white"
        ListView {
            id: aboutInfoListView
            anchors.fill: parent
            model: ListModel {
                ListElement { key: "App Name"; value: ""}
                ListElement { key: "Software Version"; value: ""}
                ListElement { key: "Date and Time"; value: ""}
            }
            header: Rectangle {
                width: aboutInfoListView.width
                height: 50
                color: "lightgray"
                Text {
                    anchors.centerIn: parent
                    text: "System Information"
                    color: "black"
                    font.bold: true
                    font.pointSize: 12
                    font.capitalization: Font.AllUppercase
                }
            }
            delegate: Row {
                width: aboutInfoListView.width
                spacing: 50
                Rectangle {
                    width: parent.width / 2
                    height: 50
                    Text {
                        text: model.key
                        width: parent.width / 2
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: parent.width / 2
                    height: 50
                    Text {
                        text: model.value
                        width: parent.width / 2
                        anchors.centerIn: parent
                    }
                }
            }
        }
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
