import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.4


Item {
    anchors.fill: parent
    StackView {
        id: calendarstack
        anchors.fill: parent
        initialItem: "DailyView.qml"
    }
}
