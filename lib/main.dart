import 'package:flutter/material.dart';
import 'package:flutter/src/material/stepper.dart';
import 'package:flutter/src/material/raised_button.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sketchers',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Stepper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step){
          setState(() {
            this._currentStep=step;
          }
          );
        },
        onStepContinue: (){
          setState(() {
            if(this._currentStep < this._mySteps().length-1){
              this._currentStep = this._currentStep + 1;
            }
            else{
              print('Completed, check fields.');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if(this._currentStep > 0){
              this._currentStep = this._currentStep - 1;
            }

            else{
              this._currentStep = 0;
            }
          });
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps=[
      Step(
        title: Text('Upload Photo'),
        content: new RaisedButton(onPressed: null
          , textColor: Colors.black, color: Colors.white,
        child: new Text("Upload Photo"),
        ),
        isActive: _currentStep>=0,
      ),
      Step(
        title: Text('Step 2'),
        content: TextField(),
        isActive: _currentStep>=1,
      ),
      Step(
        title: Text('Step 3'),
        content: TextField(),
        isActive: _currentStep>=2,
      ),


    ];
    return _steps;
  }
}
