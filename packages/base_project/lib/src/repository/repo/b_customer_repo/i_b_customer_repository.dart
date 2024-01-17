// ignore_for_file: implementation_imports
import 'package:base_project/export.dart';

abstract class IBCustomerRepository {
  Future<List<BKhachHangEntity>> getCustomers();
  Future<List<BDiaPhuongEntity>> getDiaPhuongsNotAuth(
      {required String type, String? id});
  Future<List<BDiaPhuongEntity>> getDiaPhuongs(
      {required String type, String? id});
}
