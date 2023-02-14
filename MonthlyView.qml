import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.4


Rectangle {
    id: monthlyview
    visible: false
    color: "#B4D2A9"

    Text {
        id: monthText
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        text: "Month"
        horizontalAlignment: Text.AlignHCenter

    }

    Button{ //left arrow
        id: leftArrow
        anchors {
            right: monthText.left
            top: parent.bottom
        }

        //onclicked: //couldnt figure out how to do this *****

        contentItem: Text{
            text: "<"
            color: leftArrow.down ? "grey":"black"
            font.pointSize: 20
        }

        background: Rectangle {
                color: "transparent"
                implicitHeight: 40
                implicitWidth: 40
        }

    }

    Button{ //right arrow
        id:rightArrow
        anchors {
            top: parent.bottom
            left: monthText.right
        }

        contentItem: Text{
            text: ">"
            color: rightArrow.down ? "grey":"black"
            font.pointSize: 20
        }

        background: Rectangle {
                color: "transparent"
                implicitHeight: 40
                implicitWidth: 40
        }


    }

    GridLayout {
        id: gridLayout
        columns: 1
        width: parent.width/4*3
        height: parent.height/6*5
        anchors {
            top: monthText.bottom
            horizontalCenter: parent.horizontalCenter
        }

        DayOfWeekRow {


            locale: grid.locale

            Layout.column: 0
            Layout.fillWidth: true
        }



        MonthGrid {
            id: grid
            month: Calendar.November
            year: 2022
            locale: Qt.locale("en_US")

            Layout.fillWidth: true
            Layout.fillHeight: true
            delegate: RoundButton {
                id: monthButton
                width: grid.width/7
                height: grid.width/7
                radius: 360
                opacity: model.month === grid.month ? 1 : 0
                contentItem: Text {
                    text: model.day
                    color: monthButton.down ? "#8B9257":"black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                background: Rectangle {
                            color: monthButton.down ? "black":"#8B9257"
                            anchors.fill: parent

                            radius: 360
                }

            }
        }
    }
    RoundButton{ //Add Event button ...Doesn't work with directory problems
        id:addEvent
        height: 40; width: 200
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: monthlyview.bottom

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
