import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.5

GameWindow {
    id: gameWindow
    screenWidth: 960
    screenHeight: 640


    activeScene: scene

    VideoShow{
        id:videoShow
    }

    //主页面
    MainScene{
        id: mainScene
    }
    StartScene{
        id:startScene
    }
    Playing{
        id:playing
        Gametimer{
            id:gametimer
        }
    }

    //关于
    AboutScene{
        id: aboutScene
    }

    //设置
    Setting {
        id: setting
    }
    Scene {
        anchors.fill: parent
        id: scene

        //提供基于堆栈的导航模型
        //StackView提供基于堆栈的导航。最后一个要“推”到堆栈上的项是第一个要删除的项，而最上面的项总是可见的项。
        StackView {
            id: stackView
            anchors.fill: parent
            initialItem: videoShow
        }
    }
}

