#ifndef MEAL_H
#define MEAL_H

#include <QObject>

enum MealTypeEnum {BREAKFAST, LUNCH, DINNER};

class Meal : public QObject
{
    Q_OBJECT
public:

    QString breakfastInput;
    QString lunchInput;
    QString dinnerInput;

    explicit Meal(QObject *parent = nullptr);

signals:

public slots:
    void setMeal(QString mealTypeText, QString mealInputText);
    QString getBreakfastInput();
    QString getLunchInput();
    QString getDinnerInput();

};

#endif // MEAL_H
