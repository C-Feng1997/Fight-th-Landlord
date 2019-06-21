import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.9
import QtQuick.Controls 2.5

//开始进入界面的动画显示
Scene {
    id: videoShow

    anchors.fill: parent

    MediaPlayer {
        id: mediaplayer
        autoPlay: true
        source: "qrc:/images/audio/vedio.mp4"
    }

    VideoOutput {
        anchors.fill: parent
        source: mediaplayer
    }

    Timer{
        id:timer1
        interval: 7000
        running: true
        onTriggered: {
            stackView.push(mainScene)
            mainScene.bgMusic.play()
        }
    }

}
