import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0

Item{
    id: start
    property alias source: touxiangImage.source
    property alias text1: text.text

    BackgroundImage {
        id: bgImage
        source: "qrc:/images/scene/startScene.jpg"
        anchors.fill: parent
    }
    //玩家头像
    Image{
        id:touxiangImage
        scale: 0.7

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

//        source: "qrc:/images/touxiang/touxiang1.png"
        source: game1.player.avatar
        MouseArea{
            anchors.fill: parent
            onPressed: touxiangImage.opacity=0.5
            onReleased: touxiangImage.opacity=1
            onClicked: modifyOperate.dialog2.open()
        }
    }
    //玩家名称

    Image {
        id: nameImage
        //            width: 100
        //            height: 50
        scale: 0.7
        source: "qrc:/images/icons/Button2.png"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 22
        anchors.left: touxiangImage.right
        anchors.leftMargin:10
        Text {
            id: text
            text: qsTr("玩家")
            style:Text.Sunken
            //                styleColor: "white"
            color: "white"
            font.pointSize: 20
            anchors.centerIn: parent
            //                anchors.bottomMargin: 0.3 * height
        }
        MouseArea{
            anchors.fill: parent
            onClicked: modifyOperate.dialog3.open()
        }
    }
    //“开始游戏“按钮
    Button{
        id:kaishibutton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin: 240
        Text {
            id: kaishitext
            style:Text.Sunken
            styleColor: "red"
            text:qsTr("开始游戏")
            font.pointSize: 20
            anchors.centerIn: parent
        }
        scale: 1

        background:Image {
            source: "qrc:/images/icons/button.png"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    //让开始的音乐的暂停
                    mainScene.bgMusic.stop()
                    stackView.push(playing)
                    //自动播放游戏中的音乐
                    playing.bgMusic1.play()

                    playing.gametimer.attrs.min=15
                    playing.gametimer.attrs.second=0
                    playing.gametimer.countDown.start()
                    playing.gametimer.re.opacity=1
                }
            }
        }
    }

    TexturePackerAnimatedSprite{
        id:texture
        anchors.left: parent
        width: 200;height: 200
        source: "../assets/guang.json"
        frameNames: ["guang2.png","guang3.png"]
    }

    Image{
        id:backImage
        source: "qrc:/images/icons/back.png"
        width:parent.width/10
        height: parent.width/10
        anchors.topMargin: 20
        anchors.right: parent.right
        MouseArea{
            id:backmouse
            anchors.fill: parent
            onClicked: {
                stackView.pop()
            }

        }
    }
}


