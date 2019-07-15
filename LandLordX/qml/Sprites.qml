import QtQuick 2.0
import Felgo 3.0
import ControlQml 1.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    id:root
    width: parent.width
    height: parent.height
    anchors.fill: parent
    property var shouPai:JSON.parse(controlQml.showShouPai())
    property var dzPai:JSON.parse(controlQml.showDiZhuPaiQu())
    property var cpQu0:JSON.parse(controlQml.showChuPaiQu0())
    property var cpQu1:JSON.parse(controlQml.showChuPaiQu1())
    property var cpQu2:JSON.parse(controlQml.showChuPaiQu2())
    property alias dizhupaiqubei: dizhupaiqubei
    property alias dizhupaiqu: dizhupaiqu
    property alias controlQml: controlQml

    property alias sprite0: sprite0
    property alias sprite1: sprite1
    property alias sprite2: sprite2
    property alias sprite3: sprite3
    property alias sprite4: sprite4
    property alias sprite5: sprite5
    property alias sprite6: sprite6
    property alias sprite7: sprite7
    property alias sprite8: sprite8
    property alias sprite9: sprite9
    property alias sprite10: sprite10
    property alias sprite11: sprite11
    property alias sprite12: sprite12
    property alias sprite13: sprite13
    property alias sprite14: sprite14
    property alias sprite15: sprite15
    property alias sprite16: sprite16
    property alias sprite17: sprite17
    property alias sprite18: sprite18
    property alias sprite19: sprite19

    property alias player0sprite0: player0sprite0
    property alias player0sprite1: player0sprite1
    property alias player0sprite2: player0sprite2
    property alias player0sprite3: player0sprite3
    property alias player0sprite4: player0sprite4
    property alias player0sprite5: player0sprite5
    property alias player0sprite6: player0sprite6
    property alias player0sprite7: player0sprite7
    property alias player0sprite8: player0sprite8
    property alias player0sprite9: player0sprite9

    property alias player1sprite0: player1sprite0
    property alias player1sprite1: player1sprite1
    property alias player1sprite2: player1sprite2
    property alias player1sprite3: player1sprite3
    property alias player1sprite4: player1sprite4
    property alias player1sprite5: player1sprite5
    property alias player1sprite6: player1sprite6
    property alias player1sprite7: player1sprite7
    property alias player1sprite8: player1sprite8
    property alias player1sprite9: player1sprite9

    property alias player2sprite0: player2sprite0
    property alias player2sprite1: player2sprite1
    property alias player2sprite2: player2sprite2
    property alias player2sprite3: player2sprite3
    property alias player2sprite4: player2sprite4
    property alias player2sprite5: player2sprite5
    property alias player2sprite6: player2sprite6
    property alias player2sprite7: player2sprite7
    property alias player2sprite8: player2sprite8
    property alias player2sprite9: player2sprite9



    ControlQml
    {
        id:controlQml
    }
    //背面显示
    RowLayout{
        id: dizhupaiqubei
        visible: true
        spacing: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        //地主牌区
        TexturePackerAnimatedSprite {
            id: spritedzpq0
            width: 66
            height: 88
            visible: true
            source: "../assets/pokersImage.json"
            frameNames: "beiMian.png"
        }

        TexturePackerAnimatedSprite {
            id: spritedzpq1
            width: 66
            height: 88
            visible: true
            source: "../assets/pokersImage.json"
            frameNames: "beiMian.png"

        }

        TexturePackerAnimatedSprite {
            id: spritedzpq2
            width: 66
            height: 88
            visible: true
            source: "../assets/pokersImage.json"
            frameNames: "beiMian.png"

        }
    }
    //正面显示
    RowLayout{
        id: dizhupaiqu
        visible: false
        spacing: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        //地主牌区
        TexturePackerAnimatedSprite {
            id: spritedz0
            width: 66
            height: 88
            visible: true
            source: "../assets/pokersImage.json"
            frameNames: dzPai[0].diZhuPaiQu+".png"
        }

        TexturePackerAnimatedSprite {
            id: spritedz1
            width: 66
            height: 88
            visible: true
            source: "../assets/pokersImage.json"
            frameNames: dzPai[1].diZhuPaiQu+".png"
        }

        TexturePackerAnimatedSprite {
            id: spritedz2
            width: 66
            height: 88
            visible: true
            source: "../assets/pokersImage.json"
            frameNames: dzPai[2].diZhuPaiQu+".png"
        }
    }

    //player0的出牌区
    TexturePackerAnimatedSprite {
        id:player0sprite0
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*1
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[0].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite1
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*2
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[1].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite2
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*3
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[2].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite3
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*4
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[3].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite4
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*5
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[4].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite5
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*6
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[5].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite6
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*7
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[6].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite7
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*8
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[7].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite8
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*9
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[8].daChuPai0+".png"
    }
    TexturePackerAnimatedSprite {
        id: player0sprite9
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3 + 50*10
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 100+parent.height/5
        source: "../assets/pokersImage.json"
        frameNames: cpQu0[9].daChuPai0+".png"
    }

    //player1的出牌区
    TexturePackerAnimatedSprite {
        id: player1sprite0
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*9
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[0].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite1
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[1].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite2
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*7
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[2].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite3
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[3].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite4
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[4].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite5
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[5].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite6
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*3
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[6].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite7
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[7].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite8
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1+45*1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[8].daChuPai1+".png"
    }
    TexturePackerAnimatedSprite {
        id: player1sprite9
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: parent.width/6.1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu1[9].daChuPai1+".png"
    }

    //player2的出牌区
    TexturePackerAnimatedSprite {
        id: player2sprite0
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[0].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite1
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[1].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite2
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[2].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite3
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*3
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[3].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite4
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[4].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id:player2sprite5
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[5].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite6
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[6].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite7
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*7
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[7].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite8
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[8].daChuPai2+".png"
    }
    TexturePackerAnimatedSprite {
        id: player2sprite9
        width: parent.width/14.5
        height: parent.height/6
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/6.1+45*9
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2
        source: "../assets/pokersImage.json"
        frameNames: cpQu2[9].daChuPai2+".png"
    }

    //手牌区

    TexturePackerAnimatedSprite {
        id: sprite0
        property var xuHao: shouPai[0].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6+55*0
        anchors.bottom:  parent.bottom
        //            anchors.bottomMargin: 80
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"

        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite1
        property var xuHao: shouPai[1].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*1
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite2
        property var xuHao: shouPai[2].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*2
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames:xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite3
        property var xuHao: shouPai[3].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*3
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames:  xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite4
        property var xuHao: shouPai[4].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*4
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite5
        property var xuHao: shouPai[5].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*5
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite6
        property var xuHao: shouPai[6].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*6
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite7
        property var xuHao: shouPai[7].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*7
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite8
        property var xuHao: shouPai[8].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*8
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite9
        property var xuHao: shouPai[9].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*9
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite10
        property var xuHao: shouPai[10].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*10
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames:xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite11
        property var xuHao: shouPai[11].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*11
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }

    }

    TexturePackerAnimatedSprite {
        id: sprite12
        property var xuHao: shouPai[12].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*12
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite13
        property var xuHao: shouPai[13].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*13
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite14
        property var xuHao: shouPai[14].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*14
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite15
        property var xuHao: shouPai[15].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*15
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite16
        property var xuHao: shouPai[16].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*16
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames: xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite17
        property var xuHao: shouPai[17].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*17
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames:xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite18
        property int xuHao: shouPai[18].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*18
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames:xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }
    }

    TexturePackerAnimatedSprite {
        id: sprite19
        property int xuHao: shouPai[19].shouPai
        width: parent.width/10
        height: parent.height/4.2
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: parent.width/4.6 + 55*19
        anchors.bottom:  parent.bottom
        anchors.bottomMargin: 35
        source: "../assets/pokersImage.json"
        frameNames:xuHao+".png"
        MouseArea {
            anchors.fill: parent
            property int flag: 1
            onClicked:
            {
                if(flag == 1){
                    parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
                    controlQml.setXuanZePai(parent.xuHao);
                    flag = 0;
                }else if(flag == 0)
                {
                    parent.anchors.bottomMargin =parent.anchors.bottomMargin-50;
                    controlQml.rmXuanZePai(parent.xuHao);
                    flag = 1;
                }
            }
        }

    }


    //    ListModel {
    //        id: spirteModel
    //        ListElement {
    //            name: "sprite0";
    //            no: /*shouPai[0].shouPai*/0;
    //        }

    //    }
    //    Component{
    //        id:spriteDelegate

    //        TexturePackerAnimatedSprite {
    //            id: name
    //            property int xuHao: no
    //            width: root.width/10
    //            height: root.height/4.2
    //            visible: true
    //            anchors.left: root.left
    //            anchors.leftMargin: root.width/4.6 + 55*xuHao
    //            anchors.bottom:  root.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: /*xuHao+*/"1.png"
    //            MouseArea {
    //                anchors.fill: parent
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        parent.anchors.bottomMargin = parent.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        parent.anchors.bottomMargin = parent.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }
    //    }

    //    ListView{
    //        layoutDirection: Qt.LeftToRight
    //        id:listview;
    //        anchors.left: root.left
    //        anchors.leftMargin: root.width/4.6
    //        anchors.bottom:  root.bottom
    //        anchors.bottomMargin: 35
    //        //            width: root.width
    //        //            height: root.height
    //        model:spirteModel
    //        delegate: spriteDelegate
    //    }
}

