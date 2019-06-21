import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0
import ShouPai 1.0


TexturePackerAnimatedSprite {
    id: sprit0
    property int xuHao: 0
    width: 60
    height: 80
    visible: true
    anchors.left: bgImage.left
    anchors.leftMargin: 200 + xuHao*16
    anchors.bottom:  bgImage.bottom
    anchors.bottomMargin: 100
    source: "../assets/pokersImage.json"
    frameNames: xuHao+".png"

    MouseArea {
        anchors.fill: sprit0
        property int flag: 1
        onClicked:
        {
            if(flag == 1){
                poker00.y = poker00.y-20;
                flag = 0;
            }else if(flag == 0)
            {
                poker00.y = poker00.y+20;
                flag = 1;
            }
        }
    }
}
