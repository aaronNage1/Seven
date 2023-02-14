import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.4

// Page for meal tracker
        Item{
            id: meal
        // Everything will be kept in an item as a component can only have one child.
            property int displayValue: 0
            HeaderBar {
                id: headerBar
            }

                Text{ //Today's Date DAY
                    id: day
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: headerBar.bottom
                        topMargin: 10
                    }

                    font.pointSize: 30
                    text: "THURSDAY" //will change depending on c++ data
                }

                Text{ //Today's Date month, day, year
                    id: monthYear
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: day.bottom
                    }

                    font.pointSize: 15
                    text: "May 1 2022" //will change depending on c++ data
                }

                Button{ //left arrow
                    id: leftArrow
                    anchors {
                        right: day.left
                        top: day.verticalCenter
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
                        top: day.verticalCenter
                        left: day.right
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


                    Column { //column for break,lunch,dinner circles
                        id: pictureColumn
                        spacing: 60
                        height: 40
                        anchors {
                            top: monthYear.bottom
                            left: parent.left
                            leftMargin: 20
                            topMargin: 50
                        }

                        Rectangle {
                            id: eggPic
                             width: 90
                             height: width
                             color: "#687A12"
                             border.color: "#687A12"
                             border.width: 1
                             radius: width*0.5
                             Text {//breakfast title
                                 width: 40
                                 text: "Breakfast"
                                 font.pointSize: 14
                                 anchors {
                                     bottom: parent.top
                                     horizontalCenter: parent.horizontalCenter
                                 }
                             }
                             Image{ //egg picture
                                 source: "eggmeal.png"
                                 height:70
                                 width:70
                                 anchors {
                                 horizontalCenter: parent.horizontalCenter
                                 verticalCenter: parent.verticalCenter
                                 }
                             }
                             Rectangle { //breakfast text
                                 color: "#5C6C0E"; width: 220; height: 30;
                                 anchors {
                                     verticalCenter: parent.verticalCenter
                                     left: parent.right
                                     leftMargin: 5

                                 }

                                 Text {
                                     id:breakfastText
                                     text: " " + breakfastInput.text
                                     font.pointSize: 18
                                     color: "white"

                                 }
                             }
                        }
                        Rectangle {
                            id: lunchPic
                             width: 90
                             height: width
                             color: "#687A12"
                             border.color: "#687A12"
                             border.width: 1
                             radius: width*0.5
                             Text {//lunch title
                                 width: 35
                                 text: "Lunch"
                                 font.pointSize: 14
                                 anchors {
                                     bottom: lunchPic.top
                                     horizontalCenter: lunchPic.horizontalCenter

                                 }
                             }

                             Image { //lunch pic
                                 source: "lunchmeal.png"
                                 height:70
                                 width:70
                                 anchors {
                                 horizontalCenter: parent.horizontalCenter
                                 verticalCenter: parent.verticalCenter
                                 }
                             }

                             Rectangle { //lunch text
                                 color: "#5C6C0E"; width: 220; height: 30
                                 anchors {
                                     verticalCenter: parent.verticalCenter
                                     left: parent.right
                                     leftMargin: 5
                                 }
                                 Text {
                                     id:lunchText
                                     font.pointSize: 18
                                     color: "white"

                                 }
                             }
                        }


                        Rectangle {
                             id: chickenPic
                             width: 90
                             height: width
                             color: "#687A12"
                             border.color: "#687A12"
                             border.width: 1
                             radius: width*0.5
                             Text {//dinner title
                                 width: 35
                                 text: "Dinner"
                                 font.pointSize: 14
                                 anchors {
                                     bottom: chickenPic.top
                                     horizontalCenter: chickenPic.horizontalCenter
                                 }
                             }
                             Image { //chicken pic
                                 source: "chickenmeal.png"
                                 height:65
                                 width:65
                                 anchors {
                                 horizontalCenter: parent.horizontalCenter
                                 verticalCenter: parent.verticalCenter
                                 }
                             }

                             Rectangle {
                                 color: "#5C6C0E"; width: 220; height: 30
                                 anchors {
                                     verticalCenter: parent.verticalCenter
                                     left: parent.right
                                     leftMargin: 5
                                 }
                                 Text {
                                     id:dinnerText
                                     text: " " + dinnerInput.text
                                     font.pointSize: 18
                                     color: "white"

                                 }
                             }
                        }

                    }


                    //circle break,lunch,dinner titles






                    RoundButton{ //plus button for adding meal input
                    id:addMeal
                    anchors {
                        top: monthYear.bottom
                        left: rightArrow.right
                    }

                    onClicked: mealInputPopup.open()

                        contentItem: Text{
                            text:"+"
                            font.pointSize: 25
                            color: addMeal.down ? "#8B9257":"black"
                            horizontalAlignment: Text.AlignHCenter
                        }

                        background: Rectangle {
                                color: "transparent"
                                border.color: "black"
                                implicitHeight: 40
                                implicitWidth: 40
                                radius: 360
                        }

                        Popup { //window for inputting meals of the day
                            padding: 5
                            width: 220
                            height : 200
                            id: mealInputPopup
                            anchors.centerIn: Overlay.overlay



                            Column{
                                id: popupColumn
                                anchors.fill: parent
                                //text inputs for break,lunch,dinner on pop up window
                                Text{
                                    horizontalAlignment: Text.AlignHCenter
                                    text:"Enter Meal"
                                    font.pointSize: 14
                                    font.bold : true


                                }

                                Button{
                                    id:mealButton
                                    height: 40;


                                    onClicked: mealMenu.open()

                                    contentItem: Text{
                                        id: mealText
                                        text: "Meal Group"
                                        font.pointSize: 20
                                        color: "grey"
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                    Menu{   //Get Adam to show you how the menu works
                                        id: mealMenu
                                        MenuItem{
                                            text: "Breakfast"
                                            onClicked: mealText.text = "Breakfast"
                                        }
                                        MenuItem{
                                            text: "Lunch"
                                            onClicked: mealText.text = "Lunch"

                                        }
                                        MenuItem{
                                            text: "Dinner"
                                            onClicked: mealText.text = "Dinner"

                                        }
                                    }
                                }

                                TextField{
                                    id: mealInput

                                    text: "Enter meal here"

                                    onFocusChanged: {
                                        if (focus)
                                            selectAll()
                                    }
                                    selectionColor: "grey"

                                }

                                Row {
                                    Button{ //ok button
                                    id: okMeal


                                    //need to save data to cpp file
                                    onClicked: {

                                        mealInputPopup.close()
                                        MealClass.setMeal(mealText.text, mealInput.text)
                                        breakfastText.text = MealClass.getBreakfastInput()
                                        lunchText.text = MealClass.getLunchInput()
                                        dinnerText.text = MealClass.getDinnerInput()
                                    }



                                    contentItem: Text{
                                        text: "OK"
                                        font.pointSize: 20
                                        color: okMeal.down ? "white":"black"
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                    background: Rectangle {
                                            color: okMeal.down ? "#8B9257" : "white"
                                            implicitHeight: 40
                                            implicitWidth: popupColumn.width/2
                                            border.color: "black"

                                    }

                                    } // ok button

                                    Button{ //cancel button
                                    id: cancelMeal


                                    onClicked: mealInputPopup.close()


                                    contentItem: Text{
                                        text: "Cancel"
                                        font.pointSize: 20
                                        color: cancelMeal.down ? "white":"black"
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                    background: Rectangle {
                                            color: cancelMeal.down ? "#8B9257" : "white"
                                            implicitHeight: 40
                                            implicitWidth: popupColumn.width/2
                                            border.color: "black"

                                    }

                                    } // cancel button

                                } //row


                            } //column


                    } //popup


                    } // round button




            Row {
                id: waterButton
                height: 50;
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 5
                    horizontalCenter: parent.horizontalCenter
                }

                Button{ //Subtract water button
                id:minusWater


                height: 50; width: 100

                onClicked: { //add to water cup counter
                    meal.displayValue -= 1

                }

                contentItem: Text{
                    text: "-"
                    font.pointSize: 20
                    color: minusWater.down ? "#8B9257":"black"
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                        color: minusWater.down ? "black":"#5C6C0E"
                        implicitHeight: 40
                        implicitWidth: 40
                        radius: 300
                }

         }
                    Button{ //Add water button

                    id:plusWater


                    height: 50; width: 100

                    onClicked: { //add to water cup counter
                        meal.displayValue += 1

                    }

                    contentItem: Text{
                        text: "+"
                        font.pointSize: 20
                        color: plusWater.down ? "#8B9257":"black"
                        horizontalAlignment: Text.AlignHCenter
                    }
                    background: Rectangle {
                            color: plusWater.down ? "black":"#5C6C0E"
                            implicitHeight: 40
                            implicitWidth: 40
                            radius: 360
                    }

             }//add water
          }//row

                    Text{ //Cups logged text
                        id: waterLogged
                        width: 40
                        height: 40
                        anchors {
                            bottom: waterButton.top
                            horizontalCenter: parent.horizontalCenter
                        }
                        horizontalAlignment: Text.AlignHCenter
                        text: "Cups Logged: " + displayValue.toString()


                    }

        }//Item


