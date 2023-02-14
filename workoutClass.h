#ifndef WORKOUTCLASS_H
#define WORKOUTCLASS_H

#include <QObject>
#include <vector>
#include <string>
#include <QQmlEngine>
#include <QString>

struct Workout {
    QString name;
    int mins;
};

class WorkoutClass : public QObject
{
    Q_OBJECT
public:
    explicit WorkoutClass(QObject *parent = nullptr);

public slots:
    bool wantsWorkout();
    int getGoal();
    int getProgress();
    void addProgress(int);
    std::vector<QString> getListOfWorkouts();
    QString getPastWorkout(int);
    void addPastWorkout(QString, int);
    void addNewWorkout(QString);
    void removeWorkoutFromList(int);
    void removeWorkoutFromPast(int);
    int getPastWorkoutTime(int index);
    bool workoutInList(QString);

private:
    int goal;
    int progress;
    std::vector<QString> listOfWorkouts;
    std::vector<Workout> pastWorkouts;
    bool wantsWorkoutOption;
signals:

};

#endif // WORKOUT_H
