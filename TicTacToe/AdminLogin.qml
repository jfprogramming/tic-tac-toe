import QtQuick

Item {

    Header{
        id:homePageHeader
    }

    Rectangle{
        id: mainArea
        anchors.fill: parent
        color: "white"
        anchors.top: homePageHeader.bottom
        anchors.topMargin: 50
        anchors.bottom: homePagefooter.top
        anchors.bottomMargin: 50
    }


    Footer{
        id: homePagefooter
    }
}
