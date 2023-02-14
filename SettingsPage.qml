import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

// Page for settings

    Item {
        id: settings
        property int sleepGoal: 0
        property int waterGoal: 0
        property int workoutGoal: 0

    // Everything will be kept in an item as a component can only have one child.

        HeaderBar {
            id: headerBar
        }

        Image {
            id: settingsIcon
            anchors {
                top: headerBar.bottom
                topMargin: 5
                horizontalCenter: parent.horizontalCenter

            }
            height: 200
            width: 200
            source: "settingsIcon.png"
        }

        Rectangle {//rectangle enclosing switches
            id: switchRec
            anchors {
                top: settingsIcon.bottom
                topMargin: 5
                horizontalCenter: parent.horizontalCenter
            }

            width: 340
            height: 200
            color: "#687A12"
            border.color: "#5A5A5A"
            border.width: 2
            radius: 10

            ColumnLayout{//switch labels
                anchors {
                    top: parent.top
                    topMargin: 2
                    left: parent.left
                    leftMargin: 2
                    bottom: parent.bottom
                }

                spacing: 18
                Text{text: "Meal Tracker"; font.pointSize: 12}
                Text{text: "Sleep Tracker" ; font.pointSize: 12}
                Text{text: "Workout Tracker" ; font.pointSize: 12}
                Text{text: "To-Do List" ; font.pointSize: 12}
            }

            ColumnLayout{//switches
                anchors {
                    top: parent.top
                    topMargin: 2
                    right: parent.right
                    rightMargin: 2
                    bottom: parent.bottom
                }

                spacing: 10
                Switch{ id: mealTracker ; checked: true; onPressed: show(waterGoalInput)}
                Switch{ id: sleepTracker ; checked: true; onPressed: show(sleepGoalInput)}
                Switch{ id: workoutTracker ; checked: true; onPressed: show(workoutGoalInput)}
                Switch{ id: toDoTracker ; checked: true; onPressed: show()}
            }
        }

        Rectangle {//rectangle enclosing goals
            id: goalsRec
            anchors {
                top: editGoals.bottom
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
            }

            width: 340
            height: 105
            color: "#687A12"
            border.color: "#5A5A5A"
            border.width: 2
            radius: 10

            ColumnLayout{//Goal labels
                anchors {
                    top: parent.top
                    topMargin: 2
                    left: parent.left
                    leftMargin: 2
                    bottom: parent.bottom
                }

                spacing: 10
                Text{ Layout.row: 1 ; Layout.column: 1 ; text:"Sleep goal" ; font.pointSize: 12}
                Text{ Layout.row: 2 ; Layout.column: 1 ; text:"Water goal" ; font.pointSize: 12}
                Text{ Layout.row: 3 ; Layout.column: 1 ; text:"Workout goal" ; font.pointSize: 12}
            }

            ColumnLayout{// goal display
                anchors {
                    top: parent.top
                    topMargin: 2
                    right: parent.right
                    rightMargin: 2
                    bottom: parent.bottom
                }

                spacing: 10
                Text{ id:sleepGoalDisplay; Layout.row: 1 ; Layout.column: 2 ; text: parseInt(AppSettings.sleepGoal) + " h/night" ; font.pointSize: 12}
                Text{ id:waterGoalDisplay; Layout.row: 2 ; Layout.column: 2 ; text: parseInt(AppSettings.waterGoal) + " cups/day" ; font.pointSize: 12}
                Text{ id:workoutGoalDisplay; Layout.row: 3 ; Layout.column: 2 ; text: parseInt(AppSettings.workoutGoal) +" h/week" ; font.pointSize: 12}
            }

        }





                RoundButton{ //button for editing goals
                id:editGoals
                anchors {
                    top: switchRec.bottom
                    topMargin: 25
                    right: switchRec.right

                }

                onClicked: goalEditWindow.open()

                    contentItem: Text{
                        text:"Edit Goals"
                        font.pointSize: 12
                        color: editGoals.down ? "#8B9257":"black"
                        horizontalAlignment: Text.AlignHCenter
                    }

                    background: Rectangle {
                            color: "transparent"
                            border.color: "black"
                            implicitHeight: 30
                            implicitWidth: 30
                            radius: 360
                    }
                }


                Popup { //window for edditing goals

                    id: goalEditWindow
                    width: 200
                    height: 300
                    anchors.centerIn: Overlay.overlay




                    Column{
                        id: popupColumn
                        anchors.fill: parent.fill
                            //text inputs for sleep, water and food goals
                        Text{
                            text:"Enter Goals:"
                            font.pointSize: 20
                            font.bold : true
                            horizontalAlignment: Text.AlignHCenter

                        }
                        Row {
                            Text{
                                id: sleepGoalText

                                text: "Sleep"
                                font.pointSize: 15

                            }
                            SpinBox {
                                id: sleepGoalInput
                                width: popupColumn.width/3*2
                                editable: true
                                from: 0
                                value: AppSettings.workoutGoal
                                to: 100




                                onValueModified: AppSettings.sleepGoal = sleepGoalInput.value
                            }

                        }
                        Row {
                            Text{
                                id: waterGoalText

                                text: "Water"
                                font.pointSize: 15


                            }
                            SpinBox {
                                id: waterGoalInput
                                width: popupColumn.width/3*2
                                editable: true
                                from: 0
                                value: AppSettings.workoutGoal
                                to: 30



                                onValueModified: AppSettings.waterGoal = waterGoalInput.value
                            }

                        }
                        Row {

                            Text {
                                id: workoutGoalText
                                text: "Workout"
                                font.pointSize: 15
                            }

                            SpinBox {
                                id: workoutGoalInput
                                editable: true
                                width: popupColumn.width/3*2
                                from: 0
                                value: AppSettings.workoutGoal
                                to: 30



                                onValueModified: AppSettings.workoutGoal = workoutGoalInput.value
                            }
                        }





                    Row {

                        Button{ //cancel button


                        id: cancelGoals


                        onClicked: goalEditWindow.close()


                        contentItem: Text{
                            text: "Cancel"
                            font.pointSize: 20
                            color: cancelGoals.down ? "white":"black"
                            horizontalAlignment: Text.AlignHCenter
                        }
                        background: Rectangle {
                                color: cancelGoals.down ? "#8B9257" : "white"
                                implicitHeight: 40
                                implicitWidth: popupColumn.width/2
                                border.color: "black"

                        }

                        } //cancel button

                        Button{ //ok button


                            id: okGoals


                            //need to save data to cpp file
                            onClicked: {

                                        goalEditWindow.close()
                            }


                            contentItem: Text{
                                text: "OK"
                                font.pointSize: 20
                                color: okGoals.down ? "white":"black"
                                horizontalAlignment: Text.AlignHCenter
                            }
                            background: Rectangle {
                                color: okGoals.down ? "#8B9257" : "white"
                                implicitHeight: 40
                                implicitWidth: popupColumn.width/2
                                border.color: "black"

                            }

                        } // ok button



                }
                } //column
            } //window

    }//Item
