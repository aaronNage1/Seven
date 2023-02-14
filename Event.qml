import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage

Item {
    id: addEventPage

    property var groupOptionsList: ["Meals", "Workout","Sleep"]
    property int optionsLength: addEventPage.groupOptionsList.length
    property string currentGroup: "N/A"

    property var appointment: null
    property string name: Appointment.name
    property string group: Appointment.group
    property string date: Appointment.date
    property string startTime: Appointment.startTime
    property string endTime: Appointment.endTime
    property string description: Appointment.description

    property int numEvents: 0

    HeaderBar {
        id: headerBar
    }
        ColumnLayout{

            anchors {
                top: headerBar.bottom
                right: parent.right
                left: parent.left
                bottom: cancelButton.top
            }


            Text {
                id: newEvent
                text: " New Event"

                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 30
                color: "#8B9257"

            }


        Text{
            id: appointments
            text:"Appointment"
            font.pointSize: 20
            color: "#8B9257"
            Layout.alignment: Qt.AlignHCenter
        }

        TextField{
            id: nameField
            placeholderText: "Name"

            font.pointSize: 20
            color: "#8B9257"
            width: 300
            Layout.alignment: Qt.AlignHCenter

            background: Rectangle{
                implicitWidth: 1.5*appointments.width
                }
        }

        Button{
            id:groupButton
            height: 40; width:300
            Layout.alignment: Qt.AlignHCenter
            onClicked: groupPopup.open()

            contentItem: Text{

                text: {
                    if (addEventPage.currentGroup == "N/A")
                        "Group"
                    else addEventPage.currentGroup
                }

                font.pointSize: 20
                color: "grey"
            }
            background: Rectangle{
                implicitWidth: 1.5*appointments.width
                }
            Popup{
                id: groupPopup
                width: groupButton.width
                height: groupButton.height *(addEventPage.groupOptionsList.length+1)+12

                Layout.alignment: Qt.AlignHCenter



                Column{
                    anchors.fill:parent
                    width: parent.width
                    height: parent.height

                    Rectangle{
                        width: parent.width
                        height: groupButton.height
                        border.color: "black"
                        border.width: 1
                        color: "lightgray"

                        ToolButton{
                            id: addNewGroupButton
                            background: Rectangle{
                                anchors.fill: parent
                                color: "lightgray"
                            }
                            Text {
                                text: "Add New Group"
                                color: "black"
                                anchors.centerIn: parent

                                font.pointSize: 12
                            }
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 1
                            height: parent.height
                            width: parent.width

                            onClicked:{
                                groupPopup.close()
                                addNewGroupPopup.open()
                            }
                            Popup{
                                id: addNewGroupPopup
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
                                        id: newGroupText
                                        text: "Enter Group"
                                        color: "black"
                                        font.pointSize: 15
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.top: parent.top
                                        anchors.topMargin: 20
                                    }
                                    TextField{
                                        id: newGroupTextField
                                        placeholderText: "Group"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.top: newGroupText.bottom
                                        anchors.topMargin: 20
                                        width: parent.width - 10
                                    }
                                    ToolButton{
                                        id: doneNewGroup
                                        anchors.bottom: parent.bottom
                                        anchors.right: parent.right

                                        onClicked:{
                                            addEventPage.currentGroup = newGroupTextField.text
                                            addEventPage.groupOptionsList.push(currentGroup)
                                            addNewGroupPopup.close()
                                            newGroupTextField.text = "";
                                        }
                                        width: parent.width/2
                                        height: 30
                                        background: Rectangle {
                                            color: parent.down ? "lightgray" : "white"
                                            border.color: "black"
                                            Text {
                                                text: "OK"
                                                color: "green"
                                                anchors.centerIn: parent
                                            }
                                            radius: 5
                                        }
                                    }
                                    ToolButton{
                                        id: cancelNewGroup
                                        anchors.bottom:parent.bottom
                                        anchors.left: parent.left
                                        anchors.right: doneNewGroup.left
                                        onClicked:{
                                            addNewGroupPopup.close()
                                            newGroupTextField.text = "";
                                        }
                                        width: parent.width/2
                                        height: 30
                                        background: Rectangle {
                                            color: parent.down ? "lightgray" : "white"
                                            border.color: "black"
                                            Text {
                                                text: "Cancel"
                                                color: "red"
                                                anchors.centerIn: parent
                                            }
                                            radius: 5
                                        }
                                    }
                                }
                            }
                        }

                        Repeater{
                            model: addEventPage.optionsLength
                            Rectangle{
                                width: parent.width
                                height: groupButton.height
                                y: parent.y + groupButton.height*(model.index +1)
                                border.color: "black"
                                border.width: 1
                                color: "white"
                                Button{
                                    Text{
                                        id: chosenGroup
                                        text: addEventPage.groupOptionsList[model.index]
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        color:"black"
                                        font.pointSize: 12
                                    }
                                    Text{
                                        text: "\u203A"
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.right
                                        anchors.rightMargin: 15
                                        color:"black"
                                        font.pointSize: 30
                                    }
                                    background: Rectangle{
                                        color: "white"
                                        border.color: "black"
                                        border.width: 1
                                    }
                                    anchors.fill: parent
                                    width: parent.width
                                    height: parent.height
                                    onClicked:{
                                        groupPopup.close()
                                        addEventPage.currentGroup = chosenGroup.text
                                    }
                                }
                            }
                        }
                    }
                }

            }
        }

        TextField{
            id: dateField
            placeholderText: "Date (DD/MM/YYYY)"
            font.pointSize: 20
            color: "#8B9257"
            width: 300
            Layout.alignment: Qt.AlignHCenter

            background: Rectangle{
                implicitWidth: 1.5*appointments.width
                }
        }

        TextField{
            id: startTimeField
            placeholderText: "Start Time"
            font.pointSize: 20
            color: "#8B9257"
            width: 150
            Layout.alignment: Qt.AlignHCenter

            background: Rectangle{
                implicitWidth: 1.5*appointments.width
                }
        }

        TextField{
            id: endTimeField
            placeholderText: "End Time"
            font.pointSize: 20
            color: "#8B9257"
            width: 150
            Layout.alignment: Qt.AlignHCenter

            background: Rectangle{
                implicitWidth: 1.5*appointments.width
                }
        }

        Button{
            Layout.alignment: Qt.AlignHCenter

            background: Rectangle{
                implicitWidth: 1.5*appointments.width
                height: nameField.height
            }

            ComboBox{
                id: occurenceField
                width:parent.width
                height: nameField.height




                model: ListModel{
                    id: occurence

                    ListElement{
                        text: "--Occurence--"
                    }
                    ListElement{
                        text: "Once"
                    }
                    ListElement{
                        text: "Daily"
                    }
                    ListElement{
                        text: "Weekly"
                    }
                    ListElement{
                        text: "Bi-Weekly"
                    }
                    ListElement{
                        text: "Monthly"
                    }
                    ListElement{
                        text: "Yearly"
                    }
                }
            }
        }

        TextField{
            id: descriptionField
            placeholderText: "Description"
            font.pointSize: 10
            color: "#8B9257"
            width: 300
            height: 200
            Layout.alignment: Qt.AlignHCenter
            maximumLength: 300

            background: Rectangle{
                implicitWidth: 1.5*appointments.width
                implicitHeight: 2*nameField.height
                }
        }
    }

        Button{
            id: cancelButton
            height:50;width:150
            anchors {
                left: parent.left
                bottom: parent.bottom
            }

            onClicked:{

                stack.pop()
            }

            contentItem: Text{
                text: "Cancel"
                color: "red"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 20

            }
            background: Rectangle{
                color: "#B4D2A9"
                radius: 50
                border.color:"black"
                implicitHeight: 50
                implicitWidth: 150
            }
        }

        Button{
            id: doneButton
            height:50;width:150
            anchors {
                bottom: parent.bottom
                right: parent.right
            }
                onClicked: {
                    Appointment.setName(nameField.text)
                    Appointment.setGroup(groupButton.contentItem.text)
                    Appointment.setDate(dateField.text)
                    Appointment.setStartTime(startTimeField.text)
                    Appointment.setEndTime(endTimeField.text)
                    Appointment.setOccurence(occurenceField.currentText)
                    Appointment.setDescription(descriptionField.text)

                    Appointment.check()

                    DailyView.settings.appList.push(Appointment)
                    stack.pop()
                }
            contentItem: Text{
                text: "Done"
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 20
            }
            background: Rectangle{
                color: "#B4D2A9"
                radius: 50
                border.color:"black"
                implicitHeight: 50
                implicitWidth: 150
            }
        }
}
