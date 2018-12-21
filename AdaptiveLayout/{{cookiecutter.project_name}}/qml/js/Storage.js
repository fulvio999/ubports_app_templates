  /*
     Function to manage sqlite Database of the Application
  */


    function getDatabase() {
       return LocalStorage.openDatabaseSync("DatabaseNameApp_db", "1.0", "StorageDatabase", 1000000);
    }

    /*
       Create Application table with a Primary key autoincrements and with three column
    */
    function createTable() {

        var db = getDatabase();
        db.transaction(
           function(tx) {
               tx.executeSql('CREATE TABLE IF NOT EXISTS myTable(id INTEGER PRIMARY KEY AUTOINCREMENT, column1 TEXT, column2 TEXT, column3 TEXT)');
           });
    }

    /*
      Delete a table whose name is in argument
    */
    function deleteTable(tableName) {

        var db = getDatabase();
        db.transaction(
           function(tx) {
                tx.executeSql('DELETE FROM '+tableName);
           });
    }

    /*
      Insert a new item
    */
    function insertItem(value1, value2, value3){

        var db = getDatabase();
        var res = "";
        db.transaction(function(tx) {

            var rs = tx.executeSql('INSERT INTO myTable (column1, column2, column3) VALUES (?,?,?);', [value1, value2, value3]);
            if (rs.rowsAffected > 0) {
                res = "OK";
            } else {
                res = "Error";
            }
        }
        );
        return res;
    }

    /*
       Update an item with the provided id
    */
    function updateItem(value1, value2, value3, id){

        var db = getDatabase();
        var res = "";

        db.transaction(function(tx) {
            var rs = tx.executeSql('UPDATE myTable SET column1=?, column2=?, column3=? WHERE id=?;', [value1, value2, value3]);
            if (rs.rowsAffected > 0) {
                res = "OK";
            } else {
                res = "Error";
            }
        }
        );
        return res;
    }

    /*
       Load all the items
    */
    function getAllItem(){

        momentsListModel.clear();
        var db = getDatabase();

        db.transaction(function(tx) {
           var rs = tx.executeSql('SELECT value1, value2, value3 FROM myTable');
           for(var i =0;i < rs.rows.length;i++) {
              /* on qml file use the table field name to get filed value */
           }
          }
        );
     }

    /*
       Load the item with the id is in argument
    */
    function getItemById(id){

        var db = getDatabase();
        var rs = "";
        db.transaction(function(tx) {
             rs = tx.executeSql('SELECT * FROM myTable where id=?;',[id]);
           }
        );

        return rs;
    }

    /*
      Return all the Items
    */
    function getAllItems(){

         var db = getDatabase();
         var rs = "";
         db.transaction(function(tx) {
            rs = tx.executeSql('SELECT * FROM myTable');

          }
        );

        return rs;
    }


    /*
       Clean the database
    */
    function cleanAllDatabase(){

         var db = getDatabase();

         db.transaction(function(tx) {
             var rs = tx.executeSql('DELETE FROM myTable;');
            }
         );
    }
