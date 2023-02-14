import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.4

// Starting Page for the app. Calendar
ApplicationWindow {
    id: root
    width: 390
    height: 844
    visible: true
    title: "Seven"
    color: "#B4D2A9"

    StackView {
        id: stack
        initialItem: calendarView
        anchors.fill: parent


    }

    Component {
        //Keep everything within the component so items stay on calendar page.
        id: calendarView

        Item{
        // Everything will be kept in an item as a component can only have one child.



                HeaderBar {
                    id: headerBar

               }

                DailyView {
                    id: dailyView
                    visible: true
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: headerBar.bottom
                        bottom: parent.bottom
                    }

                }

                WeeklyView {
                    id:weeklyView
                    visible: false
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: headerBar.bottom
                        bottom: parent.bottom
                    }
                }

                MonthlyView {
                    id: monthlyView
                    visible: false
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: headerBar.bottom
                        bottom: parent.bottom
                    }
                }


        }//Item

    }//Component

}//Application Window

