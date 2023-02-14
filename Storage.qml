import QtQuick
import QtQuick.LocalStorage

Item {

    property var db

    function initDatabase() {
        print('initDatabase()')
            db = LocalStorage.openDatabaseSync("Seven", "1.0", "A box who remembers its position", 100000);
            db.transaction( function(tx) {
                print('... create table')
                tx.executeSql('CREATE TABLE IF NOT EXISTS appointments(name TEXT, starttime TEXT, endtime TEXT, date TEXT)');
            });
    }

    function storeData() {

    }

    function readData() {

    }

    Component.onCompleted: {
        initDatabase();
        readData();
    }

    Component.onDestruction: {
        storeData();
    }

}
