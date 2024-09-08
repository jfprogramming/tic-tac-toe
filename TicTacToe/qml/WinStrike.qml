import QtQuick

Item {
    id:winStrikeItem

    // Property alias
    //
    property alias winStrike1: win1.visible
    property alias winStrike2: win2.visible
    property alias winStrike3: win3.visible
    property alias winStrike4: win4.visible
    property alias winStrike5: win5.visible
    property alias winStrike6: win6.visible
    property alias winStrike7: win7.visible
    property alias winStrike8: win8.visible

    // win rectangles are used to display the
    // visual cross out line for 3 in a row
    //
    Rectangle{
        id: win1
        visible: false
        rotation: 0
        width: parent.width
        height: 20
        anchors.top: parent.top
        anchors.topMargin: 50
        color: "red"
        onVisibleChanged: {
            console.log("win1 rectangle visible change.... " + win1.visible)
        }
    }

    Rectangle{
        id: win2
        visible: false
        rotation: 0
        width: parent.width
        height: 20
        anchors.top: parent.top
        anchors.topMargin: 185
        color: "red"

    }

    Rectangle{
        id: win3
        visible: false
        rotation: 0
        width: parent.width
        height: 20
        anchors.top: parent.top
        anchors.topMargin: 325
        color: "red"
    }

    Rectangle{
        id: win4
        visible: false
        rotation: 0
        height: parent.height
        width: 20
        anchors.left: parent.left
        anchors.leftMargin: 100
        color: "red"
    }

    Rectangle{
        id: win5
        visible: false
        rotation: 0
        height: parent.height
        width: 20
        anchors.left: parent.left
        anchors.leftMargin: 315
        color: "red"
    }

    Rectangle{
        id: win6
        visible: false
        rotation: 0
        height: parent.height
        width: 20
        anchors.left: parent.left
        anchors.leftMargin: 540
        color: "red"
    }

    Rectangle{
        id: win7
        visible: false
        rotation: 40
        width: parent.width
        height: 20
        anchors.centerIn: parent
        color: "red"
    }

    Rectangle{
        id: win8
        visible: false
        rotation: -40
        width: parent.width
        height: 20
        anchors.centerIn: parent
        color: "red"
    }
}
