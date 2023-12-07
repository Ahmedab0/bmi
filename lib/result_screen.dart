import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  const Result(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  String get resultPhrase {
    String textPhrase = '';
    if (result <= 18.5) {
      textPhrase = 'UnderWeight';
    } else if (result >= 18.5 && result <= 24.9) {
      textPhrase = 'Normal';
    } else if (result >= 25.0 && result <= 29.9) {
      textPhrase = 'OverWeight';
    } else if (result >= 30.0) {
      textPhrase = 'Obese';
    }
    return textPhrase;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.headlineMedium;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white70,
        title: Text(
          'Result',
          style: style!.copyWith(color: Colors.white70),

        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          color: const Color(0xffDDDDDD),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image Section
              img(context),
              const SizedBox(
                height: 12,
              ),
              // Gender Section
              text('Gender: ${isMale ? 'Male' : 'Female'}', style.copyWith(fontSize: 25,color: Colors.white70),
                  const Color(0xffd62626)),
              const SizedBox(
                height: 10,
              ),
              // Result Section
              text('Your BMI Is : ${result.toInt()}', style.copyWith(fontSize: 25,color: Colors.white70),
                  const Color(0xffff6b01)),
              const SizedBox(
                height: 10,
              ),
              //Healthiness Section
              text('Healthiness : $resultPhrase', style.copyWith(fontSize: 25,color: Colors.white70),
                  const Color(0xff01c58a)),
              const SizedBox(
                height: 10,
              ),
              // Age Section
              text('Age: $age', style.copyWith(fontSize: 25,color: Colors.white70), const Color(0xff001aa3))
            ],
          ),
        ),
      ),
    );
  }
}
//////////////////

// Text Method
Widget text(String str, TextStyle style, Color clr) {
  return Expanded(
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      //margin: const EdgeInsets.all(10.0),
      //padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                clr,
                clr.withOpacity(0.5),
              ])),
      child: Text(
        str,
        style: style,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

// Img Method
Widget img(BuildContext ctx) {
  // String url ='https://health.clevelandclinic.org/wp-content/uploads/sites/3/2021/10/womenBMI-1203809064-770x533-1-650x428.jpg';
  return Expanded(
    flex: 2,
    child: Container(
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      //margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            width: 1,
            color: Theme.of(ctx).colorScheme.primary,
          )),
      child: Image.asset('assets/images/bmi.jpg',
          fit: BoxFit.cover), //Image.network(url, fit: BoxFit.cover,),
    ),
  );
}
