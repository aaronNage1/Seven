#pragma once

#ifndef EVENT_H
#define EVENT_H

#include <QDebug>
#include <QObject>

#include "appointment.h"

  class Event : public QObject
{
    Q_OBJECT

    public:
    explicit Event(QObject *parent = nullptr);

     Q_INVOKABLE bool isRepeat(QString occurs);

     Q_INVOKABLE int getWeekday(const QString &m_date);

    signals:
     void weekdayChanged();

    public slots:
     float getStartTime(const QString &startTime);
     float getEndTime(const QString &endTime);



    private:

};

#endif // EVENT_H
