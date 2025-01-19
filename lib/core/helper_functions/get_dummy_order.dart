
import 'package:fruit_hub_dashboard/features/orders/domain/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/order_product__entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/shiping_address_entity.dart';

OrderEntity getDummyOrder() {
  // Create a sample shipping address
  ShippingAddressEntity shippingAddress = ShippingAddressEntity(
    name: 'John Doe',
    phoneNumber: '123-456-7890',
    address: '123 Main St',
    floorNumber: '5th Floor',
    city: 'New York',
    emailAddress: 'johndoe@example.com',
  );

  // Create a sample list of order products
  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl: 'https://enkwliuqgbjbajwbacmm.supabase.co/storage/v1/object/public/fruits_images/images/apple_PNG12405.png',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl: 'https://enkwliuqgbjbajwbacmm.supabase.co/storage/v1/object/public/fruits_images/images/apple_PNG12405.png',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Product C',
      code: 'C789',
      imageUrl: 'https://enkwliuqgbjbajwbacmm.supabase.co/storage/v1/object/public/fruits_images/images/apple_PNG12405.png',
      price: 19.99,
      quantity: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
        (sum, product) => sum + (product.price * product.quantity),
  );

  // Create and return the OrderModel
  return OrderEntity(
    totalPrice: totalPrice,
    uID: 'user123',
    shippingAddress: shippingAddress,
    products: orderProducts,
    paymentMethod: 'Cash',
  );
}