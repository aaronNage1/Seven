#include "meal.h"
#include <QDebug>
using namespace std;

Meal::Meal(QObject *parent)
    : QObject{parent}
{

}

void Meal::setMeal(QString mealTypeText, QString mealInputText)
{
   if(mealTypeText == "Breakfast"){
       breakfastInput = mealInputText;
   }else if(mealTypeText == "Lunch"){
       lunchInput = mealInputText;
   }else{
      dinnerInput = mealInputText;
   }

}

QString Meal::getBreakfastInput()
{
    return breakfastInput;
}

QString Meal::getLunchInput()
{
    return lunchInput;
}

QString Meal::getDinnerInput()
{
    return dinnerInput;
}
