import QtQuick 2.0
import QtQuick.Controls 2.1
import Felgo 3.0

Item {
    id:item
    property alias attrs: attrs
    property alias countDown: countDown
    property alias re: re
    Canvas{
        id:re
        x:80
        y:0
        width: 160
        height: 50
        opacity: 0
        QtObject{
            id:attrs
            property int min
            property int second
            Component.onCompleted: {
                attrs.min=15;
                attrs.second=0
            }
        }
        Text{
            id:countShow
            anchors.centerIn: parent
            color: "red"
            style: Text.Sunken
            styleColor:"white"
            font.pixelSize: 50
        }
        Timer{
            id:countDown
            interval: 1000
            triggeredOnStart: true
            repeat: true

            onTriggered: {

                countShow.text="局时  "+attrs.min+":"+attrs.second
                attrs.second-=1
                if(attrs.second==-1){
                    attrs.min-=1
                    attrs.second=59
                }

                if(attrs.min==-1&&attrs.second==58)
                {
                    countDown.stop()
                    countShow.text="游戏结束"
                }


            }
        }
    }
}
