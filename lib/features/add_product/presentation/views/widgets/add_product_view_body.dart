import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cuibits/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   AutovalidateMode autoValidateMode=AutovalidateMode.disabled;
   late String name,code,description;
   late num price,expirationMonths,numOfCalories,unitAmount;
    bool isFeatured=false,isOrganic=false;
    File? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child:  Column(
            children: [
               CustomTextFormField(
                hint: 'Product Name',
                keyboardType: TextInputType.text,
                onSaved: (value){
                  name=value!;
                },


              ),
              const SizedBox(height: 16,),
               CustomTextFormField(
                hint: 'Product Price',
                keyboardType: TextInputType.number,
                 onSaved: (value){
                  price=num.parse(value!);
                 },
              ),
              const SizedBox(height: 16,),
               CustomTextFormField(
                hint: 'Product Code',
                keyboardType: TextInputType.text,
                 onSaved: (value){
                  code =value!.toLowerCase();
                 },
              ),
              const SizedBox(height: 16,),
               CustomTextFormField(
                hint: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
                 onSaved: (value){
                  description=value!;
                 },


              ),
              const SizedBox(height: 16,),
              CustomTextFormField(
                hint: 'Expiration Months',
                keyboardType: TextInputType.number,
                onSaved: (value){
                  expirationMonths=num.parse(value!);
                },
              ),
              const SizedBox(height: 16,),
              CustomTextFormField(
                hint: 'Number Of Calories',
                keyboardType: TextInputType.number,
                onSaved: (value){
                  numOfCalories=num.parse(value!);
                },
              ),
              const SizedBox(height: 16,),
              CustomTextFormField(
                hint: 'Unit Amount',
                keyboardType: TextInputType.number,
                onSaved: (value){
                  unitAmount=num.parse(value!);
                },
              ),
              const SizedBox(height: 16,),
              IsFeaturedCheckBox(
                  onChanged: (value){
                    isFeatured=value;

                  }
              ),
              const SizedBox(height: 16,),
              IsOrganicCheckBox(
                  onChanged: (value){
                    isOrganic=value;

                  }
              ),
              const SizedBox(height: 16,),
              ImageField(
                onFileChanged: (fileImage){
                  image=fileImage;

                },
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  text: 'Add Product',
                  onPressed: (){
                    if(image!=null)
                      {
                        if(_formKey.currentState!.validate())
                          {
                            List<ReviewModel> reviews=[];
                            _formKey.currentState!.save();
                            AddProductInputEntity addProductInputEntity=AddProductInputEntity(
                              name: name,
                              code: code,
                              description: description,
                              price: price,
                              isFeatured: isFeatured,
                              image: image!,
                              expirationMonths: expirationMonths.toInt(),
                              isOrganic: isOrganic,
                              numberOfCalories: numOfCalories.toInt(),
                              unitAmount: unitAmount.toInt(),
                              reviews: reviews
                            );
                            AddProductCubit.get(context).addProduct(addProductInputEntity);
                          }

                        else
                          {
                            autoValidateMode=AutovalidateMode.always;
                          }

                      }
                    else
                      {
                        showError(context);
                      }

                  },
                ),
              )






            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
        backgroundColor: Colors.red,
      )
    );
  }
}
