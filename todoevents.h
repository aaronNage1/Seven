#ifndef TODOEVENTS_H
#define TODOEVENTS_H

#include <QObject>
#include <QVector>

class ToDoEvents : public QObject
{
    Q_OBJECT
public:
    explicit ToDoEvents(QObject *parent = nullptr);

private:
    int date;
    int month;
    int year;
    QString name;
    QString descrip;


signals:
    void valueChanged(QString s);

public slots:
    QString getDueDate();
    QString getName();
    QString getDescrip();
    void setDueDate(int Date, int Month, int Year);
    void setName(QString name);
    void setDescrip(QString descrip);
    void callMe();
    void changeValue(QString a);
};

#endif // TODOEVENTS_H
