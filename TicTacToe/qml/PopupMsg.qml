import QtQuick
import QtQuick.Controls

Popup {
    id: popupMsgItem
    objectName: "popupMsgItem"
    width: 200
    height: 150
    modal: true
    focus: true
    anchors.centerIn: parent


    property alias popupMsgtxt: popupMsgText.text

    Rectangle {
        id: popupMsgRect
        anchors.fill: parent.fill
        anchors.centerIn: parent
        color: "#0078D4"

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
            popupMsgItem.close()
        }
    }

}
