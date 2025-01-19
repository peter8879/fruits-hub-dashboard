
import 'package:fruit_hub_dashboard/features/orders/domain/shiping_address_entity.dart';

class ShippingAddressModel{
  String? name;
  String? address;
  String? city;
  String? phoneNumber;
  String? emailAddress;
  String? floorNumber;

  ShippingAddressModel({
    this.name,
    this.address,
    this.city,
    this.phoneNumber,
    this.emailAddress,
    this.floorNumber,
  });

  Map<String ,dynamic> toJson(){
        return {
      'name': name,
      'address': address,
      'city': city,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'floorNumber': floorNumber,
    };

  }
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json){
    return ShippingAddressModel(
      name: json['name'],
      address: json['address'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
      floorNumber: json['floorNumber'],
    );
  }
  ShippingAddressEntity toEntity(){
    return ShippingAddressEntity(
      name: name,
      address: address,
      city: city,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
      floorNumber: floorNumber,
    );
  }

}