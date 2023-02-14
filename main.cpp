#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "appointment.h"
#include "event.h"
#include "todoevents.h"
#include "meal.h"




int main(int argc, char *argv[])
{
    Appointment *appoint = new Appointment;

    Sleep *sleep = new Sleep;


    Meal breakfast;

    ToDoEvents *todo = new ToDoEvents;
        ToDoEvents *event1 = new ToDoEvents;
        ToDoEvents *listButton1 = new ToDoEvents;
        ToDoEvents *event2 = new ToDoEvents;
        ToDoEvents *listButton2 = new ToDoEvents;
        ToDoEvents *event3 = new ToDoEvents;
        ToDoEvents *listButton3 = new ToDoEvents;

    QGuiApplication app(argc, argv);

    //qmlRegisterType<WorkoutClass>("Workout",1,0,"WorkoutClass");

    WorkoutClass workoutClass;

    qmlRegisterType< Sleep > ( "Sleep", 1, 0, "Sleep" );

    qmlRegisterType< Event > ("Event", 1, 0, "Event");





    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("Sleep",sleep);

    engine.rootContext()->setContextProperty("Appointment", appoint);

    engine.rootContext()->setContextProperty("todo", todo);
    engine.rootContext()->setContextProperty("event1", event1);
    engine.rootContext()->setContextProperty("listButton1", listButton1);
    engine.rootContext()->setContextProperty("event2", event2);
    engine.rootContext()->setContextProperty("listButton2", listButton2);
    engine.rootContext()->setContextProperty("event3", event3);
    engine.rootContext()->setContextProperty("listButton3", listButton3);


    QQmlContext * rootContext = engine.rootContext();
        rootContext->setContextProperty( "MealClass" , &breakfast);


    const QUrl url(u"qrc:/Seven_Test/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    rootContext->setContextProperty("workoutClass", &workoutClass);

    return app.exec();
}
