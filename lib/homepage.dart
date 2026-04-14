import 'package:flutter/material.dart';
import 'package:flutter_application_2/addtransactionpage.dart';
import 'package:flutter_application_2/moneycontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
        Moneycontroller moneycontroller = Get.put(Moneycontroller());
    return Scaffold(
      appBar: AppBar(title: const Text("Money Manager"),
      centerTitle: true,),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(Addtransactionpage());
      },child: Icon(Icons.add,
      color: Colors.teal,),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white.withOpacity(0.5),
                width: 5.5,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Available Balance",style: TextStyle(fontSize: 18),),
                      Obx(()=>
                      Text(
                        "Rs. ${moneycontroller.availableBalance.value}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withOpacity(0.5),
                    width: 3.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_circle_down,
                          color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Income",style: TextStyle(fontSize: 12),
                          ),
                          Obx(()=>
                          Text(
                            "Rs.${moneycontroller.incomeBalance.value}",style: 
                            TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                           ),),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
                SizedBox(width: 20),
                Expanded(child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withOpacity(0.5),
                    width: 3.5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_circle_up,
                          color: Colors.white,),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expense",style: TextStyle(fontSize: 12),),
                          Obx(()=>
                          Text(
                            "Rs.${moneycontroller.expenseBalance.value}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
      SizedBox(height: 20),
      Row(children: [Text("Recent transactions")]),
      SizedBox(height: 20),
      Expanded(child: Obx(()=>
      ListView.builder(
        itemCount: moneycontroller.transactions.value.length,
        itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          //height: 100,
          decoration: BoxDecoration(
            //color: Colors.deepPurple.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.teal.shade200,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white,width: 3.5)
              ),
              padding: EdgeInsets.all(10),
              child: Center(child: Icon(Icons.receipt,
              color: Colors.teal.shade400,
              size: 35,),),),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(moneycontroller.transactions.value[index].title!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  ),
                  ), 
                Text(moneycontroller.transactions.value[index].note!),
              ],),
            ],),
              Row(children: [
                Text(
                  moneycontroller
                .transactions
                .value[index]
                .transactionType==
                "Expense"?
                "-":
                "+",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: moneycontroller
                .transactions
                .value[index]
                .transactionType==
                "Expense"?
                Colors.red:
                Colors.green
                ),
                ),
                Icon(Icons.currency_rupee,color: 
                moneycontroller
                .transactions
                .value[index]
                .transactionType==
                "Expense"?
                Colors.red:
                Colors.green),
              Text(moneycontroller.transactions.value[index].amount!.toString(),
              style: TextStyle(
                color: moneycontroller
                .transactions
                .value[index]
                .transactionType==
                "Expense"?
                Colors.red:
                Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold),),
          ],),
              ],)
        );
      }),
      ),
      ),
          ],
          
        ),
        ),
    );
  }
}