import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController(text: "Fabrício");
  TextEditingController _ageController = TextEditingController(text: "28");
  TextEditingController _cpfController = TextEditingController(text: "334.616.710-02");

  String _name = "";
  String _age = "";
  String _cpf = "";

  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
            child: Column(
              children: [

                TextFormField(
                  controller: _nameController,
                  onSaved: (value){
                    _name = value.toString();
                  },
                  decoration: InputDecoration(
                    hintText: "Type your name"
                  ),
                  validator: (value){

                    if(value!.isEmpty){
                      return "This field is required.";
                    }

                    if(value.length < 5){
                      return "This field is requires 5 digits.";
                    }

                    if(value.length > 20){
                      return "This field is requires less than 20 digits.";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _ageController,
                  onSaved: (value){
                    _age = value.toString();
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Type your age"
                  ),
                  validator: (value){

                    if(value!.isEmpty){
                      return "This field is required.";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _cpfController,
                  onSaved: (value){
                    _cpf = value.toString();
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  decoration: InputDecoration(
                      hintText: "Type your CPF"
                  ),
                  validator: (value){

                    if(value!.isEmpty){
                      return "This field is required.";
                    }

                    if(!CPFValidator.isValid(value)){
                      return "CPF is not valid";
                    }

                    return null;
                  },
                ),

                ElevatedButton(
                    onPressed: (){

                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        setState(() {
                          /*_name = _nameController.text;
                          _age = _ageController.text;
                          _cpf = _cpfController.text;*/
                          _message = "Name: $_name Age: $_age CPF: $_cpf";
                        });
                      }
                    },
                    child: Text('Save')
                ),
                Text(_message, style: TextStyle(
                  fontSize: 25
                ),)
              ],
            ),
        ),
      ),
    );
  }
}
