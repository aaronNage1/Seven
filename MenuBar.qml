import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

// Testing something here. Doesnt do anything yet
Button {
    id: menuButton
    text: "Menu"
    height: 10
    Anchor {
        left: parent.left
        top: parent.top
        right: parent.right / 10
    }

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
            text: "Workout"
            onClicked: stack.push("WorkoutPage.qml")
        }
        MenuItem {
            text: "To-Do List"
            onClicked: stack.push("ToDoPage.qml")
        }
    }

}
