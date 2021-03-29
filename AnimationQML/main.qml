import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3

//************************************INTERFACE**********************************************
Window {
    id: topWindows
    visible: true
    width: 1920
    height: 1000
    title: qsTr("Animation")

    Item {
        Row {
            x: 162
            y: 185
            spacing: 2
            Repeater{
                id:barreDuHaut
                model: 12
                Rectangle {
                    id: rectanglePetitHaut
                    width: 130
                    height: 150
                    color: "#ffffff"
                    border.color: "red"
                    Text {
                        id: element3
                        text: qsTr("G" + (index+1))
                        font.pixelSize: 20
                        }
                    }
                }
            }
            Row {
                x: 162
                y: 684
                spacing: 2
                Repeater{
                     id:barreDuBas
                     model: 12

                    Rectangle {
                        id: rectanglePetitBas
                        width: 130
                        height: 150
                        color: "#ffffff"
                        border.color: "red"
                        Text {
                            id: element4
                            text: qsTr("D" + (index+1))
                            font.pixelSize: 20
                        }
                    }
                }
            }
    }
    Text {
        id: element
        x: 0
        y: 0
        width: parent.width
        height: 200
        text: qsTr("BIENVENUE !      ALLEZ PLACE N°")
        font.pixelSize: 106
    }
    Rectangle {
        id: rectangleEntre
        x: 0
        y: 415
        width: 57
        height: 181
        color: "#ffffff"
        border.color: "black"

        Text {
            id: element1
            x: -33
            y: 70
            color: "blue"
            text: qsTr("ENTRÉE")
            rotation: 90
            font.pixelSize: 35
        }
    }
    Rectangle {
        id: rectangleSortie
        x: 1863
        y: 410
        width: 57
        height: 181
        color: "#ffffff"
        border.color: "black"

    }
    Text {
        id: element2
        x: 1832
        y: 480
        color: "red"
        text: qsTr("SORTIE")
        rotation: -90
        font.pixelSize: 35
    }
    Rectangle {
        id: grandeBarre
        x: 0
        y: 152
        width: 1920
        height: 2
        color: "#000000"
    }
    Image {
        id: monImage
        x: 159
        y:465
        source: "voitureorange.png"
        width: 130
        height: 70
        transformOrigin: Item.Center
        scale: 1
        Behavior on x { PropertyAnimation { duration: 1000 } }
        Behavior on y { PropertyAnimation { duration: 1000 } }
        Behavior on rotation { PropertyAnimation { duration: 1000 } }
    }
//************************************ANIMATION**********************************************
    Connections {
        target: monObjet
        onMonSignalTranslation: {
            monImage.x = 159 + coordonnees;
            if( x <= 12){
                timer1.running=true;
            }
            else if(x > 12){
                timer2.running=true;
            }
        }
    }
    Connections {
        target: monObjet
        onMonSignalRotation: {
            monImage.rotation = angle;  //maRotation.to = angle;
            if( x <= 12){
                timer3.running=true;
            }
            else if(x > 12){
                timer4.running=true;
            }
        }
    }
    Connections {
        target: monObjet
        onMonSignalMiniTranslation: {
            monImage.y = coordonnees;
        }
    }
        Timer{
            id:timer1
            interval: 1000; running: false; repeat: false;
            onTriggered: monObjet.tournerP90(x);
            }
        Timer{
            id:timer2
            interval: 1000; running: false; repeat: false;
            onTriggered: monObjet.tournerM90(x);
            }
        Timer{
            id:timer3
            interval: 1000; running: false; repeat: false;
            onTriggered: monObjet.miniHtranslater(x);
            }        
        Timer{
            id:timer4
            interval: 1000; running: false; repeat: false;
            onTriggered: monObjet.miniBtranslater(x);
            }
//********************************************************************************************************************
//    Rectangle {
//        id: bouton1
//        width: 180
//        height: 55
//        x: 200
//        y: (topWindows.height - bouton1.height)
//        color: "green"
//        Text {
//            id: textBouton1
//            text: qsTr("Déplacer")
//            anchors.centerIn: parent
//        }
//        MouseArea {
//            anchors.fill: parent
//            onClicked: { monObjet.translater();}
//        }
//    }
//    Rectangle {
//        id: bouton2
//        width: 180
//        height: 55
//        x: 500
//        y: (topWindows.height - bouton2.height)
//        color: "green"
//        Text {
//            id: textBouton2
//            text: qsTr("Rotation 90")
//            anchors.centerIn: parent
//        }
//        MouseArea {
//            anchors.fill: parent
//            onClicked: { monObjet.tournerP90();}
//        }
//    }
//    Rectangle {
//        id: bouton3
//        width: 180
//        height: 55
//        x: 800
//        y: (topWindows.height - bouton2.height)
//        color: "green"
//        Text {
//            id: textBouton3
//            text: qsTr("Rotation -90")
//            anchors.centerIn: parent
//        }
//        MouseArea {
//            anchors.fill: parent
//            onClicked: { monObjet.tournerM90();}
//        }
//    }
//    Rectangle {
//        id: bouton4
//        width: 180
//        height: 55
//        x: 1100
//        y: (topWindows.height - bouton2.height)
//        color: "green"
//        Text {
//            id: textBouton4
//            text: qsTr("Monter")
//            anchors.centerIn: parent
//        }
//        MouseArea {
//            anchors.fill: parent
//            onClicked: { monObjet.miniHtranslater();}
//        }
//    }
//    Rectangle {
//        id: bouton5
//        width: 180
//        height: 55
//        x: 1400
//        y: (topWindows.height - bouton2.height)
//        color: "green"
//        Text {
//            id: textBouton5
//            text: qsTr("Descendre")
//            anchors.verticalCenterOffset: 0
//            anchors.horizontalCenterOffset: 1
//            anchors.centerIn: parent
//        }
//        MouseArea {
//            anchors.fill: parent
//            onClicked: { monObjet.miniBtranslater();}
//        }
//    }


//    Rectangle {
//        id: grandeFleche
//        x: 40
//        y: 282
//        width: 540
//        height: 10
//        color: "black"
//    }

//    Rectangle {
//        id: petiteFleche
//        x: 572
//        y: 187
//        width: 10
//        height: 100
//        color: "#000000"
//        anchors.top: grandeFleche.right
//        transform: [
//            Translate{
//                y: petiteFleche.height/2
//            }
//            Rotation/*Animation on rotation*/ {
//                origin.x:petiteFleche.width/2
//                origin.y:petiteFleche.height
//                loops: Animation.Infinite
//                from: 0
//                to: 180
//                angle:180
//            }
//        ]
//    }
}


/*##^##
Designer {
    D{i:12;anchors_x:14;anchors_y:16}
}
##^##*/
