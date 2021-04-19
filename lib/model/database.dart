
import 'package:mysql1/mysql1.dart';
class databse{
  static var settings = new ConnectionSettings(
      host: 'mars.us-win.bisend.com',
      port: 3306,
      user: 'testmobileapp',
      password: 'TestMobileApp@2021',
      db: 'testmobileapp'
  );
}

Insertlocationtodatabase()async{
  var conn = await MySqlConnection.connect(databse.settings);
  await conn.query('');
  return "done";
}