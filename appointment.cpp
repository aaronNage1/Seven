
#include "appointment.h"

Appointment::Appointment(QObject *parent) : QObject(parent)
{
    m_name = nullptr;
    m_group = nullptr;
    m_date = "00/00/0000";
    m_startTime = "0:00";
    m_endTime = "0:00";
    m_occurence = NULL;
    m_description = NULL;
}

Appointment::Appointment(const QString& name, const QString& group, const QString& date, const QString& startTime, const QString& endTime, const QString& occurence, const QString& description, QObject *parent): QObject(parent)
{
    m_name = name;
    m_group = group;
    m_date = date;
    m_startTime = startTime;
    m_endTime = endTime;
    m_occurence = occurence;
    m_description = description;
}

const QString &Appointment::name() const
{
    return m_name;
}

void Appointment::setName(const QString &newName)
{
    if (m_name == newName || newName == "")
        return;
    m_name = newName;
    emit nameChanged(newName);
}

const QString &Appointment::group() const
{
    return m_group;
}

void Appointment::setGroup(const QString &newGroup)
{
    if (m_group == newGroup || newGroup == "")
        return;
    m_group = newGroup;
    emit groupChanged(newGroup);
}

const QString &Appointment::date() const
{
    return m_date;
}

void Appointment::setDate(const QString &newDate)
{
//    if (m_date == newDate || newDate == "00/00/0000")
//        return;

    bool valid = checkdate(newDate);
    if (valid){
        m_date = newDate;
        emit dateChanged(newDate);
    }
}

const QString &Appointment::startTime() const
{
    return m_startTime;
}

void Appointment::setStartTime(const QString &newStartTime)
{
    if (m_startTime == newStartTime || newStartTime == "")
        return;

    bool valid = checkTime(newStartTime);

    if(valid){
        m_startTime = newStartTime;
        emit startTimeChanged(newStartTime);
    }
}

const QString &Appointment::endTime() const
{
    return m_endTime;
}

void Appointment::setEndTime(const QString &newEndTime)
{
    if (m_endTime == newEndTime || newEndTime == "")
        return;

    bool valid = checkTime(newEndTime);

    if(valid){
        m_endTime = newEndTime;
        emit endTimeChanged(newEndTime);
    }
}

const QString &Appointment::occurence() const
{
    return m_occurence;
}

void Appointment::setOccurence(const QString &newOccurence)
{
    if (m_occurence == newOccurence || newOccurence == "")
        return;
    m_occurence = newOccurence;
    emit occurenceChanged(newOccurence);
}

const QString &Appointment::description() const
{
    return m_description;
}

void Appointment::setDescription(const QString &newDescription)
{
    if (m_description == newDescription || newDescription == "")
        return;
    m_description = newDescription;
    emit descriptionChanged(newDescription);
}

void Appointment::check()
{
    qDebug() << m_name << m_group << m_date << m_startTime << m_endTime << m_occurence << m_description;
}

bool Appointment::checkTime(QString time)
{
    std::string str = time.toStdString();
    std::string delimiter = ":";

    size_t pos = 0;

    pos = str.find(delimiter);
    std::string token1 = str.substr(0,pos);

    str.erase(0, pos+delimiter.length());

    std::string token2 = str;

    for (char ch : token1){
        if (std::isdigit(ch)==0)
            return false;
    }
    for (char ch : token2){
        if (std::isdigit(ch)==0)
            return false;
    }

    int hour, minute;

    hour = stoi(token1);
    minute = stoi(token2);

    if(hour < 0 || hour > 23)
        return false;
    if(minute < 0 || minute > 59)
        return false;

    return true;

}

bool Appointment::checkdate(QString date)
{
    std::string str = date.toStdString();

    std::string delimiter = "/";

            size_t pos = 0;
            pos = str.find(delimiter);
            std::string days = str.substr(0,pos);
            str.erase(0, pos+delimiter.length());
            pos = str.find(delimiter);
            std::string months = str.substr(0,pos);;
            str.erase(0, pos+delimiter.length());
            std::string years = str.substr(0,pos);;

            int d = stoi(days);
            int m = stoi(months);
            int y = stoi(years);

  //gregorian dates started in 1582
  if (! (1582<= y )  )//comment these 2 lines out if it bothers you
     return false;
  if (! (1<= m && m<=12) )
     return false;
  if (! (1<= d && d<=31) )
     return false;
  if ( (d==31) && (m==2 || m==4 || m==6 || m==9 || m==11) )
     return false;
  if ( (d==30) && (m==2) )
     return false;
  if ( (m==2) && (d==29) && (y%4!=0) )
     return false;
  if ( (m==2) && (d==29) && (y%400==0) )
     return true;
  if ( (m==2) && (d==29) && (y%100==0) )
     return false;
  if ( (m==2) && (d==29) && (y%4==0)  )
     return true;

  return true;
}



