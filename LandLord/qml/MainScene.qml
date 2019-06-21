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

    Image {
        id: touxaing
        anchors.top: parent.top
        anchors.left: parent.left
        source: "qrc:/images/touxiang/touxiang0.png"
    }
    Image {
        id: renwumingkuang
        anchors.left: touxaing.right
        anchors.margins: 30
        width: 160
        height: 100
        source: "qrc:/images/icons/Button2.png"
        Image {
            id: renwuming
            anchors.fill: parent
            source: "qrc:/images/touxiang/renwuming.png"
        }
    }

    //显示在界面左侧的人物
    Image {
        id: girl
//        x: parent.width * 0.02
        width: parent.width * 0.45
        height: parent.height * 0.86
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
        x: parent.width * 0.752
        y: parent.height * 0.389
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
        x: parent.width * 0.593
        y: parent.height * 0.528
        width: parent.width / 5
        height: parent.height / 7
        image.source: "qrc:/images/icons/button.png"
        text: "多人游戏"
    }

    //关于按钮
    MenuButton{
        id: menuButton3
        visible: false
        x: parent.width * 0.492
        y: parent.height * 0.682
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
        x: parent.width * 0.392
        y: parent.height * 0.853
        width: parent.width / 5
        height: parent.height / 7
        image.source: "qrc:/images/icons/button.png"
        text: "设置"
        mouseArea.onClicked: setting.dialog.open()
    }

    //把主页面的四个按钮按顺序播放
    SequentialAnimation{
        id:squAuim
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
        squAuim.start()
    }
}
