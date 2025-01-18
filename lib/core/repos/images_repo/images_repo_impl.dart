import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/back_end_end_points.dart';

class ImageRepoImpl extends ImagesRepo
{
  final StorageService service;
   ImageRepoImpl(this.service);
  @override
  Future<Either<Failure, String>> uploadImage({required File image}) async{
    try{
      String url= await service.uploadFile(file: image, path: BackEndEndPoints.images);
      return right(url);
    }
    catch(e)
    {
      log(e.toString());
      return left(ServerFailure('Failed To Upload Image'));

    }
  }
  
}