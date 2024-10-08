import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id:aboutPageItem
    objectName: "aboutPage"

    Header{
        id:aboutPageHeader
    }
    Rectangle{
        id:aboutPageRect
        anchors.fill: parent
    }

    Footer{
        id: adminLoginPagefooter
        homeBtn.onClicked: {
            stackView.clear()
            stackView.push("Home.qml", StackView.PushTransition)
            console.log("stack view size: "+stackView.depth+" "+stackView.get(0))
        }
        backBtn.visible: true
        backBtn.onClicked: {
            stackView.pop(StackView.PushTransition)
        }
    }
}
