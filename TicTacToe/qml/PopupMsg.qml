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
    NumberAnimation {
        id: popupAnimation
        target: popup
        property: "opacity"
        from: 0
        to: 1
        duration: 500 // Adjust duration as needed
    }

}
