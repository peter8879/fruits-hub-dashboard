
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_base_service.dart';

class FireStoreService implements DataBaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data,String? documentId}) async{
    if(documentId!=null) {
      await firestore.collection(path).doc(documentId).set(data);
    }
    else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({required String id, required String path}) async{

    var data= await firestore.collection(path).doc(id).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> ifDataExist({required String id, required String path}) async{
   var data=await firestore.collection(path).doc(id).get();
   return data.exists;
  }

  

}