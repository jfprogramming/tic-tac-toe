import QtQuick
import QtQuick.Controls

Popup {
    id: popupMsgItem
    objectName: "popupMsgItem"
    width: 200
    height: 150
    modal: true
    focus: true

    property alias popupMsg: popupMsgText

    Rectangle {
        id: popupMsgRect
        color: "white"
        anchors.fill: parent.fill

        Text {
            id: popupMsgText
            text: "Popup message Text"
            font.pixelSize: 16
            anchors.centerIn: parent
        }
    }

    // Animation for fade-in and fade-out
    //
    NumberAnimation {
        id: popupAnimation
        target: popupMsgItem
        property: "opacity"
        from: 0
        to: 1
        duration: 500
    }

    Button {
        text: "OK"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            popupMsg.close()
        }
    }

}
