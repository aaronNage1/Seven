#include "appointment.h"
#include "event.h"


Event::Event(QObject *parent) : QObject(parent)
{

}

bool Event::isRepeat(QString occurs){
    if (occurs == "Once")
        return false;
    return true;
}


int Event::getWeekday(const QString &m_date)
{
    std::string str = m_date.toStdString();

    std::string delimiter = "/";

            size_t pos = 0;
            pos = str.find(delimiter);
            std::string days = str.substr(0,pos);
            str.erase(0, pos+delimiter.length());
            pos = str.find(delimiter);
            std::string months = str.substr(0,pos);;
            str.erase(0, pos+delimiter.length());
            std::string years = str.substr(0,pos);;

            int day = stoi(days);
            int month = stoi(months);
            int year = stoi(years);

            int mon;
               if(month > 2)
                  mon = month; //for march to december month code is same as month
               else{
                  mon = (12+month); //for Jan and Feb, month code will be 13 and 14
                  year--; //decrease year for month Jan and Feb
               }
               int y = year % 100; //last two digit
               int c = year / 100; //first two digit
               int w = (day + floor((13*(mon+1))/5) + y + floor(y/4) + floor(c/4) + (5*c));
               w = (w+1) % 7;
               return w;
}

float Event::getStartTime(const QString &startTime)
{
    std::string str = startTime.toStdString();
    if(str.compare("0:00")==0)
        return 0;
    std::string delimiter = ":";

    size_t pos = 0;
    pos = str.find(delimiter);
    std::string token1 = str.substr(0,pos);
    str.erase(0, pos+delimiter.length());
    std::string token2 = str;

    int minute = stoi(token2);
    minute = floor(minute*100/60);
    int hour = stoi(token1);
    return hour+minute/100;
}

float Event::getEndTime(const QString &endTime)
{
    std::string str = endTime.toStdString();
    if(str.compare("0:00")==0)
        return 0;
    std::string delimiter = ":";

    size_t pos = 0;
    pos = str.find(delimiter);
    std::string token1 = str.substr(0,pos);
    str.erase(0, pos+delimiter.length());
    std::string token2 = str;

    int minute = stoi(token2);
    minute = floor(minute*100/60);
    int hour = stoi(token1);
    return hour+minute/100;
}
