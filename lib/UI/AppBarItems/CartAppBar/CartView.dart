import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/PaymentWidget.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/cubit/CartViewModel.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  CartViewModel viewModel = CartViewModel(
      cartUseCase: injectRemoveFromCartUseCase(),
      updateCartUseCase: injectUpdateCartUseCase(),
      getCartUseCase: injectGetCartUseCase());

  static String totalPrice = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartStates>(
        bloc: viewModel..getAllCart(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                InkWell(
                  onTap: () => viewModel.clearAllCart(),
                  child: const Row(
                    children: [
                      Icon(Icons.clear_all_rounded),
                      Text('Clear Cart'),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                )
              ],
              title: const Text(
                'Cart',
                style: TextStyle(
                    color: MyColors.darkSlateGray, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: state is SuccessCartState
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: MyColors.lightSeaGreen),
                                color: MyColors.darkSlateGray,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: MyColors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Image.network(
                                    viewModel.cartList[index].product
                                            ?.imageCover ??
                                        '',
                                    height: 113.h,
                                    width: 120.w,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 18.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          viewModel.cartList[index].product
                                                  ?.title ??
                                              '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: MyColors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                          'EGP ${viewModel.cartList[index].price ?? 0}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: MyColors.white,
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 270.w,
                            right: 15.w,
                            top: 100.h,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: MyColors.lightYellow,
                                      border: Border.all(
                                          color: MyColors.darkSlateGray,
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(25.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          int counter = viewModel
                                              .cartList[index].count!
                                              .toInt();
                                          counter++;
                                          viewModel.updateCartItem(
                                              viewModel.cartList[index].product
                                                      ?.id ??
                                                  '',
                                              counter);
                                        },
                                        icon: const Icon(
                                          Icons.add_box_outlined,
                                          color: MyColors.darkSlateGray,
                                        ),
                                      ),
                                      Text(
                                        '${viewModel.cartList[index].count!.toInt()}',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: MyColors.darkSlateGray),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          int counter = viewModel
                                              .cartList[index].count!
                                              .toInt();
                                          counter--;
                                          viewModel.updateCartItem(
                                              viewModel.cartList[index].product
                                                      ?.id ??
                                                  '',
                                              counter);
                                        },
                                        icon: const Icon(
                                          Icons
                                              .indeterminate_check_box_outlined,
                                          color: MyColors.darkSlateGray,
                                        ),
                                      ),
                                    ],
                                  )),
                              // CartItemsCounter(
                              //   counter: viewModel.cartList[index].count!.toInt(),
                              // ),
                            ),
                          ),
                          Positioned(
                            left: 270.w,
                            right: 25.w,
                            bottom: 80.h,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    viewModel.removeCartItem(
                                        viewModel.cartList[index].product?.id ??
                                            '');
                                  },
                                  icon: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: MyColors.salmon,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: SvgPicture.asset(
                                        Assets.deleteIcon,
                                        color: MyColors.white,
                                      ))),
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: viewModel.cartList.length)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total price: ${viewModel.totalPrice}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        totalPrice = viewModel.totalPrice.toString();
                        showAddTaskBottomSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          backgroundColor: MyColors.darkSlateGray,
                          foregroundColor: MyColors.white),
                      child: Row(
                        children: [
                          const Text(
                            'Check Out',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const Icon(Icons.arrow_forward)
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }

  void showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (buildContext) {
          return PaymentWidget();
        });
  }
}
