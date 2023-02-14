import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
//import Workout 1.0

Rectangle {
    id: workoutPageItem
    width: 390
    height: 844
    color: "#B4D2A9"

//    WorkoutClass {
//        id: workoutClass
//    }

    property int time: 0
    property string pastWorkout1: workoutClass.getPastWorkout(0)
    property string pastWorkout2: workoutClass.getPastWorkout(1)
    property string pastWorkout3: workoutClass.getPastWorkout(2)
    property var pastWorkouts: [[pastWorkout1, workoutClass.getPastWorkoutTime(0)], [pastWorkout2, workoutClass.getPastWorkoutTime(0)], [pastWorkout3, workoutClass.getPastWorkoutTime(0)]]
    property int weeklyProgress: workoutClass.getProgress()
    property int weeklyGoal: workoutClass.getGoal();
    property string currentWorkout: "N/A"



        Item {
            id: topRow
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right:parent.right
            height: 30


            ToolButton {
                id: menuButton
                anchors.left: parent.left
                anchors.top: parent.top
                text: "\u2630"
                width: 30
                height: 30
                onClicked: menu.open()

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
                        text: "To-Do List"
                        onClicked: stack.push("ToDoPage.qml")
                    }
                }

            }


            ToolButton {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.rightMargin: 5
                background: Image {
                    id: settingsIcon
                    source: "settingsIcon.png"
                }
                width: 20
                height: 20

                onClicked: stack.push("SettingsPage.qml")
            }
        }

        Item {
            id: secondRow
            anchors.top: topRow.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50
            property date currentDate: new Date()
            property int day: currentDate.getDate()
            property var dayNames: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            property string weekDay: dayNames[currentDate.getDay()]
            property var monthNames: ["January", "February", "March", "April", "May", "June", "July", "August",
            "September", "October", "November", "December"]
            property string month: monthNames[currentDate.getMonth()]
            property int year: currentDate.getFullYear()
            Text {
                text: parent.weekDay
                anchors.leftMargin: 10
                font.pointSize: 30
                anchors.left: parent.left
            }
            Image {
                source: "workoutIcon.png"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 40
                anchors.topMargin: 15
                width: 100
                height: 80
                anchors.verticalCenter: parent.verticalCenterCenter
            }
        }

        Item {
            id: thirdRow
            anchors.top: secondRow.bottom
            anchors.left: secondRow.left
            anchors.right: secondRow.right
            height: 80
            Text {
                anchors.leftMargin: 10
                text: secondRow.month + " " + secondRow.day + ", " + secondRow.year
                font.pointSize: 15
                anchors.left: parent.left
            }
        }

        Item {
            id: fourthRow
            anchors.top: thirdRow.bottom
            anchors.left: thirdRow.left
            anchors.right: thirdRow.right
            height: 30
            Text {
                text: "Enter Workout Info"
                font.underline: true
                font.pointSize: 15
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Item {
            id: fifthRow
            anchors.top: fourthRow.bottom
            anchors.left: fourthRow.left
            anchors.right: fourthRow.right
            height: 70
            ToolButton {
                id: workoutButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.centerIn: parent
                width: workoutPageItem.width / 1.5
                height: 50
                background: Rectangle {
                    color: parent.down ? "#778C12" : "#5C6C0E"
                    Text {
                        text: {
                            if (workoutPageItem.currentWorkout == "N/A") {
                                "Workout"
                            }
                            else workoutPageItem.currentWorkout
                        }
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                    Text {
                        text: "\u25BC"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        color: "white"
                        font.pointSize: 15
                    }
                    radius: 5
                }
                onClicked: workoutPopup.open()

            }
            Popup {
                id: workoutPopup
                width: workoutButton.width
                height: workoutButton.height * (workoutClass.getListOfWorkouts().length + 1) + 12
                x: workoutButton.x
                y: workoutButton.y + workoutButton.height
                Column {
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                    Rectangle {
                        width: parent.width
                        height: workoutButton.height
                        border.color: "black"
                        border.width: 1
                        color: "lightgray"
                        ToolButton {
                            id: removeWorkoutButton
                            background: Rectangle {
                                anchors.fill: parent
                                color: "lightgray"
                            }
                            Text {
                                text: "-"
                                color: "black"
                                anchors.centerIn: parent

                                font.pointSize: 50
                            }
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 1
                            height: parent.height - 3
                            width: parent.height - 3

                            onClicked: {
                                workoutPopup.close()
                                removeWorkoutPopup.open()
                            }
                        }
                        Popup {
                            id: removeWorkoutPopup
                            parent: Overlay.overlay
                            x: Math.round((parent.width - width) / 2)
                            y: Math.round((parent.height - height) / 2) - 100
                            width: 300
                            height: 160
                            background: Rectangle {
                                radius: 5
                                width: parent.width
                                height: parent.height
                                color: "white"
                            }
                            contentItem: Rectangle {
                                width: parent.width
                                height: parent.height
                                color: "white"
                                radius: 5
                                Text {
                                    text: "Enter Workout to Remove"
                                    color: "black"
                                    font.pointSize: 15
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.top: parent.top
                                    anchors.topMargin: 20
                                }
                                TextField {
                                    id: workoutRemoveTextField
                                    placeholderText: "Workout"
                                    //textColor: "black"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.bottom: cancelRemoveWorkoutButton.top
                                    anchors.bottomMargin: 20
                                    width: parent.width - 10
                                }
                                ToolButton {
                                    id: cancelRemoveWorkoutButton
                                    anchors.bottom: parent.bottom
                                    anchors.left: parent.left
                                    anchors.right: doneRemoveWorkoutButton.left
                                    onClicked: {
                                        addWorkoutPopup.close()
                                        workoutRemoveTextField.text = "";
                                    }

                                    width: parent.width / 2
                                    height: 30
                                    background: Rectangle {
                                        color: parent.down ? "lightgray" : "white"
                                        Text {
                                            text: "Cancel"
                                            color: "red"
                                            anchors.centerIn: parent
                                        }
                                        radius: 5
                                    }
                                }

                                ToolButton {
                                    id: doneRemoveWorkoutButton
                                    anchors.bottom: parent.bottom
                                    anchors.right: parent.right
                                    anchors.left: cancelRemoveWorkoutButton.right
                                    onClicked: {
                                        if (workoutClass.workoutInList(workoutRemoveTextField.text)) {
                                            workoutClass.removeWorkoutFromList(workoutRemoveTextField.text)
                                            removeWorkoutPopup.close()
                                            workoutRemoveTextField.text = "";
                                            stack.push("WorkoutPage.qml")
                                        }
                                        else {
                                            removeWorkoutPopup.close()
                                            workoutRemoveTextField.text = "";
                                        }
                                    }
                                    width: parent.width / 2
                                    height: 30
                                    background: Rectangle {
                                        color: parent.down ? "lightgray" : "white"
                                        Text {
                                            text: "OK"
                                            color: "green"
                                            anchors.centerIn: parent
                                        }
                                        radius: 5
                                    }
                                }
                            }
                        }
                        Text {
                            text: "Previous Workouts"
                            color: "black"
                            font.pointSize: 12
                            anchors.centerIn: parent
                        }
                        ToolButton {
                            id: addWorkoutButton
                            background: Rectangle {
                                anchors.fill: parent
                                color: "lightgray"
                            }
                            Text {
                                text: "+"
                                color: "black"
                                anchors.centerIn: parent

                                font.pointSize: 50
                            }
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 1
                            height: parent.height - 3
                            width: parent.height - 3

                            onClicked: {
                                workoutPopup.close()
                                addWorkoutPopup.open()
                            }
                        }
                        Popup {
                            id: addWorkoutPopup
                            parent: Overlay.overlay
                            x: Math.round((parent.width - width) / 2)
                            y: Math.round((parent.height - height) / 2) - 100
                            width: 300
                            height: 160
                            background: Rectangle {
                                radius: 5
                                width: parent.width
                                height: parent.height
                                color: "white"
                            }
                            contentItem: Rectangle {
                                width: parent.width
                                height: parent.height
                                color: "white"
                                radius: 5
                                Text {
                                    text: "Enter Workout to Add"
                                    color: "black"
                                    font.pointSize: 15
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.top: parent.top
                                    anchors.topMargin: 20
                                }
                                TextField {
                                    id: workoutAddTextField
                                    placeholderText: "Workout"
                                    //textColor: "black"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.bottom: cancelAddWorkoutButton.top
                                    anchors.bottomMargin: 20
                                    width: parent.width - 10
                                }
                                ToolButton {
                                    id: cancelAddWorkoutButton
                                    anchors.bottom: parent.bottom
                                    anchors.left: parent.left
                                    anchors.right: doneAddWorkoutButton.left
                                    onClicked: {
                                        addWorkoutPopup.close()
                                        workoutAddTextField.text = "";
                                    }

                                    width: parent.width / 2
                                    height: 30
                                    background: Rectangle {
                                        color: parent.down ? "lightgray" : "white"
                                        Text {
                                            text: "Cancel"
                                            color: "red"
                                            anchors.centerIn: parent
                                        }
                                        radius: 5
                                    }
                                }

                                ToolButton {
                                    id: doneAddWorkoutButton
                                    anchors.bottom: parent.bottom
                                    anchors.right: parent.right
                                    anchors.left: cancelAddWorkoutButton.right
                                    onClicked: {
                                        workoutPageItem.currentWorkout = workoutAddTextField.text
                                        workoutClass.addNewWorkout(currentWorkout)
                                        addWorkoutPopup.close()
                                        workoutAddTextField.text = "";
                                    }
                                    width: parent.width / 2
                                    height: 30
                                    background: Rectangle {
                                        color: parent.down ? "lightgray" : "white"
                                        Text {
                                            text: "OK"
                                            color: "green"
                                            anchors.centerIn: parent
                                        }
                                        radius: 5
                                    }
                                }
                            }
                        }
                    }

                    Repeater {
                        model: workoutClass.getListOfWorkouts().length
                        Rectangle {
                            width: parent.width
                            height: workoutButton.height
                            border.color: "black"
                            border.width: 1
                            color: "white"
                            Button {
                                Text {
                                    z:50
                                    id: chosenWorkout
                                    text: workoutClass.getListOfWorkouts()[model.index]
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    color: "black"
                                    font.pointSize: 12
                                }
                                Text {
                                    text: "\u203A"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    color: "black"
                                    font.pointSize: 30
                                }
                                background: Rectangle {
                                    color: "white"
                                    border.color: "black"
                                    border.width: 1
                                }
                                anchors.fill: parent
                                width: parent.width
                                height: parent.height
                                onClicked: {
                                    workoutPopup.close()
                                    workoutPageItem.currentWorkout = chosenWorkout.text
                                }
                            }
                        }
                    }
                }
            }
        }

        Item {
            id: sixthRow
            anchors.top: fifthRow.bottom
            anchors.left: fifthRow.left
            anchors.right: fifthRow.right
            height: 100
            Image {
                width: 80
                height: 80
                id: clockIcon
                source: "clockIcon.png"
                anchors.centerIn: parent
                Text {
                    text: workoutPageItem.time + " mins"
                    font.pointSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                }
            }
        }

        Item {
            id: seventhRow
            anchors.top: sixthRow.bottom
            anchors.left: sixthRow.left
            anchors.right: sixthRow.right
            height: 50

            ToolButton {
                id: decrementButton
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.rightMargin: 5
                onClicked: {
                    if (workoutPageItem.time != 0) {
                        workoutPageItem.time -= 15
                    }
                }

                width: workoutPageItem.width / 3
                height: 50
                background: Rectangle {
                    color: parent.down ? "#778C12" : "#5C6C0E"
                    Text {
                        text: "- 15"
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                        font.pointSize: 20
                    }
                    radius: 5
                }
            }

            ToolButton {
                id: incrementButton
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: decrementButton.right
                width: workoutPageItem.width / 3
                anchors.leftMargin: 5
                height: 50
                onClicked: {
                    workoutPageItem.time += 15
                }
                background: Rectangle {
                    color: parent.down ? "#778C12" : "#5C6C0E"
                    Text {
                        text: "+ 15"
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                        font.pointSize: 20
                    }
                    radius: 5
                }
            }
        }

        Item {
            id: eighthRow
            anchors.top: seventhRow.bottom
            anchors.left: seventhRow.left
            anchors.right: seventhRow.right
            height: 60
            ToolButton {
                id: doneButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.centerIn: parent
                width: workoutPageItem.width * (2/7)
                height: 32
                background: Rectangle {
                    color: parent.down ? "#778C12" : "#5C6C0E"
                    Text {
                        text: "Done"
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                        font.pointSize: 13
                    }
                    radius: 5
                }
                onClicked: {
                    if (workoutPageItem.currentWorkout != "N/A" && workoutPageItem.time != 0) {
                        workoutPageItem.weeklyProgress += workoutPageItem.time
//                        workoutPageItem.pastWorkouts[2][0] = workoutPageItem.pastWorkouts[1][0];
//                        workoutPageItem.pastWorkouts[1][0] = workoutPageItem.pastWorkouts[0][0];
//                        workoutPageItem.pastWorkouts[2][1] = workoutPageItem.pastWorkouts[1][1];
//                        workoutPageItem.pastWorkouts[1][1] = workoutPageItem.pastWorkouts[0][1];
//                        workoutPageItem.pastWorkouts[0][0] = currentWorkout;
//                        workoutPageItem.pastWorkouts[0][1] = workoutPageItem.time;
                        workoutClass.addPastWorkout(currentWorkout, workoutPageItem.time)
                        workoutPageItem.time = 0
                        workoutPageItem.currentWorkout = "N/A"
                        stack.push("WorkoutPage.qml")
                    }
                    else {
                        workoutNeededPopup.open()
                    }
                }
            }
            Popup {
                id: workoutNeededPopup
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2)
                y: Math.round((parent.height - height) / 2)
                width: 300
                height: 130
                background: Rectangle {
                    radius: 5
                    width: parent.width
                    height: parent.height
                    color: "white"
                }
                contentItem: Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "white"
                    radius: 5
                    Text {
                        text: "Please enter a workout and \nthe length of the workout."
                        color: "black"
                        font.pointSize: 12
                        anchors.centerIn: parent
                    }
                    ToolButton {
                        id: okButton
                        anchors.bottom: parent.bottom
                        //anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            workoutNeededPopup.close()
                        }
                        width: parent.width
                        height: 30
                        background: Rectangle {
                            color: parent.down ? "lightgray" : "white"
                            Text {
                                text: "OK"
                                color: "green"
                                anchors.centerIn: parent
                            }
                            radius: 5
                        }
                    }
                }
            }
        }

        Item {
            id: ninthRow
            anchors.top: eighthRow.bottom
            anchors.left: eighthRow.left
            anchors.right: eighthRow.right
            anchors.topMargin: 40
            height: 40
            Text {
                text: "Previous 3 Workouts:"
                font.underline: true
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Item {
            id: tenthRow
            anchors.top: ninthRow.bottom
            anchors.left: ninthRow.left
            anchors.right: ninthRow.right
            height: 120
            Rectangle {
                id: workout1
                color: "#5C6C0E"
                height: 30
                width: workoutPageItem.width / 3
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 5
                Text {
                    text: workoutClass.getPastWorkout(0) + " - " + workoutClass.getPastWorkoutTime(0) + " mins"
                        /*if (workoutPageItem.time >= 0) {
                              workoutPageItem.pastWorkouts[0][0] + " - " + workoutPageItem.pastWorkouts[0][1] + " mins"
                          }*/
                    anchors.centerIn: parent
                    color: "#FFFFFF"

                }
                visible: {
//                    if (workoutPageItem.pastWorkouts[0][0] === "No Workout") {
//                        false;
//                    }
//                    else true;
                    if (workoutClass.getPastWorkout(0) === "No Workout") {
                        false;
                    }
                    else true;
                }
            }
            Rectangle {
                id: workout2
                color: "#5C6C0E"
                height: 30
                width: workoutPageItem.width / 3
                anchors.top: workout1.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                Text {
                    text: workoutClass.getPastWorkout(1) + " - " + workoutClass.getPastWorkoutTime(1) + " mins"
                        /*if (workoutPageItem.time >= 0) {
                              workoutPageItem.pastWorkouts[1][0] + " - " + workoutPageItem.pastWorkouts[1][1] + " mins"
                          }*/
                    anchors.centerIn: parent
                    color: "#FFFFFF"
                }
                visible: {
                    if (workoutClass.getPastWorkout(1) === "No Workout") {
                        false;
                    }
                    else true;
//                    if (workoutPageItem.pastWorkouts[1][0] === "No Workout") {
//                        false;
//                    }
//                    else true;
                }
            }
            Rectangle {
                id: workout3
                color: "#5C6C0E"
                height: 30
                width: workoutPageItem.width / 3
                anchors.top: workout2.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    text: workoutClass.getPastWorkout(2) + " - " + workoutClass.getPastWorkoutTime(2) + " mins"
                        /*if (workoutPageItem.time >= 0) {
                              workoutPageItem.pastWorkouts[2][0] + " - " + workoutPageItem.pastWorkouts[2][1] + " mins"
                          }*/
                    anchors.centerIn: parent
                    color: "#FFFFFF"
                }
                visible:
                {
                    if (workoutClass.getPastWorkout(2) === "No Workout") {
                        false;
                    }
                    else true;
                }
            }

        }

        Item {
            id: eleventhRow
            anchors.bottom: workoutPageItem.bottom
            anchors.bottomMargin: 30
            anchors.left: tenthRow.left
            anchors.right: tenthRow.right
            height: 50

            ProgressBar {
                id: workoutProgressBar
                visible: true
                from: 0
                to: workoutPageItem.weeklyGoal
                value: workoutPageItem.weeklyProgress
                anchors.centerIn: parent
                background: Rectangle {
                    z: 1
                    radius: 3
                    color: "lightgray"
                    border.color: "gray"
                    border.width: 2
                    implicitWidth: workoutPageItem.width * (5/6)
                    implicitHeight: 24
                }
                contentItem: Item {
                    z: 2
                    implicitWidth: workoutPageItem.width * (5/6)
                    implicitHeight: 20
                    Rectangle {
                        color: "#4ad627"
                        border.color: "gray"
                        border.width: 2
                        radius: 3
                        height: parent.height
                        width: {
                            if ((workoutPageItem.weeklyProgress / workoutPageItem.weeklyGoal) * parent.width < parent.width)
                            {
                                (workoutPageItem.weeklyProgress / workoutPageItem.weeklyGoal) * parent.width
                            }
                            else parent.width
                        }
                    }
                }

                Text {
                    property int percentageComplete: (workoutPageItem.weeklyProgress / workoutPageItem.weeklyGoal) * 100
                    text:  {
                        if (percentageComplete < 100) {
                            percentageComplete + "%"
                        }
                        else "100%"
                    }
                    color: "black"
                    anchors.centerIn: parent
                    z: 3
                }
            }
            Text {
                text: "This Week's Hourly Progress"
                anchors.top: workoutProgressBar.bottom
                anchors.topMargin: 5
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                property int weeklyHours: workoutPageItem.weeklyProgress / 60
                property int weeklyMins: workoutPageItem.weeklyProgress - (60 * weeklyHours)
                text: "Total Time This Week: " + weeklyHours + "hrs " + weeklyMins + "mins"
                anchors.bottom: workoutProgressBar.top
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }

//            Popup {
//                id: congratsPopup
//                anchors.centerIn: workoutPageItem
//                height: 100
//                width: 200
//                Text {
//                    anchors.centerIn: parent
//                    text: "Congrats! You've reached your workout goal for the week!"
//                }

//                modal: true
//                focus: true
//                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
//            }
        }
}

