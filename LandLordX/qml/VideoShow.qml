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
        source: "qrc:/images/audio/vedio.mp4"
        //此信号在回放停止时发出并接受该信号并自动切换场景和播放音乐
        onStopped: {
            stackView.push(mainScene)
            mainScene.bgMusic.play()
        }
    }

    VideoOutput {
        anchors.fill: parent
        source: mediaplayer
        //视频被均匀地缩放以填充，如果必要的话进行裁剪
        fillMode: VideoOutput.PreserveAspectCrop
        //隔3秒自动播放视频
        Timer{
            id: timer0
            interval: 3000
            //如果设置为true，则启动计时器;否则将停止计时器。对于非重复计时器，在触发计时器后将running设置为false。运行默认值为false。
            running: true
            //计时器时间到了自动显示视频
            onTriggered: {
                mediaplayer.play()
            }
        }
    }

    //    Timer{
    //        id:timer1
    ////        interval: 7000
    //        running: false
    //        onTriggered: {
    //            stackView.push(mainScene)
    //            mainScene.bgMusic.play()
    //        }
    //    }

}
