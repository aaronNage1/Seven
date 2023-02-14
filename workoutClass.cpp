#include "workoutClass.h"
#include <QQmlEngine>
#include <QDebug>

WorkoutClass::WorkoutClass(QObject *parent)
    : QObject{parent}
{
    progress = 0;
    goal = 120; //fix this - connect it to settings
    Workout workout1 = {"No Workout",0};
    pastWorkouts.push_back(workout1);
    pastWorkouts.push_back(workout1);
    pastWorkouts.push_back(workout1);
    //qDebug() << listOfWorkouts;

}

bool WorkoutClass::wantsWorkout() {
    return wantsWorkoutOption;
}

int WorkoutClass::getGoal() {
    return goal;
}

int WorkoutClass::getProgress() {
    return progress;
}

void WorkoutClass::addProgress(int num) {
    progress = progress + num;
}

std::vector<QString> WorkoutClass::getListOfWorkouts() {
    return listOfWorkouts;
}

QString WorkoutClass::getPastWorkout(int index) {
    return pastWorkouts[index].name;
}

int WorkoutClass::getPastWorkoutTime(int index) {
    return pastWorkouts[index].mins;
}

void WorkoutClass::addPastWorkout(QString workout, int time) {
    pastWorkouts[2] = pastWorkouts[1];
    pastWorkouts[1] = pastWorkouts[0];
    pastWorkouts[0].name = workout;
    pastWorkouts[0].mins = time;
    progress = progress + time;
}

void WorkoutClass::addNewWorkout(QString workout) {
    listOfWorkouts.push_back(workout);
}

void WorkoutClass::removeWorkoutFromList(int index) {
     listOfWorkouts.erase(listOfWorkouts.begin() + index);
}

bool WorkoutClass::workoutInList(QString word) {
    for (int i = 0; i < listOfWorkouts.size(); i++) {
        if (listOfWorkouts[i] == word) {
            return true;
        }
    }
    return false;
}

void WorkoutClass::removeWorkoutFromPast(int index) {
    listOfWorkouts.erase(listOfWorkouts.begin() + index);
    listOfWorkouts.push_back("N/A");
}
