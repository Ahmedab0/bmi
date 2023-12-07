import 'dart:math';
import 'package:bmi_app/result_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double _height = 100.0;
  int age = 18;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Body Math Index',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white70)),
        centerTitle: true,
      ),
      body: SafeArea(
        //minimum: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color(0xffDDDDDD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Gender Section
              Expanded(
                child: Row(
                  children: [
                    gender('male'),
                    const SizedBox(width: 12),
                    gender('female'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Slider ////
              Expanded(child: _slider()),
              const SizedBox(height: 12),
              // Float Button
              Expanded(
                child: Row(
                  children: [
                    floatBtn('weight'),
                    const SizedBox(width: 12,),
                    floatBtn('age'),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Elevated Button
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/18,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2),)),
                    backgroundColor: MaterialStateProperty.all(const Color(0xff0074c7)),
                    foregroundColor: MaterialStateProperty.all(Colors.white70),
                    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                  ),
                  onPressed: () {
                    var result = weight / pow(_height/100, 2);
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Result(result: result,age: age,isMale: isMale,)),);
                    /*print('age : $age');
                    print('weight: $weight');
                    print('height: ${_height.round()}');*/

                  },
                  child: const Text('Calculate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Gender Box Section
  Widget gender(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          isMale = (type == 'male') ? true : false;
        }),
        child: Container(
          decoration: BoxDecoration(
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? const Color(0xff0074c7)
                : const Color(0xFF84B4D4),//Color(0xff5fa0ce),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female),
              const SizedBox(height: 10),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Slider Section
  Widget _slider() {
    return Container(
      //padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF84B4D4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Height',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${_height.round()}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Text(' CM',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Slider(
            value: _height,
            max: 270.0,
            onChanged: (newVal) {
              setState(() {
                _height = newVal;
              });
            },
          ),
        ],
      ),
    );
  }

// Increment Section

  Widget floatBtn(String type) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF84B4D4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
                type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.small(
                    heroTag: type == 'age' ? 'Age++' : 'Weight++',
                    onPressed: () => setState(() {
                      type == 'age' ? age++ : weight++;
                    }),
                    backgroundColor: const Color(0xff0074c7),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.small(
                    heroTag: type == 'age' ? 'Age--' : 'Weight--',
                    onPressed: () => setState(() {
                      type == 'age' ? age-- : weight--;
                    }),
                    backgroundColor: const Color(0xff0074c7),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
