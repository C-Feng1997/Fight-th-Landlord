import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.5

// EMPTY SCENE

Scene {
    id: aboutScene
    visible: false
    anchors.fill: parent
    BackgroundImage{
        id: bgScene
        anchors.fill: parent
        source: "qrc:/images/scene/aboutScene.jpg"


        Item{
            id: aboutItem
            anchors.fill: parent

            Image {
                id: banBen
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.rightMargin: 301
                anchors.bottomMargin: 435
                anchors.leftMargin: 250
                anchors.topMargin: 100
                anchors.top: parent.top
                source: "qrc:/images/icons/banBen.JPG"
            }
            Image {
                id: pageImage
                scale: 0.8
                anchors.bottomMargin: 109
                anchors.leftMargin: 97
                anchors.rightMargin: 99
                anchors.topMargin: 208
                anchors.fill: parent
                anchors.top: banBen.bottom
                source: "qrc:/images/icons/guanYuPage.JPG"
            }

            Button{
                anchors.top: parent.top
                anchors.right: parent.right
                     width:parent.height/8
                     height: parent.height/8
                background: Rectangle {
                    Image {
                        id: back
                        anchors.fill: parent
                        source: "qrc:/images/icons/back1.png"

                    }
                    color: "transparent"
                }
                onClicked: stackView.pop()
            }
        }
    }
}
