import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.5


//欢乐斗地主的欢迎界面显示
Scene {
    anchors.fill: parent

    visible: false

    property alias bgMusic: bgMusic
    property alias button4: menuButton4

    BackgroundMusic{
        id: bgMusic
        //设置此属性以在加载该项时自动播放背景音乐，例如在应用程序启动时。默认情况下，它被设置为true。设置的时候。启用音乐的属性也设置为true，音乐在设置对象初始化后播放。
        autoLoad: true
        //设置此属性以在加载该项时自动播放背景音乐，例如在应用程序启动时。默认情况下，它被设置为true。设置的时候。启用音乐的属性也设置为true，音乐在设置对象初始化后播放
        autoPlay: false
        source: "qrc:/images/audio/bgMusic.mp3"
    }

    //界面的背景图片
    BackgroundImage{
        id: bgImage
        source: "qrc:/images/scene/mainScene.png"
        anchors.fill: parent
    }

    //显示在界面左侧的人物
    Image {
        id: girl
        x: parent.width * 0.02
        width: parent.width * 0.332
        height: parent.height * 0.9

        source: "qrc:/images/touxiang/girl.png"
    }

    //开始界面的四个按钮
    //开始按钮
        MenuButton{
            id: menuButton1
            x: parent.width * 0.752
            y: parent.height * 0.389
            image.source:"qrc:/images/icons/button.png"
            text: "单人游戏"
            mouseArea.onClicked: stackView.push(mybutton.fightoptionview)

    }
    //多人游戏按钮
        MenuButton{
            id: menuButton2
            x: parent.width * 0.593
            y: parent.height * 0.528
            image.source: "qrc:/images/icons/button.png"
            text: "多人游戏"
        }

    //关于按钮
        MenuButton{
            id: menuButton3
            x: parent.width * 0.492
            y: parent.height * 0.682
            image.source: "qrc:/images/icons/button.png"
            text: "游戏关于"
            mouseArea.onClicked: stackView.push(aboutInterface)
        }

    //设置按钮
        MenuButton{
            id: menuButton4
            x: parent.width * 0.392
            y: parent.height * 0.853
            image.source: "qrc:/images/icons/button.png"
            text: "设置"
            mouseArea.onClicked: setting.dialog.open()
        }
}
