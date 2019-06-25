import QtQuick 2.0

Rectangle{
    id: button

    color: "transparent"

    property alias image: image
    property alias mouseArea: mouseArea
    property alias text: text.text

    Image {
        id: image
        Text {
            id: text
            anchors.centerIn: parent
            font.pixelSize: 60
            color: "Linen"
            opacity: 1
        }
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onPressed: button.opacity = 0.5
        onReleased: button.opacity = 1
    }
}


