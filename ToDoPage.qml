import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import todoEventPkg 1.0


Rectangle {

    ToDoEvent {
        id: event_1
    }
    ToDoEvent {
        id: event_2
    }
    ToDoEvent {
        id: event_3
    }

    property var to_do1Model: [
        {"Event": qsTr(event_1.getDueDate() + "\n" + event_1.getDescrip())}
    ]

    property var to_do2Model: [
        {"Event": qsTr(event_2.getDueDate() + "\n" + event_2.getDescrip())}
    ]

    property var to_do3Model: [
        {"Event": qsTr(event_2.getDueDate() + "\n" + event_2.getDescrip())}
    ]

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: root.implicitHeight
        boundsBehavior: Flickable.OvershootBounds

        Pane {
            id: root
            anchors.fill: parent
            Material.background: "#B4D2A9"

            ColumnLayout {
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                Label {
                    topPadding: 10
                    bottomPadding: 10
                    font.pixelSize: 20
                    Layout.fillWidth: true
                    Layout.preferredWidth: 1
                    horizontalAlignment: Qt.AlignHCenter
                    text: qsTr("To-Do List")
                }

                Button {
                    id: buttonlist_to_do_do1
                    visible: {
                        if (event_1.getDueDate() === "NULL")
                            false
                        else
                            true
                    }
                    Layout.fillWidth: true
                    text: event_1.getName()
                    onClicked: {
                        paneto_do1List.visible ? paneto_do1List.visible = false : paneto_do1List.visible = true
                    }
                    Connections{
                        target:listButton1
                        onValueChanged:buttonlist_to_do_do1.text = s;
                    }
                }

                Pane {
                    id: paneto_do1List
                    visible: false
                    Material.background: "#8B9257"
                    padding: 0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    ColumnLayout {
                        anchors.right: parent.right
                        anchors.left: parent.left

                        ListView {
                            id: list_to_do_do1
                            visible: true
                            boundsBehavior: Flickable.OvershootBounds
                            interactive: false
                            focus: true
                            clip: true
                            Layout.fillWidth: true
                            height: contentHeight

                            model: to_do1Model

                            delegate: ItemDelegate {
                                id: itemDelegateto_do1
                                text: " "
                                height: to_do1DataColumn.implicitHeight
                                padding: 0
                                width: parent.width
                                onClicked: {

                                }

                                ColumnLayout {
                                    id: to_do1DataColumn
                                    parent: itemDelegateto_do1.contentItem
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.leftMargin: 20
                                    anchors.rightMargin: 20
                                    RowLayout {
                                        spacing: 20
                                        Layout.fillWidth: true
                                        Item {
                                            height: 60
                                        }

                                        Label {
                                            id: label_1
                                            text: modelData.Event
                                            wrapMode: Label.WordWrap
                                        }

                                        Connections{
                                            target:event1
                                            onValueChanged:label_1.text = s;
                                        }
                                    }
                                }
                            }

                            ScrollIndicator.vertical: ScrollIndicator {}
                        }
                    }
                }

                Button {
                    id: buttonlist_to_do_do2
                    visible: {
                        if (event_2.getDueDate() === "NULL")
                            false
                        else
                            true
                    }
                    Layout.fillWidth: true
                    text: qsTr(event_2.getName())
                    onClicked: {
                        paneto_do2List.visible ? paneto_do2List.visible = false : paneto_do2List.visible = true
                    }

                    Connections{
                        target:listButton2
                        onValueChanged:buttonlist_to_do_do2.text = s;
                    }
                }

                Pane {
                    id: paneto_do2List
                    visible: false
                    Material.background: "#8B9257"
                    padding: 0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    ColumnLayout {
                        anchors.right: parent.right
                        anchors.left: parent.left

                        ListView {
                            id: list_to_do_do2
                            visible: true
                            boundsBehavior: Flickable.OvershootBounds
                            interactive: false
                            focus: true
                            clip: true
                            Layout.fillWidth: true
                            height: contentHeight

                            model: to_do2Model

                            delegate: ItemDelegate {
                                id: itemDelegateto_do2
                                text: " "
                                height: to_do2DataColumn.implicitHeight
                                padding: 0
                                width: parent.width
                                onClicked: {

                                }

                                ColumnLayout {
                                    id: to_do2DataColumn
                                    parent: itemDelegateto_do2.contentItem
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.leftMargin: 20
                                    anchors.rightMargin: 20
                                    RowLayout {
                                        spacing: 20
                                        Layout.fillWidth: true
                                        Item {
                                            height: 60
                                        }
                                        Label {
                                            id: label_2
                                            text: modelData.Event
                                            wrapMode: Label.WordWrap
                                        }

                                        Connections{
                                            target:event2
                                            onValueChanged:label_2.text = s;
                                        }
                                    }
                                }
                            }
                            ScrollIndicator.vertical: ScrollIndicator {}
                        }
                    }
                }

                Button {
                    id: buttonlist_to_do_do3
                    visible: {
                        if (event_3.getDueDate() === "NULL")
                            false
                        else
                            true
                    }
                    Layout.fillWidth: true
                    text: qsTr(event_3.getName())
                    onClicked: {
                        paneto_do3List.visible ? paneto_do3List.visible = false : paneto_do3List.visible = true
                    }

                    Connections{
                        target:listButton3
                        onValueChanged:buttonlist_to_do_do3.text = s;
                    }
                }

                Pane {
                    id: paneto_do3List
                    visible: false
                    Material.background: "#8B9257"
                    padding: 0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    ColumnLayout {
                        anchors.right: parent.right
                        anchors.left: parent.left

                        ListView {
                            id: list_to_do_do3
                            visible: true
                            boundsBehavior: Flickable.OvershootBounds
                            interactive: false
                            focus: true
                            clip: true
                            Layout.fillWidth: true
                            height: contentHeight

                            model: to_do3Model

                            delegate: ItemDelegate {
                                id: itemDelegateto_do3
                                text: " "
                                height: to_do3DataColumn.implicitHeight
                                padding: 0
                                width: parent.width
                                onClicked: {

                                }

                                ColumnLayout {
                                    id: to_do3DataColumn
                                    parent: itemDelegateto_do3.contentItem
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.leftMargin: 20
                                    anchors.rightMargin: 20
                                    RowLayout {
                                        spacing: 20
                                        Layout.fillWidth: true
                                        Item {
                                            height: 60
                                        }
                                        Label {
                                            id: label_3
                                            text: modelData.Event
                                            wrapMode: Label.WordWrap
                                        }

                                        Connections{
                                            target:event3
                                            onValueChanged:label_3.text = s;
                                        }
                                    }
                                }
                            }
                            ScrollIndicator.vertical: ScrollIndicator {}
                        }
                    }
                }

                Button {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    onClicked: popupAdd.open()
                    contentItem: Text{
                        color: "#B4D2A9"
                        text: "Add new event"
                        font.pointSize: 10
                        horizontalAlignment: Text.AlignHCenter
                    }
                    background: Rectangle {
                        color: "#8B9257"
                        implicitHeight: 25
                        implicitWidth: 25
                        radius: 360
                    }
                }
                Button {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    onClicked: popupRemove.open()
                    contentItem: Text{
                        color: "#B4D2A9"
                        text: "Remove event"
                        font.pointSize: 10
                        horizontalAlignment: Text.AlignHCenter
                    }
                    background: Rectangle {
                        color: "#8B9257"
                        implicitHeight: 25
                        implicitWidth: 25
                        radius: 360
                    }
                }
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }

    }
    color: "#B4D2A9"

    Row {
        spacing: 135

        Button {
            id: menuButton
            text: "\u2630"
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
                MenuItem {
                    text: "to_do"
                    onClicked: stack.push("to_doPage.qml")
                }
            }

        }
    }

    Popup {
        id: popupAdd
        anchors.centerIn: Overlay.overlay
        width: 300
        height: 500
        modal: true
        focus: true
        Material.background: "#8B9257"
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        contentItem: Text {
            text: "New Event"
        }

        ColumnLayout {
            spacing: 25
            anchors.centerIn: parent
            TextField {
                id: newEventName
                anchors.centerIn: Overlay.overlay
                horizontalAlignment: Text.AlignHCenter
                placeholderText: qsTr("Event name")
            }
            TextField {
                id: newEventYear
                horizontalAlignment: Text.AlignHCenter
                placeholderText: qsTr("Enter year")
            }
            TextField {
                id: newEventMonth
                horizontalAlignment: Text.AlignHCenter
                placeholderText: qsTr("Enter month")
            }
            TextField {
                id: newEventDate
                horizontalAlignment: Text.AlignHCenter
                placeholderText: qsTr("Enter date")
            }
            TextField {
                id: newEventDetails
                horizontalAlignment: Text.AlignHCenter
                placeholderText: qsTr("Enter details")
            }
            Button {
                id: saveButton
                onClicked: {
                    if (event_1.getDueDate() === "NULL"){
                        event_1.setName(newEventName.text);
                        event_1.setDueDate(newEventDate.text, newEventMonth.text, newEventYear.text);
                        event_1.setDescrip(newEventDetails.text);
                        listButton1.changeValue(event_1.getName());
                        event1.changeValue(event_1.getDueDate() + "\n" + event_1.getDescrip());
                        buttonlist_to_do_do1.visible = true;
                    }
                    else if (event_2.getDueDate() === "NULL"){
                        event_2.setName(newEventName.text);
                        event_2.setDueDate(newEventDate.text, newEventMonth.text, newEventYear.text);
                        event_2.setDescrip(newEventDetails.text);
                        listButton2.changeValue(event_2.getName());
                        event2.changeValue(event_2.getDueDate() + "\n" + event_2.getDescrip());
                        buttonlist_to_do_do2.visible = true;
                    }
                    else if (event_3.getDueDate() === "NULL"){
                        event_3.setName(newEventName.text);
                        event_3.setDueDate(newEventDate.text, newEventMonth.text, newEventYear.text);
                        event_3.setDescrip(newEventDetails.text);
                        listButton3.changeValue(event_3.getName());
                        event3.changeValue(event_3.getDueDate() + "\n" + event_3.getDescrip());
                        buttonlist_to_do_do3.visible = true;
                    }

                    popupAdd.close()
                }
                Layout.alignment: Qt.AlignHCenter
                contentItem: Text{
                    color: "#8B9257"
                    text: "Save new event"
                    font.pointSize: 10
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                    implicitHeight: 25
                    implicitWidth: 25
                    radius: 360
                }
            }
        }
    }

    Popup {
        id: popupRemove
        anchors.centerIn: Overlay.overlay
        width: 300
        height: 300
        modal: true
        focus: true
        Material.background: "#8B9257"
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        contentItem: Text {
            text: "Remove Event"
        }

        ColumnLayout {
            spacing: 25
            anchors.centerIn: parent
            Material.background: "#B4D2A9"
            ComboBox {
                id: cb
                width: 200
                model: ListModel {
                        id: cbItems
                        ListElement { text: "Event 1" }
                        ListElement { text: "Event 2" }
                        ListElement { text: "Event 3" }
                    }
            }
            Button {
                id: removeButton
                onClicked: {
                    if (cb.currentText === "Event 1"){
                        event_1.setDueDate(0, 0, 0);
                        event_1.setName("NULL");
                        event_1.setDescrip("NULL");
                        buttonlist_to_do_do1.visible = false
                        paneto_do1List.visible = false
                    }
                    else if (cb.currentText === "Event 2"){
                        event_2.setDueDate(0, 0, 0);
                        event_2.setName("NULL");
                        event_2.setDescrip("NULL");
                        buttonlist_to_do_do2.visible = false
                        paneto_do2List.visible = false
                    }
                    else if (cb.currentText === "Event 3"){
                        event_3.setDueDate(0, 0, 0);
                        event_3.setName("NULL");
                        event_3.setDescrip("NULL");
                        buttonlist_to_do_do3.visible = false
                        paneto_do3List.visible = false
                    }
                    popupRemove.close()
                }
                Layout.alignment: Qt.AlignHCenter
                contentItem: Text{
                    id: rmv
                    color: "#8B9257"
                    text: "Remove event"
                    font.pointSize: 10
                    horizontalAlignment: Text.AlignHCenter

                    Connections{
                        target: todo
                        onValueChanged:rmv.text = s;
                    }
                }
                background: Rectangle {
                    implicitHeight: 25
                    implicitWidth: 25
                    radius: 360
                }
            }
        }
    }
}
