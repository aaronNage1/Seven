#ifndef SLEEP_H
#define SLEEP_H

#include <QObject>

class Sleep : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString newestSleep READ gnewestSleep WRITE setNewestSleep NOTIFY newestSleepChanged)
    Q_PROPERTY(QString newestSleepQual READ newestSleepQual WRITE setNewestSleepQual NOTIFY newestSleepQualChanged)

public:
    explicit Sleep(QObject *parent = nullptr);

    float getSleepGoal();

    QString newestSleep();
    QString newestSleepQual();


private:
    float sleepGoal;
    //float weeklySleep[7];
    std::vector <int> weeklySleep;
    std::vector <int> weeklySleepQuality;
    //int weeklySleepQuality[7];

    QString m_newestSleep;
    QString m_newestSleepQual;

signals:
    void newestSleepChanged();
    void newestSleepQualChanged();

public slots:
    void callMe();

    void setNewestSleep(const QString&);
    void setNewestSleepQual(const QString&);
    void setWeeklySleep(int newSleep);
    void setWeeklySleepQuality(int newSleepQuality);

};

#endif // SLEEP_H
