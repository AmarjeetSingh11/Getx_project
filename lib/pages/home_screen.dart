import 'package:cryptotracker/controller/coin_controller.dart';
import 'package:cryptotracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CoinController controller = Get.put(CoinController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchCoin();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,top: 50),
        child:  SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crypto Market",
                style: appStyle(
                    25,
                    Colors.white,
                    FontWeight.bold
                ),
              ),

              Obx(() =>
              controller.isLoading.value ? const Center(
                child: CircularProgressIndicator(),
              ) :
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: screenWidth,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[700]!,
                                            offset: const Offset(4, 4),
                                            blurRadius: 5,
                                          )
                                        ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                          controller.coinList[index].image.toString()
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(
                                        controller.coinList[index].name ?? "BitCoin",
                                        style: appStyle(
                                            18,
                                            Colors.white,
                                            FontWeight.w600
                                        ),
                                      ),
                                      Text(
                                        "${controller.coinList[index].priceChangePercentage24H} %",
                                        style: appStyle(
                                            18,
                                            Colors.grey,
                                            FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 10,),
                                  Text(
                                    "\$ ${controller.coinList[index].currentPrice}",
                                    style: appStyle(
                                        18,
                                        Colors.white,
                                        FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    controller.coinList[index].symbol.toString(),
                                    style: appStyle(
                                        18,
                                        Colors.grey,
                                        FontWeight.w600
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
