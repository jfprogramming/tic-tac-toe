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
        initialItem: "Home.qml" // Set the initial page
        Component.onCompleted: {
            console.log("stackView count: "+stackView.depth)
        }
    }
}
