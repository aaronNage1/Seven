#ifndef USERFINAL_H
#define USERFINAL_H

#include <QObject>

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isWorkout READ isWorkout WRITE setIsWorkout NOTIFY isWorkoutChanged)


public:
    explicit User(QObject *parent = nullptr);
    bool isWorkout() const;

public slots:

    void setIsWorkout(bool newIsWorkout);

signals:

    void isWorkoutChanged();

private:
    bool m_isWorkout;
};

#endif // USERFINAL_H

