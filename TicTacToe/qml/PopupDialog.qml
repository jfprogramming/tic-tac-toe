import QtQuick 2.15
import QtQuick.Controls 2.15

Dialog {
    id: popupMsgItem
    objectName: "popupMsgItem"
    width: 200
    height: 150
    modal: true
    focus: true
    anchors.centerIn: parent
    standardButtons: Dialog.Ok
    closePolicy: Dialog.NoAutoClose // This disables Popup.CloseOnPressOutside

    // Expose properties to other QML files
    //
    property alias popupMsgtxt: popupMsgText.text
    property alias popupMsgColor: popupMsgRect.color
    property alias popupMsgtxtVisible: popupMsgText.visible

    Rectangle {
        id: popupMsgRect
        anchors.fill: parent
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
        duration: 1000
    }

}
