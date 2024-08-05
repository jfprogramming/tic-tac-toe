import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("TicTacToe")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "PlayArea.qml" // Set the initial page
        Component.onCompleted: {
            //stackView.push("Home.qml")
        }
    }
}
