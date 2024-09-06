import QtQuick
import QtQuick.Controls

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
            stackView.pop()
        }
    }
}
