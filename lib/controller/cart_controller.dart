import 'package:ecommerce/core/api/api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../core/api/constance.dart';
import '../core/constance/app_color.dart';
import '../data/model/cart_model.dart';
import '../data/model/home_model.dart';

abstract class CartController extends GetxController
{
  getCartProduct();
  addToCart(ProductModel model);
  incrementQuantity(int id);
  decrementQuantity(int id);
  removeFromCart(ProductModel model);
  checkOutCalc();
  checkProduct(ProductModel model);
}
class CartControllerImp extends CartController
{
  late CartModel cartDate ;
  var cartProduct = [].obs ;
  var quantity  = {}.obs;
  RxDouble total = 0.0.obs  ;
  Api api = Api();
 bool isLoading=false;

 @override
  void onInit() {
    isLoading=true;
    getCartProduct();
    super.onInit();
  }

  @override
  getCartProduct()
  {
    api.get(url: AppApiConstance.cartURl,token: token).then((value) {
      cartDate =CartModel.fromJson(value);
      for (var element in cartDate.data.cartItems)
      {
        cartProduct.add(element.product);
        quantity[element.product.id.toInt()]=element.quantity.toInt() ;
      }
    }).then( (value) {
      checkOutCalc();
      isLoading=false;
    },);
  }

  @override
  removeFromCart(ProductModel model)
  {
    cartProduct.remove(model);
    checkOutCalc();
    api.post(url: AppApiConstance.cartURl,
        body: {
          "product_id": model.id.toString(),
        },
        headers: {
          'lang':'en',
          'Authorization':token,
        }
    ).catchError((e)=>printError(info: e.toString()));
  }


  @override
  incrementQuantity(int id)
  {
    quantity[id.toInt()]++ ;
    checkOutCalc();
  }


  @override
  decrementQuantity(int id)
  {
    quantity[id.toInt()]<=1 ? Null :quantity[id.toInt()]-- ;
    checkOutCalc();
  }


  @override
  checkOutCalc()
  {
    total.value = 0 ;
    for(ProductModel item in cartProduct)
    {
      total.value += item.price * quantity[item.id.toInt()];
    }
  }


  @override
  addToCart(ProductModel model)
  {
    if(checkProduct(model))
    {
      quantity[model.id.toInt()]++ ;
    }
    else
    {
      quantity[model.id]=1;
      api.post(url: AppApiConstance.cartURl,
          body: {
            "product_id": model.id.toString(),
          },
          headers: {
            'lang':'en',
            'Authorization':token,
          }
      ).then((value) {
        if(value['status'])
        {
          Fluttertoast.showToast(
            msg: "Item added to cart successfully.",
            toastLength: Toast.LENGTH_SHORT,
            textColor: AppColor.white,
            backgroundColor: AppColor.blueGreyVeryDark ,
            gravity: ToastGravity.BOTTOM,
          );
        }
        // ignore: invalid_return_type_for_catch_error
      }).catchError((e)=>Get.snackbar('Error', e.toString()));
      cartProduct.add(model);
    }
    checkOutCalc() ;
  }


  @override
  checkProduct(ProductModel model)
  {
    for(ProductModel element in cartProduct){
      if (element.id==model.id)
      {
        return true ;
      }
    }
    return false ;
  }
}