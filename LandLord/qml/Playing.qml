import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ControlQml 1.0


Item{
    id: item
    visible: false


    property var shouPai:JSON.parse(sprites.controlQml.showShouPai())
    property var dzPai:JSON.parse(sprites.controlQml.showDiZhuPaiQu())
    property var cpQu0:JSON.parse(sprites.controlQml.showChuPaiQu0())
    property var cpQu1:JSON.parse(sprites.controlQml.showChuPaiQu1())
    property var cpQu2:JSON.parse(sprites.controlQml.showChuPaiQu2())
    //    property var shuaXin : shouPai

    //    property var shuaXin
    BackgroundImage {
        id: bgImage
        //背景精灵
        TexturePackerAnimatedSprite {
            id:texturebg1
            source: "../assets/bgImage-1.json"
            frameNames: "bg06.png"
            anchors.fill: parent
        }
        anchors.fill: parent
    }


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
        anchors.leftMargin: parent.height/8
        anchors.verticalCenter: parent.verticalCenter
    }
    //李四牌背面
    Image {
        id: paibeiImage2
        scale: 0.3
        source: "qrc:/images/pukepai/paibei-1.png"
        anchors.right: parent.right
        anchors.rightMargin: parent.height/8
        anchors.verticalCenter: parent.verticalCenter
    }

    Sprites{
        id: sprites
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
                    sprites.dizhupaiqubei.opacity=0
                    sprites.dizhupaiqu.visible=true
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

    function shuaXin()
    {
//        console.log("shuaXin")
//        console.log(sprites.controlQml.showShouPaiNum())
        if(sprites.controlQml.showShouPaiNum()==0)
        {
            sprites.sprite0.frameNames = "";
//            sprites.mouseArea0.flag=1;
            sprites.sprite1.frameNames = "";
            sprites.sprite2.frameNames = "";
            sprites.sprite3.frameNames = "";
            sprites.sprite4.frameNames = "";
            sprites.sprite5.frameNames = "";
            sprites.sprite6.frameNames = "";
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==1)
        {
            sprites.sprite1.frameNames = "";
            sprites.sprite2.frameNames = "";
            sprites.sprite3.frameNames = "";
            sprites.sprite4.frameNames = "";
            sprites.sprite5.frameNames = "";
            sprites.sprite6.frameNames = "";
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==2)
        {
            sprites.sprite2.frameNames = "";
            sprites.sprite3.frameNames = "";
            sprites.sprite4.frameNames = "";
            sprites.sprite5.frameNames = "";
            sprites.sprite6.frameNames = "";
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==3)
        {
            sprites.sprite3.frameNames = "";
            sprites.sprite4.frameNames = "";
            sprites.sprite5.frameNames = "";
            sprites.sprite6.frameNames = "";
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==4)
        {
            sprites.sprite4.frameNames = "";
            sprites.sprite5.frameNames = "";
            sprites.sprite6.frameNames = "";
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==5)
        {
            sprites.sprite5.frameNames = "";
            sprites.sprite6.frameNames = "";
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==6)
        {
            sprites.sprite6.frameNames = "";
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==7)
        {
            sprites.sprite7.frameNames = "";
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==8)
        {
            sprites.sprite8.frameNames = "";
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==9)
        {
            sprites.sprite9.frameNames = "";
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==10)
        {
            sprites.sprite10.frameNames = "";
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==11)
        {
            sprites.sprite11.frameNames = "";
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==12)
        {
            sprites.sprite12.frameNames = "";
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==13)
        {
            sprites.sprite13.frameNames = "";
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==14)
        {
            sprites.sprite14.frameNames = "";
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==15)
        {
            sprites.sprite15.frameNames = "";
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==16)
        {
            sprites.sprite16.frameNames = "";
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==17)
        {
            sprites.sprite17.frameNames = "";
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==18)
        {
            sprites.sprite18.frameNames = "";
            sprites.sprite19.frameNames = "";
        }else if(sprites.controlQml.showShouPaiNum()==19)
        {
            sprites.sprite19.frameNames = "";
        }
    }



    //不出按钮
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
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    chupaiButton.visible = false;
                    buchupaiButton.visible = false;

                    //                    console.log(JSON.stringify(shouPai));

                    sprites.shouPai = JSON.parse(sprites.controlQml.showShouPai());

                    sprites.controlQml.chuPai();
                    sprites.cpQu0 = JSON.parse(sprites.controlQml.showChuPaiQu0());
                    shuaXin();

                    sprites.controlQml.pcChuPai();
                    sprites.cpQu1 = JSON.parse(sprites.controlQml.showChuPaiQu1());
                    sprites.cpQu2 = JSON.parse(sprites.controlQml.showChuPaiQu2());

                    sprites.shouPai = JSON.parse(sprites.controlQml.showShouPai());


                    //                    sprites.sprite19.xuHao = -1/* sprites.shouPai[19].shouPai*/;
                }
            }
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
    //back
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
    //背景切换
    Image {
        id: skin1
        source: "qrc:/images/icons/down.png"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 40
        MouseArea{
            id:skinmouse1
            anchors.fill: parent
            property int count: 0
            onClicked: {
                count++
                if(count==1)
                    texturebg1.frameNames = "bg01.jpg"
                if(count==2)
                    texturebg1.frameNames="bg02.jpg"
                if(count==3){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg03.jpg"
                }
                if(count==4){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg04.jpg"
                }
                if(count==5){
                    texturebg1.source= "../assets/bgImage-3.json"
                    texturebg1.frameNames = "bg05.jpg"
                }
                if(count>5){
                    count=5
                }
            }
        }
    }

    Image {
        id: skin2
        source: "qrc:/images/icons/up.png"
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.bottom: skin1.top
        anchors.bottomMargin: 5
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(skinmouse1.count==1){
                    texturebg1.frameNames="bg06.png"
                    skinmouse1.count=0
                }
                if(skinmouse1.count==2){
                    texturebg1.frameNames = "bg01.jpg"
                    skinmouse1.count=1
                }
                if(skinmouse1.count==3){
                    texturebg1.source="../assets/bgImage-1.json"
                    texturebg1.frameNames = "bg02.jpg"
                    skinmouse1.count=2
                }
                if(skinmouse1.count==4){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg03.jpg"
                    skinmouse1.count=3
                }
                if(skinmouse1.count==5){
                    texturebg1.source= "../assets/bgImage-2.json"
                    texturebg1.frameNames = "bg04.jpg"
                    skinmouse1.count=4
                }

            }
        }
    }




}
/*
    //        //player0的出牌区
    //        TexturePackerAnimatedSprite {
    //            id:player0sprite0
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*1
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[0].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite1
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*2
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[1].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite2
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*3
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[2].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite3
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*4
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[3].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite4
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*5
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[4].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite5
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*6
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[5].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite6
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*7
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[6].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite7
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*8
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[7].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite8
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*9
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[8].daChuPai0+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player0sprite9
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/3 + 50*10
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 100+parent.height/5
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu0[9].daChuPai0+".png"
    //        }

    //        //player1的出牌区
    //        TexturePackerAnimatedSprite {
    //            id: player1sprite0
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[0].daChuPai1+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player1sprite1
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[1].daChuPai1+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player1sprite2
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*2
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[2].daChuPai1+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player1sprite3
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*3
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[3].daChuPai1+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player1sprite4
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*4
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[4].daChuPai1+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id:player1sprite5
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*5
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[5].daChuPai1+".png"
    //        }


    //        TexturePackerAnimatedSprite {
    //            id: player1sprite6
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*6
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[6].daChuPai1+".png"
    //        }


    //        TexturePackerAnimatedSprite {
    //            id: player1sprite7
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*7
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[7].daChuPai1+".png"
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: player1sprite8
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*8
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[8].daChuPai1+".png"
    //        }


    //        TexturePackerAnimatedSprite {
    //            id: player1sprite9
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/6.1+45*9
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu1[9].daChuPai1+".png"
    //        }

    //        //player2的出牌区
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite0
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*9
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[0].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite1
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*8
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[1].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite2
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*7
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[2].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite3
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*6
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[3].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite4
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*5
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[4].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite5
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*4
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[5].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite6
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*3
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[6].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite7
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*2
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[7].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite8
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1+45*1
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[8].daChuPai2+".png"
    //        }
    //        TexturePackerAnimatedSprite {
    //            id: player2sprite9
    //            width: parent.width/14.5
    //            height: parent.height/6
    //            visible: true
    //            anchors.right: bgImage.right
    //            anchors.rightMargin: parent.width/6.1
    //            anchors.bottom: parent.bottom
    //            anchors.bottomMargin: parent.height/2
    //            source: "../assets/pokersImage.json"
    //            frameNames: cpQu2[9].daChuPai2+".png"
    //        }

    //        //手牌区
    //        TexturePackerAnimatedSprite {
    //            id: sprite0
    //            property var xuHao: shouPai[0].shouPai
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6
    //            anchors.bottom:  bgImage.bottom
    //            //            anchors.bottomMargin: 80
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: xuHao+".png"

    //            MouseArea {
    //                anchors.fill: sprite0
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        //                        console.log(shouPai[19].shouPai);
    //                        sprite0.anchors.bottomMargin = sprite0.anchors.bottomMargin+50;
    //                        controlQml.SetXuanZePai(sprite0.xuHao);
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite0.anchors.bottomMargin =sprite0.anchors.bottomMargin-50;
    //                        controlQml.RmXuanZePai(sprite0.xuHao);
    //                        flag = 1;

    //                        //                        shouPai=JSON.parse(controlQml.showShouPai());
    //                        //                        controlQml.setShouPai(19,53);
    //                        //                        shouPai[19].shouPai = 53
    //                        //                        console.log(shouPai[19].shouPai);
    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite1
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames:  shouPai[1].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite1
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite1.anchors.bottomMargin = sprite1.anchors.bottomMargin+50;
    //                        flag = 0;

    //                    }else if(flag == 0)
    //                    {
    //                        sprite1.anchors.bottomMargin = sprite1.anchors.bottomMargin-50;
    //                        flag = 1;

    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite2
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*2
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames:  shouPai[2].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite2
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite2.anchors.bottomMargin = sprite2.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite2.anchors.bottomMargin =sprite2.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite3
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*3
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames:  shouPai[3].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite3
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite3.anchors.bottomMargin = sprite3.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite3.anchors.bottomMargin =sprite3.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite4
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*4
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[4].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite4
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite4.anchors.bottomMargin = sprite4.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite4.anchors.bottomMargin =sprite4.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite5
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*5
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[5].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite5
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite5.anchors.bottomMargin = sprite5.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite5.anchors.bottomMargin =sprite5.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }


    //        TexturePackerAnimatedSprite {
    //            id: sprite6
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*6
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[6].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite6
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite6.anchors.bottomMargin = sprite6.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite6.anchors.bottomMargin =sprite6.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }


    //        TexturePackerAnimatedSprite {
    //            id: sprite7
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*7
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[7].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite7
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite7.anchors.bottomMargin = sprite7.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite7.anchors.bottomMargin =sprite7.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite8
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*8
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[8].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite8
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite8.anchors.bottomMargin = sprite8.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite8.anchors.bottomMargin =sprite8.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }


    //        TexturePackerAnimatedSprite {
    //            id: sprite9
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*9
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[9].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite9
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite9.anchors.bottomMargin = sprite9.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite9.anchors.bottomMargin =sprite9.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite10
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*10
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[10].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite10
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite10.anchors.bottomMargin = sprite10.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite10.anchors.bottomMargin =sprite10.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }
    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite11
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*11
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[11].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite11
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite11.anchors.bottomMargin = sprite11.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite11.anchors.bottomMargin =sprite11.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite12
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*12
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[12].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite12
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite12.anchors.bottomMargin = sprite12.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite12.anchors.bottomMargin = sprite12.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite13
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*13
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[13].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite13
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite13.anchors.bottomMargin = sprite13.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite13.anchors.bottomMargin = sprite13.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite14
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*14
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[14].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite14
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite14.anchors.bottomMargin = sprite14.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite14.anchors.bottomMargin = sprite14.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite15
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*15
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[15].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite15
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite15.anchors.bottomMargin = sprite15.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite15.anchors.bottomMargin = sprite15.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite16
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*16
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[16].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite16
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite16.anchors.bottomMargin = sprite16.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite16.anchors.bottomMargin = sprite16.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite17
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*17
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[17].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite17
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite17.anchors.bottomMargin = sprite17.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite17.anchors.bottomMargin = sprite17.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite18
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*18
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[18].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite18
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite18.anchors.bottomMargin = sprite18.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite18.anchors.bottomMargin = sprite18.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }

    //        TexturePackerAnimatedSprite {
    //            id: sprite19
    //            width: parent.width/10
    //            height: parent.height/4.2
    //            //            property var xuHao: shouPai[19].shouPai
    //            visible: true
    //            anchors.left: bgImage.left
    //            anchors.leftMargin: parent.width/4.6 + 55*19
    //            anchors.bottom:  bgImage.bottom
    //            anchors.bottomMargin: 35
    //            source: "../assets/pokersImage.json"
    //            frameNames: shouPai[19].shouPai+".png"
    //            MouseArea {
    //                anchors.fill: sprite19
    //                property int flag: 1
    //                onClicked:
    //                {
    //                    if(flag == 1){
    //                        sprite19.anchors.bottomMargin = sprite19.anchors.bottomMargin+50;
    //                        flag = 0;
    //                    }else if(flag == 0)
    //                    {
    //                        sprite19.anchors.bottomMargin = sprite19.anchors.bottomMargin-50;
    //                        flag = 1;
    //                    }
    //                }
    //            }

    //        }
//}
*/


