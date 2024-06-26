import 'package:flutter/material.dart';

void main() => runApp(App803());

class App803 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _ctrlEmail = TextEditingController();
  var _ctrlPswd = TextEditingController();
  var _ctrlName = TextEditingController();
  String _str = '';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('TextField')),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                textFieldEmail(),
                SizedBox(
                  height: 20,
                ),
                textFieldPswd(),
                SizedBox(
                  height: 20,
                ),
                textFieldName(),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '$_str',
                  textScaleFactor: 1.3,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Dialog Title'),
                          content: Text('This is the content of the dialog.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ).then((_) => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewPage()),
                        )); // Navigate to new page after dialog is closed
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  OutlineInputBorder outlineBorder() => OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.grey,
        width: 2,
      ));
  TextStyle textStyle() => TextStyle(
        color: Colors.indigo,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      );
  Widget textFieldEmail() => TextField(
        controller: _ctrlEmail,
        decoration: InputDecoration(
          border: outlineBorder(),
          hintText: 'Email',
        ),
        keyboardType: TextInputType.emailAddress,
        style: textStyle(),
        onChanged: (text) => updateText(),
      );
  Widget textFieldPswd() => TextField(
        controller: _ctrlPswd,
        decoration: InputDecoration(
          border: outlineBorder(),
          hintText: 'Password',
        ),
        obscureText: true,
        style: textStyle(),
        onChanged: (text) => updateText(),
      );
  Widget textFieldName() => TextField(
        controller: _ctrlName,
        decoration: InputDecoration(
          border: outlineBorder(),
          hintText: 'Name',
        ),
        keyboardType: TextInputType.emailAddress,
        style: textStyle(),
        onChanged: (text) => updateText(),
      );
  void updateText() => setState(() {
        _str = 'Email: ${_ctrlEmail.value.text}\n';
        _str += 'Pswd: ${_ctrlPswd.value.text}\n';
        _str += 'Name: ${_ctrlName.value.text}\n';
      });
}
class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('This is a new page'),
      ),
    );
  }
}
