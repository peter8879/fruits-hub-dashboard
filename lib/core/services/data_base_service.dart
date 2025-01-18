
abstract class DataBaseService{
  Future<void> addData({required String path,required Map<String,dynamic> data,String? documentId});
  Future<Map<String,dynamic>> getData({required String id,required String path});
  Future<bool>ifDataExist({required String id,required String path});

}

