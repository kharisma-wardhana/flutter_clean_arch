import 'package:moonton/data/datasources/db/database_helper.dart';

abstract class TVSeriesLocalDataSource {

}

class TVSeriesLocalDataSourceImpl extends TVSeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  TVSeriesLocalDataSourceImpl({required this.databaseHelper});

}