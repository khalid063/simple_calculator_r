import 'package:calculator_simple_r/style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _firstNumber = TextEditingController();
  final TextEditingController _secondNumber = TextEditingController();

  List<InputNumberForCalculation> numbers = [];

  InputTake(){
    numbers.add(InputNumberForCalculation(double.parse(_firstNumber.text.trim()), double.parse(_secondNumber.text.trim())));
    print(numbers[0].firstNumber);
    print(numbers[0].secondNumber);
  }

  double calculationResult = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Result : ${calculationResult}", style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            TextFormField(
              controller: _firstNumber,
              decoration: myInputDecoretion("First Number"),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _secondNumber,
              decoration: myInputDecoretion("Second Number"),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  InputTake();
                  calculationResult = numbers[0].firstNumber! + numbers[0].secondNumber!;
                  if(mounted){
                    setState(() {});
                  }
                }, child: Text("+")),
                SizedBox(width: 5,),
                ElevatedButton(onPressed: (){
                  InputTake();
                  calculationResult = numbers[0].firstNumber! - numbers[0].secondNumber!;
                  if(mounted){
                    setState(() {});
                  }
                }, child: Text("-")),
                SizedBox(width: 5,),
                ElevatedButton(onPressed: (){
                  InputTake();
                  calculationResult = numbers[0].firstNumber! * numbers[0].secondNumber!;
                  if(mounted){
                    setState(() {});
                  }
                }, child: Text("*")),
                SizedBox(width: 5,),
                ElevatedButton(onPressed: (){
                  InputTake();
                  calculationResult = (numbers[0].firstNumber! / numbers[0].secondNumber!) as double;
                  if(mounted){
                    setState(() {});
                  }
                }, child: Text("/")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InputNumberForCalculation {
  double firstNumber, secondNumber;

  InputNumberForCalculation(this.firstNumber, this.secondNumber);
}
