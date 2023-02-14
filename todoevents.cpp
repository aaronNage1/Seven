#include "todoevents.h"
#include <QDebug>

ToDoEvents::ToDoEvents(QObject *parent)
    : QObject{parent}
{
    this->date = 0;
    this->month = 0;
    this->year = 0;
    this->name = NULL;
    this->descrip = NULL;
}

QString ToDoEvents::getDueDate()
{
    QString DateString;
    if (this->date != 0)
        DateString = QString::number(this->year) + "/" + QString::number(this->month) + "/" + QString::number(this->date);
    else
        DateString = "NULL";
    return DateString;
}

QString ToDoEvents::getName()
{
    return this->name;
}

QString ToDoEvents::getDescrip()
{
    return this->descrip;
}

void ToDoEvents::setDueDate(int Date, int Month, int Year)
{
    this->date = Date;
    this->month = Month;
    this->year = Year;
}

void ToDoEvents::setName(QString name)
{
    this->name = name;
}

void ToDoEvents::setDescrip(QString descrip)
{
    this->descrip = descrip;
}

void ToDoEvents::callMe(){
    qDebug() << "Error, list full!";
}

void ToDoEvents::changeValue(QString a)
{
    valueChanged(a);
}

