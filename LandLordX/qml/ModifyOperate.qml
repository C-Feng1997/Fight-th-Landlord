import QtQuick 2.12
import Felgo 3.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2 as QQD

Item {
    property alias dialog2: dialog2
    property alias dialog3: dialog3

    id: modifyOperate
    width: 400
    height: 200
    signal saveModification //保存配置的修改

    //修改游戏头像
    QQD.Dialog {
        id:dialog2
        title: "修改头像"

        Rectangle {
            color: "transparent"
            implicitWidth: 400
            implicitHeight: 400

            //定义自由格式列表数据源。这是所有可供选择的头像。
            ListModel{
                id: model
                ListElement{ portrait: "qrc:/images/touxiang/touxiang4.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang5.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang6.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang7.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang8.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang9.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang10.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang11.png" }
                ListElement{ portrait: "qrc:/images/touxiang/touxiang0.png" }
            }

            //用于指定模型提供的项的网格视图
            GridView{
                id: grid
                width: 400
                height:400
                cellWidth: 195
                cellHeight: 195
                model: model
                delegate: contactDelegate
            }

            Component{
                id: contactDelegate
                Rectangle{
                    width: grid.cellWidth
                    height: grid.cellHeight
                    //此属性保存当前鼠标是否位于鼠标区域内。
                    //警告:如果hoverEnabled为false，则containsMouse只在鼠标被按下时有效，而鼠标光标位于MouseArea内。
                    color: mouseArea.containsMouse ? "lightsteelblue" : "transparent"
                    MouseArea{
                        id: mouseArea
                        anchors.fill: parent
                        //此属性保存是否处理悬停事件。默认情况下，鼠标事件仅在响应按钮事件或按下按钮时处理。悬停允许处理所有鼠标事件，即使没有按下鼠标按钮。
                        hoverEnabled: true
                        Image {
                            id: image2
                            source: portrait
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        onPressed: opacity=0.5
                        onReleased: opacity=1
                        //当点击一下自己所需要的头像就会更新source，得到自己选中的图片
                        onClicked: {
                            startScene.source = image2.source
                            playing.source = image2.source
                        }
                    }

                }
            }
        }
        onAccepted: {
            saveModification()
            game1.saveGame()
        }

    }

    QQD.Dialog{
        id:dialog3
        title: "修改用户名"
        TextField{
            id:changeText
            anchors.centerIn: parent
            placeholderText: qsTr("修改用户名")
            selectByMouse: true
        }
        onAccepted: {
            if(changeText.text!="")
            {
                playing.text=changeText.text
                startScene.text1=changeText.text
            }
            saveModification()
            game1.saveGame()
        }
    }
    function init(game1){
        changeText.text=game1.player.userName
        playing.text=game1.player.userName
        startScene.text1=game1.player.userName

//        image2.source= game1.player.avatar
        startScene.source =  game1.player.avatar
        playing.source =  game1.player.avatar
    }
    function saveSetting(game1){
        game1.player.userName=changeText.text
        game1.player.avatar= startScene.source
    }
}

