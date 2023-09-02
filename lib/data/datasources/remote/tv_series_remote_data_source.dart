import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TVSeriesRemoteDataSource {}

class TVSeriesRemoteDataSourceImpl extends TVSeriesRemoteDataSource {
  final http.Client client;

  TVSeriesRemoteDataSourceImpl({required this.client});
}