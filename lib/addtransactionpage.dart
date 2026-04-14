import 'package:flutter/material.dart';
import 'package:flutter_application_2/moneycontroller.dart';
import 'package:get/get.dart';

class Addtransactionpage extends StatelessWidget {
  const Addtransactionpage({super.key});

  @override
  Widget build(BuildContext context) {
    Moneycontroller moneycontroller = Get.put(Moneycontroller());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New",
        style: TextStyle(
          fontSize: 20,
        fontWeight: FontWeight.bold),
        ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10),
    child: 
    Column(
      children: [
        Row(children: [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(
            ()=>DropdownButton(
          value: moneycontroller.transactionType.value,
          items: [
          DropdownMenuItem(child: Text("Income"),value: "Income",),
          DropdownMenuItem(child: Text("Expense"),value: "Expense",),
        ], onChanged: (Value){
          print(Value);
          moneycontroller.transactionType.value = Value!;
        },),),
        ),
        ],),
        SizedBox(height: 15),
        TextFormField(
          controller: moneycontroller.amountcontroller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.currency_rupee),
            fillColor: Colors.white,filled: true,
            hintText: "Amount",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          ),
          SizedBox(height: 15),
          TextFormField(
          controller: moneycontroller.titlecontroller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.title),
            fillColor: Colors.white,filled: true,
            hintText: "Title",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          ),
           SizedBox(height: 15),
          TextFormField(
          controller: moneycontroller.notecontroller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.note),
            fillColor: Colors.white,filled: true,
            hintText: "Note",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: (){
            moneycontroller.Addtransactionpage();
          }, child: Text("Add Transaction")),

          SizedBox(height: 15),
          ElevatedButton(onPressed: (){
            moneycontroller.printdata();
          }, child: Text("print Transaction")),
          ],
          ),
          ),
          );
  }
}