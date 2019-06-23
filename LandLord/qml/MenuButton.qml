import QtQuick 2.0

Rectangle{
    id: button

//    width: parent.width / 5
//    height: parent.height / 7
//    width:parent.width / 7
//    height:parent.height / 7
    color: "transparent"
//    radius: 10
    property alias image: image
    property alias mouseArea: mouseArea
    property alias text: text.text

    //这个信号处理器当按钮被点击时将会被调用
    //    signal clickChanged(string str)

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


