import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.5


//欢乐斗地主的欢迎界面显示
Scene {
    anchors.fill: parent

    visible: false

    property alias bgMusic: bgMusic
//    property alias button4: menuButton4

    BackgroundMusic{
        id: bgMusic
        //设置此属性以在加载该项时自动播放背景音乐，例如在应用程序启动时。默认情况下，它被设置为true。设置的时候。启用音乐的属性也设置为true，音乐在设置对象初始化后播放。
        autoLoad: true
        //设置此属性以在加载该项时自动播放背景音乐，例如在应用程序启动时。默认情况下，它被设置为true。设置的时候。启用音乐的属性也设置为true，音乐在设置对象初始化后播放
        autoPlay: false
        source: "qrc:/images/audio/mainSound.mp3"
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
        width: parent.width * 9 / 22
        height: parent.height * 43 / 47
        anchors.topMargin: 60
        anchors.leftMargin:50
        anchors.bottom: parent.bottom

        source: "qrc:/images/touxiang/girl.png"
    }

    //开始界面的四个按钮
    //开始按钮
    MenuButton{
        id: menuButton1
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: parent.width/8
        anchors.topMargin: parent.height / 2.8
        anchors.top: parent.top
        width: parent.width / 5
        height: parent.height / 7
        image.source:"qrc:/images/icons/button.png"
        text: "单人游戏"
        mouseArea.onClicked: stackView.push(startScene)
    }
    //多人游戏按钮
    MenuButton{
        id: menuButton2
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 5
        anchors.top: parent.top
        anchors.topMargin: parent.height / 1.9
        width: parent.width / 5
        height: parent.height / 7
        image.source: "qrc:/images/icons/button.png"
        text: "多人游戏"
    }

    //关于按钮
    MenuButton{
        id: menuButton3
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 3.5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 5.8
        width: parent.width / 5
        height: parent.height / 7
        image.source: "qrc:/images/icons/button.png"
        text: "游戏关于"
        mouseArea.onClicked: stackView.push(aboutScene)
    }

    //设置按钮
    MenuButton{
        id: menuButton4
        visible: false
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 50
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 2.5
        width: parent.width / 5
        height: parent.height / 7
        image.source: "qrc:/images/icons/button.png"
        text: "设置"
        mouseArea.onClicked: setting.dialog.open()
    }

    //把主页面的四个按钮按顺序播放
    SequentialAnimation{
        id:sequentialAnimation
        PropertyAnimation{
            target: menuButton1
            property: "visible"
            from : false
            to : true
            duration: 200
        }
        PropertyAnimation{
            target: menuButton2
            property: "visible"
            from : false
            to : true
            duration: 200
        }
        PropertyAnimation{
            target: menuButton3
            property: "visible"
            from : false
            to : true
            duration: 200
        }
        PropertyAnimation{
            target: menuButton4
            property: "visible"
            from : false
            to : true
            duration: 200
        }
    }

    onVisibleChanged: {
        sequentialAnimation.start()
    }
}
