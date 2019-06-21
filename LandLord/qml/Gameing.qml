import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0
import ShouPai 1.0
Item{
    id: item
    BackgroundImage {
        id: bgImage
        source: "qrc:/images/scene/gameingScene.png"
        anchors.fill: parent

        //玩家头像”我“
        Image{
            id:touxiangImage1
            width: 50
            height: 50

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            source: "qrc:/images/touxiang/touxiang1.png"
        }
        //玩家头像”张三“
        Image{
            id:touxiangImage2
            width: 50
            height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/2
            anchors.left: parent.left
            anchors.leftMargin: 40

            source: "qrc:/images/touxiang/touxaing2.png"
        }
        //李四
        Image{
            id:touxiangImage3
            width: 50
            height: 50

            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/2
            source: "qrc:/images/touxiang/touxaing3.png"
        }
        //玩家名称"我“

        Image {
            id: nameImage1
            width: 100
            height: 50
            source: "qrc:/images/icons/Button2.png"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 22
            anchors.left: touxiangImage1.right
            anchors.leftMargin:10
            Text {
                id: text1
                text: qsTr("我")
                anchors.centerIn: parent
                style:Text.Sunken
                styleColor: "white"
                font.pointSize: 20
                anchors.bottomMargin: 0.3 * height
            }
        }
        //"张三”名字
        Image {
            id: nameImage2
            width: 100
            height: 50
            source: "qrc:/images/icons/Button2.png"
            anchors.horizontalCenter: touxiangImage2.horizontalCenter
            anchors.top: touxiangImage2.bottom
            anchors.bottomMargin:10
            Text {
                id: text2
                text: qsTr("张三")
                anchors.centerIn: parent
                style:Text.Sunken
                styleColor: "white"
                font.pointSize: 20
                anchors.bottomMargin: 0.3 * height
            }
        }
        //李四
        Image {
            id: nameImage3
            width: 100
            height: 50
            source: "qrc:/images/icons/Button2.png"
            //                 anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: touxiangImage3.bottom
            anchors.bottomMargin:10
            anchors.right: parent.right
            //            anchors.rightMargin:5
            Text {
                id: text3
                text: qsTr("李四")
                anchors.centerIn: parent
                style:Text.Sunken
                styleColor: "white"
                font.pointSize: 20
                anchors.bottomMargin: 0.3 * height
            }
        }
        //张三牌背面
        Image {
            id: paibeiImage1
            scale: 0.1
            source: "qrc:/images/pukepai/paibei-1.png"
            anchors.left:parent.left
            anchors.verticalCenter: parent.verticalCenter
        }
        //李四牌背面
        Image {
            id: paibeiImage2
            scale: 0.1
            source: "qrc:/images/pukepai/paibei-1.png"
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }

        //出牌按钮
        Button{
            id:chupaiButton
            anchors.right: parent.right
            anchors.rightMargin: parent.width/3
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 200
            scale:1
            background:Image {
                id: chupaiImage
                source: "qrc:/images/icons/chupai.bmp"

            }
        }
        //不出牌按钮
        Button{
            id:buchupaiButton
            anchors.left: parent.left
            anchors.leftMargin: parent.width/3
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 200
            scale: 1
            background:Image {
                id:buchupaiImage
                source: "qrc:/images/icons/guopai.bmp"
            }
        }
        //设置
        Image {
            id: setImage
            source: "qrc:/images/icons/set.png"
            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }
        Image{
            id:backImage
            source: "qrc:/images/icons/back.png"
            width:parent.width/10
            height: parent.width/10
            anchors.topMargin: 20
            anchors.right: parent.right
            MouseArea{
                id:backmouse
                anchors.fill: parent
                onClicked: {
                    stackView.pop()
                    gametime.re.opacity=0
                }

            }
        }

        ShouPai{
            id:shouPai



            //            ;shouPaiQml[0]
        }



        TexturePackerAnimatedSprite {
            id: sprite0
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[0]+".png"

            MouseArea {
                anchors.fill: sprite0
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite0.anchors.bottomMargin = sprite0.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite0.anchors.bottomMargin =sprite0.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite1
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*1
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[1]+".png"
            MouseArea {
                anchors.fill: sprite1
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite1.anchors.bottomMargin = sprite1.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite1.anchors.bottomMargin = sprite1.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite2
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*2
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[2]+".png"
            MouseArea {
                anchors.fill: sprite2
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite2.anchors.bottomMargin = sprite2.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite2.anchors.bottomMargin =sprite2.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite3
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*3
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[3]+".png"
            MouseArea {
                anchors.fill: sprite3
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite3.anchors.bottomMargin = sprite3.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite3.anchors.bottomMargin =sprite3.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite4
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*4
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[4]+".png"
            MouseArea {
                anchors.fill: sprite4
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite4.anchors.bottomMargin = sprite4.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite4.anchors.bottomMargin =sprite4.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite5
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*5
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[5]+".png"
            MouseArea {
                anchors.fill: sprite5
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite5.anchors.bottomMargin = sprite5.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite5.anchors.bottomMargin =sprite5.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite6
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*6
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[6]+".png"
            MouseArea {
                anchors.fill: sprite6
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite6.anchors.bottomMargin = sprite6.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite6.anchors.bottomMargin =sprite6.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite7
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*7
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[7]+".png"
            MouseArea {
                anchors.fill: sprite7
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite7.anchors.bottomMargin = sprite7.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite7.anchors.bottomMargin =sprite7.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite8
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*8
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[8]+".png"
            MouseArea {
                anchors.fill: sprite8
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite8.anchors.bottomMargin = sprite8.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite8.anchors.bottomMargin =sprite8.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite9
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*9
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[9]+".png"
            MouseArea {
                anchors.fill: sprite9
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite9.anchors.bottomMargin = sprite9.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite9.anchors.bottomMargin =sprite9.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite10
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*10
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[10]+".png"
            MouseArea {
                anchors.fill: sprite10
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite10.anchors.bottomMargin = sprite10.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite10.anchors.bottomMargin =sprite10.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite11
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*11
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[11]+".png"
            MouseArea {
                anchors.fill: sprite11
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite11.anchors.bottomMargin = sprite11.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite11.anchors.bottomMargin =sprite11.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }
            //        MouseArea{

            //            anchors.fill: bgImage
            //            onClicked: {

            //                console.log(11)
            //                var arr = shouPai.ShouPaiQml;
            //                console.log(shouPai.ShouPaiQml[0])
            //            }
            //        }


        }

        TexturePackerAnimatedSprite {
            id: sprite12
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*12
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[12]+".png"
            MouseArea {
                anchors.fill: sprite12
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite12.anchors.bottomMargin = sprite12.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite12.anchors.bottomMargin = sprite12.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite13
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*13
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[13]+".png"
            MouseArea {
                anchors.fill: sprite13
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite13.anchors.bottomMargin = sprite13.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite13.anchors.bottomMargin = sprite13.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite14
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*14
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[14]+".png"
            MouseArea {
                anchors.fill: sprite14
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite14.anchors.bottomMargin = sprite14.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite14.anchors.bottomMargin = sprite14.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite15
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*15
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[15]+".png"
            MouseArea {
                anchors.fill: sprite15
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite15.anchors.bottomMargin = sprite15.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite15.anchors.bottomMargin = sprite15.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite16
            width: 66
            height: 88
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: 200+18*16
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 80
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[16]+".png"
            MouseArea {
                anchors.fill: sprite16
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite16.anchors.bottomMargin = sprite16.anchors.bottomMargin+20;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite16.anchors.bottomMargin = sprite16.anchors.bottomMargin-20;
                        flag = 1;
                    }
                }
            }

        }
    }
}
