QT += quick

SOURCES += \
        main.cpp\
        appointment.cpp\
        event.cpp\
        todoevents.cpp\
        meal.cpp\
        workoutClass.cpp\
        sleep.cpp\
        userFinal.cpp


HEADERS +=\
        appointment.h\
        event.h\
        todoevents.h\
        meal.h\
        sleep.h\
        workoutClass.h\
        userFinal.h


resources.files = main.qml SleepPage.qml MealPage.qml WorkoutPage.qml ToDoPage.qml MenuBar.qml SettingsPage.qml hamburger_menu.png HeaderBar.qml DailyView.qml WeeklyView.qml MonthlyView.qml CalendarStack.qml Event.qml eggmeal.png chickenmeal.png lunchmeal.png workoutIcon.png clockIcon.png settingsIcon.png sleeping.png moon.png CircularProgressBar.qml AppSettings.qml DataBase.qml
resources.prefix = /$${TARGET}
RESOURCES += resources

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    DataBase.qml \
    Storage.qml
