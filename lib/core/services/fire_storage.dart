import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService
{
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile({required File file,required String path}) async{
    String fileName=b.basename(file.path);
    String extensionName=b.extension(file.path);
    var fileReference =storageRef.child('$path/$fileName.$extensionName');
    await fileReference.putFile(file);
    var fileUrl= await fileReference.getDownloadURL();
    return fileUrl;

  }
  
}