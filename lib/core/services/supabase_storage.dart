import 'dart:io';

import 'package:fruit_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;
class SupabaseStorageService implements StorageService{
  static createBucket(String bucketName) async
  {
   var buckets=await _supabase.client.storage.listBuckets();
   bool isBucketExist=false;
   for(int i=0;i<buckets.length;i++)
     {
       if(buckets[i].name==bucketName)
         {
           isBucketExist=true;
         }
     }
   if(isBucketExist==false) {
     await _supabase.client.storage.createBucket(bucketName);
   }
  }
  static late Supabase _supabase;
 static  init()async
  {

    _supabase= await Supabase.initialize(
      url: 'https://enkwliuqgbjbajwbacmm.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVua3dsaXVxZ2JqYmFqd2JhY21tIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNDQ3NjUyMCwiZXhwIjoyMDUwMDUyNTIwfQ.jjqoZ7yQmnWaIWzBkM_b5BDpi5LiB6u540PH5Za8pFQ',
    );

  }
  @override
  Future<String> uploadFile({required File file, required String path}) async{
    String fileName=b.basename(file.path);
    String extensionName=b.extension(file.path);
  var imagePath= await _supabase.client.storage.from('fruits_images').upload('$path/$fileName', file);

    final String result =  _supabase.client
        .storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName');

  return result;
  }
  
}