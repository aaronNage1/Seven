import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.4

Rectangle {
    id: headerBar
    height: 50
    anchors {
        left: parent.left
        top: parent.top
        right: parent.right
    }
    color: "#B4D2A9"
    property bool showMeal: true
    property bool showWorkout: true
    property bool showSleep: true
    property bool showToDo: true

    Button {
        id: menuButton
        contentItem: Text {
            text: "\u2630"
            font.pointSize: 25
            anchors {
                horizontalCenter: menuButton.horizontalCenter
                verticalCenter: menuButton.verticalCenter
            }
        }
        background: Rectangle {

            color: "#B4D2A9"

        }
        onClicked: menu.open()
        Menu {
            id: menu
            y: menuButton.height

            MenuItem {
                text: "Sleep"
                onClicked: {
                    if(stack.depth >= 2) {
                       stack.pop();
                     }
                    stack.push("SleepPage.qml")
                }
            }

            MenuItem {
                text: "Meal"
                onClicked: {
                    if(stack.depth >= 2) {
                      stack.pop();
                    }
                    stack.push("MealPage.qml")
                }
            }

            MenuItem {
                text: "Workout"
                onClicked: {
                    if(stack.depth >= 2) {
                       stack.pop();
                    }
                    stack.push("WorkoutPage.qml")
                }
            }
            MenuItem {
                text: "To-Do List"
                onClicked: {
                    if(stack.depth >= 2) {
                        stack.pop();
                    }
                    stack.push("ToDoPage.qml")
                }
            }


        }//Menu
    }


    Button {
        text: "Today's Date"
        height: 50
        width: 200
        checkable: true
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter

        }

        onClicked: if(stack.depth >= 2) {
                       stack.pop();
                   }
                   else if(dailyView.visible === true) {

                       dailyView.visible = false
                       weeklyView.visible = true
                   }
                   else if(weeklyView.visible === true) {

                       weeklyView.visible = false
                       monthlyView.visible = true
                   }else if(monthlyView.visible === true){
                       monthlyView.visible = false
                       dailyView.visible = true
                   }


        //Colours the menu button
        background: Rectangle {

                    color: "#B4D2A9"
                    border.color:"black"
        }
    }


        RoundButton{
            visible: if (stack.currentItem === "SettingsPage.qml") {
                           false
                       }
                       else {
                               true
                       }
                           //Temporary Settings until I figure out images
            anchors {
                verticalCenter: headerBar.verticalCenter
                right: headerBar.right
                rightMargin: 5
            }

            background: Image {
                source: 'settingsIcon.png'
                anchors.fill: parent
            }
            width: 35
            height: 35

            onClicked: {
                //console.log(stack.currentItem.id.toString())
                stack.push("SettingsPage.qml")
            }
        }

}

