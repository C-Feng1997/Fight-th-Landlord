import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2 as QQD

Item {
    property alias dialog: dialog
    property alias switch1: switch1


    QQD.Dialog {
        id:dialog
        title: "设置"

        contentItem: Rectangle {
            color: "lightskyblue"
            implicitWidth: 400
            implicitHeight: 200
            ColumnLayout{
                anchors.centerIn: parent
                Switch{
                    id: switch1
                    text: qsTr("音乐")
                    //如果选中控件，则此属性为真。默认值为false。
                    checked: false
                    onPressedChanged: {
                        //如果checked为false，则不播放音乐
                        if(!checked)
                            mainPage.bgMusic.stop()
                        else
                            //如果checked为true，则开始播放媒体。
                            mainPage.bgMusic.play()
                    }
                }
                //                Button{
                //                    id: control
                //                    Text {
                //                        id: text
                //                        text: qsTr("关于")
                //                        color: "Chocolate"
                //                        anchors.centerIn: parent
                //                        font.pixelSize: 40
                //                    }
                //                    background: Image {
                //                        id: guanyu
                //                        source: "qrc:/mainInterface/button/button.png"
                //                    }

            }
        }

    }
}










