#pragma once

#ifndef APPOINTMENT_H
#define APPOINTMENT_H

#include <QObject>
#include <QDebug>
#include <QDate>
#include <QString>

#include <iostream>
#include <stdio.h>
#include <cstring>
#include <sstream>
#include <string>

class Appointment : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString group READ group WRITE setGroup NOTIFY groupChanged)
    Q_PROPERTY(QString date READ date WRITE setDate NOTIFY dateChanged)
    Q_PROPERTY(QString startTime READ startTime WRITE setStartTime NOTIFY startTimeChanged)
    Q_PROPERTY(QString endTime READ endTime WRITE setEndTime NOTIFY endTimeChanged)
    Q_PROPERTY(QString occurence READ occurence NOTIFY occurenceChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)

public:
    explicit Appointment(QObject *parent =  nullptr);
    Appointment(const QString& name, const QString& group, const QString& date, const QString& startTime, const QString& endTime, const QString& occurence, const QString& description, QObject *parent);

    const QString &name() const;   

    const QString &group() const;    

    const QString &date() const;

    const QString &startTime() const;

    const QString &endTime() const;

    const QString &occurence() const;

    const QString &description() const;

    bool checkTime(QString time);

    bool checkdate(QString date);



signals:


    void nameChanged(QString n);

    void groupChanged(QString g);

    void dateChanged(QString d);

    void startTimeChanged(QString s);

    void endTimeChanged(QString e);

    void descriptionChanged(QString de);

    void occurenceChanged(QString o);

public slots:

    void setName(const QString &newName);
    void setGroup(const QString &newGroup);
    void setDate(const QString &newDate);
    void setStartTime(const QString &newStartTime);
    void setEndTime(const QString &newEndTime);
    void setDescription(const QString &newDescription);
    void setOccurence(const QString &newOccurence);

    void check();

private:

    QString m_name;
    QString m_group;
    QString m_date;
    QString m_startTime;
    QString m_endTime;
    QString m_occurence;
    QString m_description;


};

#endif // APPOINTMENT_H
