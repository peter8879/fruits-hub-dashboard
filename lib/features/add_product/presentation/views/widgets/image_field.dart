import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading=false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: ()async{

          isLoading=true;
          setState(() {

          });
          try {
            await pickImage();
            widget.onFileChanged(fileImage);
          } on Exception catch (e) {
            // TODO
          }
          isLoading=false;
          setState(() {

          });
      
        },
        child: Stack(
          children: [
            Container(
               clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black45,
                )
              ),

              child:fileImage!=null? Image.file(
                  fileImage!,
                fit: BoxFit.cover,
              ): const Icon(
                Icons.image_outlined,
                size: 180,
              )
              ,
            ),
            if(fileImage!=null)
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: (){
                  fileImage=null;
                  widget.onFileChanged(fileImage);
                  setState(() {

                  });

                },
                icon: const Icon(
                    Icons.close,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
     final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage=File(image!.path);
  }
}
