import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.4
import Event 1.0
import QtQuick.LocalStorage
import Qt.labs.settings

Rectangle {
    id: dailyview
    visible: true
    color: "#B4D2A9"

    DataBase {
        id: db
    }

    Event{
        id: myEvent
    }



    Item{
        id:variables
        property string name: Appointment.name
        property string group: Appointment.group
        property string endTime: Appointment.endTime
        property string startTime: Appointment.startTime
    }


    Row{//Row for weekday letters
        id: weekRow

        height: 20
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }


        Text {
            id: sundayText
            width: dailyview.width/7
            text: "S"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter

        }
        Text {
            id: mondayText
            width: dailyview.width/7
            text: "M"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter


        }
        Text {
            id: tuesdayText
            width: dailyview.width/7
            text: "T"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter


        }
        Text {
            id: wednesdayText
            width: dailyview.width/7
            text: "W"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter


        }
        Text {
            id: thursdayText
            width: dailyview.width/7
            text: "T"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter


        }
        Text {
            id: fridayText
            width: dailyview.width/7
            text: "F"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter


        }
        Text {
            id: saturdayText
            width: dailyview.width/7
            text: "S"
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter


        }
    }

    Row {// Row for weekday bubbles

        id: dateRow

        spacing: 0
        anchors {
            top: weekRow.bottom
            horizontalCenter: parent.horizontalCenter
        }

        RoundButton{
        id:buttonr1c1

            contentItem: Text{
                text:"1"
                font.pointSize: 15
                color: buttonr1c1.down ? "#8B9257":"black" //Changes on click
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                    color: buttonr1c1.down ? "black":"#8B9257"
                    implicitHeight: 40
                    implicitWidth: 40
                    radius: 360
            }
        }
        RoundButton{
            id:buttonr1c2
            contentItem: Text{
                text:"2"
                font.pointSize: 15
                color: buttonr1c2.down ? "#8B9257":"black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                    color: buttonr1c2.down ? "black":"#8B9257"
                    implicitHeight: 40
                    implicitWidth: 40
                    radius: 360
            }
        }
        RoundButton{
            id: buttonr1c3
            contentItem: Text{
                text:"3"
                font.pointSize: 15
                color: buttonr1c3.down ? "#8B9257":"black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                    color: buttonr1c3.down ? "black":"#8B9257"
                    implicitHeight: 40
                    implicitWidth: 40
                    radius: 360
            }
        }
        RoundButton{
            id:buttonr1c4
            contentItem: Text{
                text:"4"
                font.pointSize: 15
                color: buttonr1c4.down ? "#8B9257":"black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                    color: buttonr1c4.down ? "black":"#8B9257"
                    implicitHeight: 40
                    implicitWidth: 40
                    radius: 360
            }
        }
        RoundButton{
            id:buttonr1c5
            contentItem: Text{
                text:"5"
                font.pointSize: 15
                color: buttonr1c5.down ? "#8B9257":"black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                    color: buttonr1c5.down ? "black":"#8B9257"
                    implicitHeight: 40
                    implicitWidth: 40
                    radius: 360
            }
        }
        RoundButton{
            id:buttonr1c6
            contentItem: Text{
                text:"6"
                font.pointSize: 15
                color: buttonr1c6.down ? "#8B9257":"black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                    color: buttonr1c6.down ? "black":"#8B9257"
                    implicitHeight: 40
                    implicitWidth: 40
                    radius: 360
            }
        }
        RoundButton{
            id:buttonr1c7
            contentItem: Text{
                text:"7"
                font.pointSize: 15
                color: buttonr1c7.down ? "#8B9257":"black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                    color: buttonr1c7.down ? "black":"#8B9257"
                    implicitHeight: 40
                    implicitWidth: 40
                    radius: 360
            }
        }
    }//Row

    Rectangle{
        id: dayRec
         height: 550
         width: 300
         color: "#B4D2A9"
         border.color:"black"
         radius: 40
         border.width: 3
         anchors {
             top: dateRow.bottom
             horizontalCenter: parent.horizontalCenter
             bottom: addEvent.top
         }
         ScrollView {
             Settings {
                 id: settings
             property list<QtObject> appList
             }

             Component.onCompleted: {

                 for (let i = 0; i < settings.appList.length(); i++) {
                     append(i.name)
                 }
             }
         }


    }

//    Rectangle{
//        id: testEvent
//        color: "#737B4A"
//        x: parent.x
//        radius: 10

//        implicitHeight: 37* (myEvent.getEndTime(variables.endTime)-myEvent.getStartTime(variables.startTime))
//        implicitWidth: dayRec.width - 6

//        anchors{
//            right: dayRec.right
//            top: dateRow.bottom
//            topMargin: 25 + 37* (myEvent.getStartTime(variables.startTime)-6)
//            rightMargin: 3
//            leftMargin: 3

//        }

//        Text{
//            text: variables.name + " - " + variables.group
//            color:"black"
//            anchors{
//                left: parent.left
//                leftMargin: 3
//                top: parent.top
//                topMargin: 5

//            }
//        }
//        Text{
//            text: variables.startTime + " - " + variables.endTime
//            color: "black"
//            font.pointSize: 10

//            anchors{
//                right: parent.right
//                rightMargin: 3
//                top: parent.top
//                topMargin: 5
//            }
//        }

//        Connections{
//            target: Appointment
//        }
//    }


    RoundButton{
        id:addEvent
        height: 40; width: 200
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: dailyview.bottom

        }

        onClicked: stack.push("Event.qml")


        contentItem: Text{
            text: "Add Event"
            font.pointSize: 15
            color: addEvent.down ? "#8B9257":"black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter


        }
        background: Rectangle {
                color: addEvent.down ? "black":"#8B9257"
                implicitHeight: 40
                implicitWidth: 40
                radius: 360
        }
    }

}
