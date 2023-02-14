import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtQuick 2.3
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick 2.0
import QtQuick.Controls 2.12
import Sleep 1.0


Rectangle {
    width: 390
    height: 844
    color: "#B4D2A9"
    id: sleepScreen
    property int sleepHoursNum: 0
    property int qualitySleepNum: 0
    property int sleepBar1: 8

    Sleep {
        id: myClass
    }

    Button {
        id: menuButton
        text: "\u2630"
        onClicked: {
            menu.open()
        }
        Menu {
            id: menu
            y: menuButton.height

            MenuItem {
                text: "Sleep"
                onClicked: stack.push("SleepPage.qml")

            }

            MenuItem {
                text: "Meal"
                onClicked: stack.push("MealPage.qml")
            }
            MenuItem {
                text: "Workout"
                onClicked: stack.push("WorkoutPage.qml")
            }
            MenuItem {
                text: "To-Do List"
                onClicked: stack.push("ToDoPage.qml")
            }
            MenuItem {
                text: "Settings"
                onClicked: stack.push("SettingsPage.qml")
            }
        }

    }

    Text {
        id: weekdayDate

        font.pointSize: 27;
        font.bold: true;
        //font.family: "Droid Sans Mono";
        property string weekday: Qt.formatDate(new Date(), "dddd")
        text: weekday.toUpperCase();
        anchors.left: sleepScreen.left
        anchors.leftMargin: 10

        anchors.top: menuButton.bottom
        anchors.topMargin: 32


    }

    Text {
        id: fullDate
        property string date: Qt.formatDate(new Date(), "MMM" + " " + "d" + ", " + "yyyy")
        text: date;
        font.pointSize: 15;
        font.bold: true;
        anchors.left: sleepScreen.left
        anchors.leftMargin: 13

        anchors.top: weekdayDate.bottom
        anchors.topMargin: 10


    }

    Text {
        id: thisWeek
        text: "This week"
        font.pointSize: 16;
        font.bold: true;
        anchors.left: sleepScreen.left
        anchors.leftMargin: 22
        anchors.bottom: sleepScreen.bottom
        anchors.bottomMargin: 208
    }
    Rectangle {
        id: recentSleep1
        radius: 200
        height: 17
        width: 22*parseInt(myClass.newestSleep)
        color: "black"

        anchors.left: sleepScreen.left
        anchors.leftMargin: 22
        anchors.bottom: sleepScreen.bottom
        anchors.bottomMargin: 175



    }

    Rectangle {
        id: recentSleep2
        radius: 200
        height: 17
        width: 140              // WILL BE VARIABLE LENGTH WITH C++ CODE
        color: "lightslategrey"

        anchors.left: sleepScreen.left
        anchors.leftMargin: 22
        anchors.bottom: sleepScreen.bottom
        anchors.bottomMargin: 145
    }

    Rectangle {
        id: recentSleep3
        radius: 200
        height: 17
        width: 110              // WILL BE VARIABLE LENGTH WITH C++ CODE
        color: "white"

        anchors.left: sleepScreen.left
        anchors.leftMargin: 22
        anchors.bottom: sleepScreen.bottom
        anchors.bottomMargin: 115

    }

    Text {
        id: recentSleepValue1
        text: myClass.newestSleep + " hr"
        font.pointSize: 14
        color:"grey"
        font.bold: true;

        anchors.left: recentSleep1.right
        anchors.leftMargin: 10
        anchors.verticalCenter: recentSleep1.verticalCenter
    }

    Text {
        id: recentSleepValue2
        text: "6 hr"         // WILL CHANGE WITH C++ CODE
        font.pointSize: 14
        color:"grey"
        font.bold: true;

        anchors.left: recentSleep2.right
        anchors.leftMargin: 10
        anchors.verticalCenter: recentSleep2.verticalCenter
    }

    Text {
        id: recentSleepValue3
        text: "5hr";//myClass.someVar;        // WILL CHANGE WITH C++ CODE
        font.pointSize: 14
        color:"grey"
        font.bold: true;

        anchors.left: recentSleep3.right
        anchors.leftMargin: 10
        anchors.verticalCenter: recentSleep3.verticalCenter
    }


    Button {
        id: logNewSleep
        height: 50; width: 200
        anchors.horizontalCenter: sleepScreen.horizontalCenter
        anchors.bottom: sleepScreen.bottom
        anchors.bottomMargin: 260

        onClicked: logSleepPopup.show()



        contentItem: Text{
            text: "Log Last Night"
            font.pointSize: 15
            font.bold: true

            color: logNewSleep.down ? "#8B9257":"white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

        }
        background :Rectangle{
            color: logNewSleep.down ? "black":"darkolivegreen"
            radius: 5
        }
    }

    Window {
        id: logSleepPopup
        width: 350
        height: 200

        x:20
        y: 310
        color: "darkolivegreen"
        Text{
            text: "Log Last Night"
            font.pointSize: 15
            font.bold: true
            color: "white"
            x: 120
            y:27

        }

        Text{
            text: "Sleep Hours:"
            font.pointSize: 13
            font.bold: true
            color: "white"
            x: 40
            y:75

        }

        Text{
            text: "Sleep Quality:"
            font.pointSize: 13
            font.bold: true
            color: "white"
            x: 40
            y:120

        }

        Text{
            text: sleepHoursNum.toString()
            font.pointSize: 13
            font.bold: true
            color: "white"
            x: 145
            y:75
        }

        Text{
            text: qualitySleepNum.toString()+"/5"
            font.pointSize: 13
            font.bold: true
            color: "white"
            x: 145
            y:120
        }

        Button {
            id: addSleepHoursButton
            x:250
            y:65
            height:30
            width:53

            onClicked: {
                if (sleepHoursNum < 12)
                    sleepScreen.sleepHoursNum += 1
            }
            contentItem: Text{
                text: "+"
                font.pointSize: 25
                color: addSleepHoursButton.down ? "white":"white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

            }

            background: Rectangle {
                    color: addSleepHoursButton.down ? "black" : "black"
                    radius:2
                    border.color: "lightslategray"
                    border.width: 0.5
            }
        }

        Button {
            id: minusSleepHoursButton
            x:197
            y:65
            height:30
            width:53
            onClicked: {
                if (sleepHoursNum > 0)
                    sleepScreen.sleepHoursNum -= 1
            }
            contentItem: Text{
                text: "-"
                font.pointSize: 25
                color: minusSleepHoursButton.down ? "white":"white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

            }

            background: Rectangle {
                    color: minusSleepHoursButton.down ? "black" : "black"
                    radius:2
                    border.color: "lightslategray"
                    border.width: 0.5
            }
        }


        Button {
            id: addSleepQualityButton
            x:250
            y:110
            height:30
            width:53
            onClicked: {
                if (qualitySleepNum < 5)
                    sleepScreen.qualitySleepNum += 1
            }
            contentItem: Text{
                text: "+"
                font.pointSize: 25
                color: addSleepQualityButton.down ? "white":"white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

            }

            background: Rectangle {
                    color: addSleepQualityButton.down ? "black" : "black"
                    radius:2
                    border.color: "lightslategray"
                    border.width: 0.5
            }
        }

        Button {
            id: minusleepQualityButton
            x:197
            y:110
            height:30
            width:53
            onClicked: {
                if (qualitySleepNum > 0)
                    sleepScreen.qualitySleepNum -= 1
            }


            contentItem: Text{
                text: "-"
                font.pointSize: 25
                color: minusleepQualityButton.down ? "white":"white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

            }

            background: Rectangle {
                    color: minusleepQualityButton.down ? "black" : "black"
                    radius:2
                    border.color: "lightslategray"
                    border.width: 0.5
            }
        }

        Button {
            id:closeButton
            y:164
            x:93
            width:90
            height:40
            text:"Cancel"
            onClicked: logSleepPopup.close()
        }

        Button {
            id:confirmButton
            y:164
            x:171
            width:90
            height:40
            text:"Confirm"
            onClicked: {

                logSleepPopup.close()
                myClass.setNewestSleep(sleepHoursNum.toString())
                myClass.setWeeklySleep(sleepHoursNum)


                myClass.setNewestSleepQual(qualitySleepNum.toString())
                myClass.setWeeklySleepQuality(qualitySleepNum/5)
                sleepHoursNum = 0
                qualitySleepNum = 0

            }
        }
    }


    Rectangle {
        id: lastNightCircle1
        height:27
        width:27
        radius:20
        color: "black"

        anchors.left: sleepScreen.left
        anchors.leftMargin: 60

        anchors.bottom: logNewSleep.top
        anchors.bottomMargin: 60

    }

    Text {
        id: lastNightSleepNum
        text: myClass.newestSleep + "hr"
        color: "black"
        font.bold: true;
        font.pointSize: 22

        anchors.left: sleepScreen.left
        anchors.leftMargin:100
        anchors.bottom: logNewSleep.top
        anchors.bottomMargin: 67
    }

    Text {
        id: lastNight
        text: "Last Night"
        color: "black"
        font.bold: true;
        font.pointSize: 14

        anchors.left: sleepScreen.left
        anchors.leftMargin:82
        anchors.bottom: logNewSleep.top
        anchors.bottomMargin: 41
    }

    Rectangle {
        id: lastNightCircle2
        height:27
        width:27
        radius:20
        color: "black"

        anchors.right: sleepScreen.right
        anchors.rightMargin: 100

        anchors.bottom: logNewSleep.top
        anchors.bottomMargin: 65

    }

    Text {
        id: qualityNum
        text: myClass.newestSleepQual+"/5"
        color: "black"
        font.bold: true;
        font.pointSize: 22

        anchors.right: sleepScreen.right
        anchors.rightMargin:60
        anchors.bottom: logNewSleep.top
        anchors.bottomMargin: 70
    }

    Text {
        id: quality
        text: "Qualilty"
        color: "black"
        font.bold: true;
        font.pointSize: 14

        anchors.right: sleepScreen.right
        anchors.rightMargin:50
        anchors.bottom: logNewSleep.top
        anchors.bottomMargin: 45
    }

    Text {
        id: goalPercentage
        text: "80%"                 // will change
        font.bold: true;
        font.pointSize: 35
        z: 1

        anchors.horizontalCenter: sleepScreen.horizontalCenter
        anchors.bottom: goalText.top
        anchors.bottomMargin: 0
    }

    Text {
        id: goalText
        text: "Goal"
        color: "black"
        font.bold: true;
        font.pointSize: 35
        z: 1

        anchors.horizontalCenter: sleepScreen.horizontalCenter
        anchors.top: sleepScreen.top
        anchors.topMargin: 275
    }


    CircularProgressBar {
                id: progress
                lineWidth: 17
                value: 0.8
                size: 275
                secondaryColor: "olivedrab"
                primaryColor: "darkolivegreen"
                anchors.horizontalCenter: sleepScreen.horizontalCenter
                anchors.top: sleepScreen.top
                anchors.topMargin: 142
    }


   Image {

       id: sleepingPic
       source: "sleeping.png"
       width:55
       height:55
       anchors.top: fullDate.bottom
       anchors.topMargin:0
       anchors.left: sleepScreen.left
       anchors.leftMargin: 12

    }

   Image {
       id: moonPic
       source: "moon.png"
       width:90
       height:90

       anchors.right: sleepScreen.right
       anchors.rightMargin: 15
       anchors.top: sleepScreen.top
       anchors.topMargin: 80

   }

   HeaderBar {
       id: headerBar
   }


}
