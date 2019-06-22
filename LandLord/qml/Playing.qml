import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0
import ShouPai 1.0
import QtQuick.Layouts 1.3
Item{
    id: item
    visible: false
    signal click
    BackgroundImage {
        id: bgImage
        source: "qrc:/images/scene/gamingScene.png"
        anchors.fill: parent

        //玩家头像”我“
        Image{
            id:touxiangImage1
            //            width: 50
            //            height: 50
            scale: 0.7
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            source: "qrc:/images/touxiang/touxiang1.png"
        }
        //玩家头像”张三“
        Image{
            id:touxiangImage2
            //            width: 50
            //            height: 50
            scale: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/2
            anchors.left: parent.left
            anchors.leftMargin: 40

            source: "qrc:/images/touxiang/touxaing2.png"
        }
        //李四
        Image{
            id:touxiangImage3
            //            width: 50
            //            height: 50
            scale: 0.7
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/2
            source: "qrc:/images/touxiang/touxaing3.png"
        }
        //玩家名称"我“

        Image {
            id: nameImage1
            //            width: 100
            //            height: 50
            scale: 0.7
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
                styleColor: "red"
                font.pointSize: 20
                color: "white"
                anchors.bottomMargin: 0.3 * height
                //                scale: 0.5
            }
        }
        //"张三”名字
        Image {
            id: nameImage2
            //            width: 100
            //            height: 50
            scale: 0.7
            source: "qrc:/images/icons/Button2.png"
            anchors.horizontalCenter: touxiangImage2.horizontalCenter
            anchors.top: touxiangImage2.bottom
            anchors.bottomMargin:10
            Text {
                id: text2
                text: qsTr("张三")
                anchors.centerIn: parent
                color: "white"
                style:Text.Sunken
                styleColor: "red"
                font.pointSize: 20
                anchors.bottomMargin: 0.3 * height
            }
        }
        //李四
        Image {
            id: nameImage3
            //            width: 100
            //            height: 50
            scale: 0.7
            source: "qrc:/images/icons/Button2.png"
            //                 anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: touxiangImage3.bottom
            anchors.bottomMargin:10
            anchors.right: parent.right
            //            anchors.rightMargin:5
            Text {
                id: text3
                //                  scale: 0.5
                text: qsTr("李四")
                anchors.centerIn: parent
                style:Text.Sunken
                styleColor: "red"
                color: "white"
                font.pointSize: 20
                anchors.bottomMargin: 0.3 * height
            }
        }
        //张三牌背面
        Image {
            id: paibeiImage1
            scale: 0.3
            source: "qrc:/images/pukepai/paibei-1.png"
            anchors.left:parent.left
            anchors.leftMargin: parent.height/6
            anchors.verticalCenter: parent.verticalCenter
        }
        //李四牌背面
        Image {
            id: paibeiImage2
            scale: 0.3
            source: "qrc:/images/pukepai/paibei-1.png"
            anchors.right: parent.right
            anchors.rightMargin: parent.height/6
            anchors.verticalCenter: parent.verticalCenter
        }

        //出牌按钮
        Button{
            id:chupaiButton
            anchors.right: parent.right
            anchors.rightMargin: parent.width/3
            anchors.bottom:parent.bottom
            anchors.bottomMargin: parent.height/3
            scale:2
            background:Image {
                id: chupaiImage
                source: "qrc:/images/icons/chupai.bmp"
                opacity: 0
            }
        }
        //叫地主
        Button{
            id:dizhuButton
            anchors.left:parent.left
            anchors.leftMargin: parent.width/3
            anchors.bottom:parent.bottom
            anchors.bottomMargin: parent.height/3
            scale:0.4
            Text {
                id: dizhu
                text: qsTr("叫地主")
                font.pointSize: 20
                color: "white"
                anchors.centerIn: parent
            }
            background:Image {
                id: dizhuImage
                source: "qrc:/images/icons/dizhuButton.bmp"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        chupaiImage.opacity=1
                        buchupaiImage.opacity=1
                        dizhuButton.opacity=0
                        dizhuButton2.opacity=0
                        dizhupaiqubei.opacity=0
                        dizhupaiqu.visible=true
                    }
                }
            }

        }
        //“不叫地主”
        Button{
            id:dizhuButton2
            anchors.right:parent.right
            anchors.rightMargin: parent.width/3
            anchors.bottom:parent.bottom
            anchors.bottomMargin: parent.height/3
            scale:0.4
            Text {
                id: dizhu2
                text: qsTr("不叫")
                font.pointSize: 20
                color: "white"
                anchors.centerIn: parent
            }
            background:Image {
                id: dizhuImage2
                source: "qrc:/images/icons/dizhuButton.bmp"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        //                        chupaiImage.opacity=1
                        //                         buchupaiImage.opacity=1
                        dizhuButton2.opacity=0
                        dizhuButton.opacity=0
                    }
                }
            }
        }
        //不出牌按钮
        Button{
            id:buchupaiButton
            anchors.left: parent.left
            anchors.leftMargin: parent.width/3
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height/3
            scale: 2
            background:Image {
                id:buchupaiImage
                source: "qrc:/images/icons/guopai.bmp"
                opacity: 0
            }
        }
        //设置
        Image {
            id: setImage
            source: "qrc:/images/icons/set.png"
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            MouseArea{
                anchors.fill: parent
                onClicked: setting.dialog.open()
            }
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
                    gametimer.re.opacity=0
                }

            }
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
//        //正面显示
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
                frameNames: shouPai.DiZhuPaiQml[0]+".png"
            }

            TexturePackerAnimatedSprite {
                id: spritedz1
                width: 66
                height: 88
                visible: true
                source: "../assets/pokersImage.json"
                frameNames: /*shouPai.DiZhuPaiQml[1]+".png"*/"53.png"
            }

            TexturePackerAnimatedSprite {
                id: spritedz2
                width: 66
                height: 88
                visible: true
                source: "../assets/pokersImage.json"
                frameNames: /*shouPai.DiZhuPaiQml[2]+".png"*/"52.png"
            }
        }


        //


        ShouPai{
            id:shouPai
        }


        TexturePackerAnimatedSprite {
            id: sprite0
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6
            anchors.bottom:  bgImage.bottom
//            anchors.bottomMargin: 80
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[0]+".png"

            MouseArea {
                anchors.fill: sprite0
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite0.anchors.bottomMargin = sprite0.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite0.anchors.bottomMargin =sprite0.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite1
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[1]+".png"
            MouseArea {
                anchors.fill: sprite1
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite1.anchors.bottomMargin = sprite1.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite1.anchors.bottomMargin = sprite1.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite2
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*2
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[2]+".png"
            MouseArea {
                anchors.fill: sprite2
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite2.anchors.bottomMargin = sprite2.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite2.anchors.bottomMargin =sprite2.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite3
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*3
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[3]+".png"
            MouseArea {
                anchors.fill: sprite3
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite3.anchors.bottomMargin = sprite3.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite3.anchors.bottomMargin =sprite3.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite4
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*4
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[4]+".png"
            MouseArea {
                anchors.fill: sprite4
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite4.anchors.bottomMargin = sprite4.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite4.anchors.bottomMargin =sprite4.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite5
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*5
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[5]+".png"
            MouseArea {
                anchors.fill: sprite5
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite5.anchors.bottomMargin = sprite5.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite5.anchors.bottomMargin =sprite5.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite6
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*6
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[6]+".png"
            MouseArea {
                anchors.fill: sprite6
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite6.anchors.bottomMargin = sprite6.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite6.anchors.bottomMargin =sprite6.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite7
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*7
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[7]+".png"
            MouseArea {
                anchors.fill: sprite7
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite7.anchors.bottomMargin = sprite7.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite7.anchors.bottomMargin =sprite7.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite8
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*8
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[8]+".png"
            MouseArea {
                anchors.fill: sprite8
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite8.anchors.bottomMargin = sprite8.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite8.anchors.bottomMargin =sprite8.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite9
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*9
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[9]+".png"
            MouseArea {
                anchors.fill: sprite9
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite9.anchors.bottomMargin = sprite9.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite9.anchors.bottomMargin =sprite9.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }


        TexturePackerAnimatedSprite {
            id: sprite10
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*10
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[10]+".png"
            MouseArea {
                anchors.fill: sprite10
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite10.anchors.bottomMargin = sprite10.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite10.anchors.bottomMargin =sprite10.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }
        }

        TexturePackerAnimatedSprite {
            id: sprite11
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*11
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[11]+".png"
            MouseArea {
                anchors.fill: sprite11
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite11.anchors.bottomMargin = sprite11.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite11.anchors.bottomMargin =sprite11.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite12
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*12
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[12]+".png"
            MouseArea {
                anchors.fill: sprite12
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite12.anchors.bottomMargin = sprite12.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite12.anchors.bottomMargin = sprite12.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite13
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*13
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[13]+".png"
            MouseArea {
                anchors.fill: sprite13
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite13.anchors.bottomMargin = sprite13.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite13.anchors.bottomMargin = sprite13.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite14
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*14
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[14]+".png"
            MouseArea {
                anchors.fill: sprite14
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite14.anchors.bottomMargin = sprite14.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite14.anchors.bottomMargin = sprite14.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite15
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*15
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[15]+".png"
            MouseArea {
                anchors.fill: sprite15
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite15.anchors.bottomMargin = sprite15.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite15.anchors.bottomMargin = sprite15.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite16
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*16
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[16]+".png"
            MouseArea {
                anchors.fill: sprite16
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite16.anchors.bottomMargin = sprite16.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite16.anchors.bottomMargin = sprite16.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite17
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*17
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[17]+".png"
            MouseArea {
                anchors.fill: sprite17
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite17.anchors.bottomMargin = sprite17.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite17.anchors.bottomMargin = sprite17.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite18
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*18
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[18]+".png"
            MouseArea {
                anchors.fill: sprite18
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite18.anchors.bottomMargin = sprite18.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite18.anchors.bottomMargin = sprite18.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }

        TexturePackerAnimatedSprite {
            id: sprite19
            width: parent.width/10
            height: parent.height/4.2
            visible: true
            anchors.left: bgImage.left
            anchors.leftMargin: parent.width/4.6 + 55*19
            anchors.bottom:  bgImage.bottom
            anchors.bottomMargin: 35
            source: "../assets/pokersImage.json"
            frameNames: shouPai.ShouPaiQml[19]+".png"
            MouseArea {
                anchors.fill: sprite19
                property int flag: 1
                onClicked:
                {
                    if(flag == 1){
                        sprite19.anchors.bottomMargin = sprite19.anchors.bottomMargin+50;
                        flag = 0;
                    }else if(flag == 0)
                    {
                        sprite19.anchors.bottomMargin = sprite19.anchors.bottomMargin-50;
                        flag = 1;
                    }
                }
            }

        }
    }
}


