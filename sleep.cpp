#include "sleep.h"
#include <QDebug>

Sleep::Sleep(QObject *parent): QObject(parent) {

 //   sleepGoal = 0;



    m_newestSleep = "0";
    m_newestSleepQual = "0";

}

void Sleep::setWeeklySleep(int newSleep)
{
    weeklySleep.push_back(newSleep);
}

void Sleep::setWeeklySleepQuality(int newSleepQuality)
{
    weeklySleepQuality.push_back(newSleepQuality);
}


void Sleep::callMe() {
    qDebug() << weeklySleep[0];
}



QString Sleep::newestSleep() {
    return m_newestSleep;
}

void Sleep::setNewestSleep(const QString &newSlp) {
    m_newestSleep = newSlp;
    emit newestSleepChanged();
}

QString Sleep::newestSleepQual() {
    return m_newestSleepQual;
}

void Sleep::setNewestSleepQual(const QString &newSlpQ) {
    m_newestSleepQual = newSlpQ;
    emit newestSleepQualChanged();
}





