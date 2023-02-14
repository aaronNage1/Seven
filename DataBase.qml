import QtQuick
import QtQuick.LocalStorage
import QtQml

QtObject {
    id: storage

    property var _db

    property string dbID: "Seven"

    property string dbVersion: "1.0"

    property string dbDescription: "Seven application database"

    function _database() {
        if (_db)
            return _db

        try {
            let db = LocalStorage.openDatabaseSync(dbID, dbVersion, dbDescription)

            db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXITS calendar (
                )');
            })

            db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS events (
                    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    event_name TEXT
                    event_type TEXT
                 )');
            })

            db.transaction(function (tx) {
                tx.exucuteSql('CREATE TABLE IF NOT EXIST appointements (
                appointement_starttime TEXT,
                appointement_endtime TEXT,
                appointment_repeat INTEGER,
                appointment_description TEXT,
                )');
            })

            db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXIST deadlines (
                   deadline_id INTEGER PRIMARY KEY AUTOINCREMENT,
                   deadline_name TEXT
                   deadline_duedate TEXT
                   deadline_description TEXT,
                   event_id,
                   FOREIGN KEY(event_id) REFERENCES events(event_id)
                )');
            })

            db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXIST meals (
                    meal_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    meal_name TEXT
                    meal_type INTEGER
                )');
            })

            _db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXIST todos (
                    todo_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    todo_name TEXT,
                    todo_type INTEGER,
                    todo_description TEXT
                )');
            })

            db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXIST workouts (
                    workout_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    workout_type TEXT,
                    workout_time INTEGER

                )')
            })

            db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXIST sleeps (
                    sleep_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    sleep_quality INTEGER,
                    sleep_time INTEGER
                )')
            })

        _db = db
    } catch (error) {
        console.log("Error opening database: " + error)
    };
        return _db
    }

    function getEvents() {
        let events = []
        storage._database().transaction(function (tx) {
           let results = tx.executeSql('SELECT * FROM events')
           for (let i = 0; i < results.row.length; i++) {
               let eventRow = result.rows.item(i)
               let eventId = eventRow.event_id
               events.push({
                    "eventName": eventRow.event_name,
                    "eventId": eventId,
                    "eventType": eventRow.eventRow.event_type,
               })
           }
        })
        return events
    }

    function newEvent(eventName) {
        let results
        storage._database().trabsaction(function (tx) {
            results = tx.exucuteSql("INSERT INTO events (event_name) VALUES(?)", [eventName])
        })
        return results
    }

    function getAppointments() {
        let appointments = []
        storage._database().transaction(function (tx) {
            let results = tx.executeSql('SELECT * FROM appointments')
            for (let i = 0; i < results.row.length; i++) {
                let appointmentRow = results.row.item(i)
                let appointmentId = appointmentRow.appointment_id
                appointments.push({
                     "appointmentName": appointmentRow.event_name,
                     "appointmentId": appointmentId,
                     "appointmentStartTime": appointmentRow.event_starttime,
                     "appointmentEndTime": appointmentRow.event_endtime,
                     "appointmentRepeat": appointmentRow.appointment_repeat
                })
            }
        })
        return appointments
    }

    function newAppointment(appointmentName) {
        let results
        storage._database().transaction(function (tx) {
            results = tx.executeSql("INSERT INTO appointments (appointment_name) VALUES(?)", [appointmentName])
        })
        return results
    }

    function cancelAppointment(appointmentId) {
        storage._database().transaction(function (tx) {
            tx.executeSql("DELETE FROM appointments WHERE appointment_id = ?", [appointmentId])
        })
    }

    function getDeadlines() {
        let deadlines = []
        storage._database().transaction(function (tx) {
            let results = tx.executeSql('SELECT * FROM deadlines')
            for (let i = 0; i < results.row.length; i++) {
                let deadlinesRow = results.row.item(i)
                let deadlineId = deadlinesRow.deadline_id
                deadlines.push({
                    "deadlineName": deadlinesRow.deadline_name,
                    "deadlineID": deadlineId,
                    "deadlineDueDate": deadlinesRow.deadline_duedate,
                    "deadlineDescription": deadlinesRow.deadline_description
                })
            }
        })
        return deadlines
    }

    function newDeadline(deadlineName) {
        let results
        storage._database().transaction(function (tx){
            results = tx.executeSql("INSERT INTO deadlines (deadline_name) VALUES(?)", [deadlineName])
        })
        return results
    }

    function cancelDeadline(deadlineId) {
        storage._database().transaction(function (tx) {
            tx.executeSql("DELETE FROM deadlines WHERE deadline_id = ?", [deadlineId])
        })
    }


    function getMeals() {
        let meals = []
        storage._database().transactions(function (tx) {
            let results = tx.executeSql('SELECT * FROM meals')
            for (let i = 0; i < results.row.length; i++) {
                let mealsRow = results.row.item(i)
                let mealId = mealsRow.meal_id
                meals.push({
                    "mealName": mealsRow.meal_name,
                    "mealId": mealId,
                    "mealType": mealsRow.meal_type
                })
            }
        })
        return meals
    }

    function newMeal(mealName) {
        let results
        storage._database().transaction(function (tx) {
            results = tx.executeSql("INSERT INTO meals (meal_name) VALUES(?)", [mealName])
        })
    }

    function getToDos() {
        let todos = []
        storage._database().transactions(function (tx) {
            let results = tx.executeSql('SELECT * FROM meals')
            for (let i = 0; i < results.row.length; i++) {
                let todosRow = results.row.item(i)
                let todoId = todosRow.todo_id
                todos.push({
                    "todoName": todosRow.todo_name,
                    "todoId": todoId,
                    "todoType": todosRow.todo_type
                })
            }
        })
        return todos
    }

    function newTodo(todoName) {
        let results
        storage._database().transaction(function (tx) {
            results = tx.executeSql("INSERT INTO todos (todo_name) VALUES(?)", [todoName])
        })
    }

    function getWorkouts() {
        let workouts = []
        storage._database().transactions(function (tx) {
            let results = tx.executeSql('SELECT * FROM workouts')
            for (let i = 0; i < results.row.length; i++) {
                let workoutsRow = results.row.item(i)
                let workoutId = workoutsRow.wokrout_id
                workouts.push({
                    "workoutType": workoutsRow.workout_type,
                    "workoutId": workoutId,
                    "workoutTime": workoutsRow.workout_time
                })
            }
        })
        return workouts
    }

    function newWorkout(workoutType) {
        let results
        storage._database().transaction(function (tx) {
            results = tx.executeSql('INSERT INTO workouts (workout_type) Values(?)', [workoutType])
        })
    }


    function getSleeps() {
        let sleeps = []
        storage._database().transactions(function (tx) {
            let results = tx.executeSql('SELECT * FROM workouts')
            for (let i = 0; i < results.row.length; i++) {
                let sleepsRow = results.row.item(i)
                let sleepId = workoutsRow.wokrout_id
                sleeps.push({
                    "sleepQuality": sleepsRow.sleep_quality,
                    "workoutId": sleepId,
                    "workoutTime": sleepsRow.sleep_time
                })
            }
        })
        return sleeps
    }


}

