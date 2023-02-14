#include "user.h"

User::User(QObject *parent)
    : QObject{parent}
{
    m_isWorkout = true;

}

bool User::isWorkout() const
{
    return m_isWorkout;
}

void User::setIsWorkout(bool newIsWorkout)
{
    if (m_isWorkout == newIsWorkout)
        return;
    m_isWorkout = newIsWorkout;
    emit isWorkoutChanged();
}



