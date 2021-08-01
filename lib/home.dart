import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _currencyController = TextEditingController();

  String _value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Masks and Validations"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //CPF
              TextField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                decoration: InputDecoration(
                  hintText: "Type CPF",
                ),
              ),
              //CNPJ
              TextField(
                controller: _cnpjController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnpjInputFormatter()
                ],
                decoration: InputDecoration(
                  hintText: "Type CNPJ",
                ),
              ),
              //CEP
              TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter()
                ],
                decoration: InputDecoration(
                  hintText: "Type CEP",
                ),
              ),
              //PHONE
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
                decoration: InputDecoration(
                  hintText: "Type Phone",
                ),
              ),
              //DATE
              TextField(
                controller: _dateController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter()
                ],
                decoration: InputDecoration(
                  hintText: "Type DATE",
                ),
              ),
              //CURRENCY
              TextField(
                controller: _currencyController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true)
                ],
                decoration: InputDecoration(
                  hintText: "Type Currency",
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      //_value = _cpfController.text;
                      //_value = _cnpjController.text;
                      //_value = _cepController.text;
                      //_value = _phoneController.text;
                      //_value = _dateController.text;
                      //_value = _currencyController.text;

                      String currencyDB = _currencyController.text;

                      currencyDB = currencyDB.replaceAll('.', '');
                      currencyDB = currencyDB.replaceAll(',', '.');

                      double currencyDouble = double.parse(currencyDB);

                      var formatter = NumberFormat("#,##0.00", "pt_BR");
                      var result = formatter.format(currencyDouble);

                      //_value = "DB: $currencyDB / Exhibition: $result";

                      //for (var item in Estados.listaEstados){
                      //for (var item in Meses.listaMeses){
                      for (var item in Semana.listaDiasSemana){
                        print(item);
                      }

                    });
                  },
                  child: Text("Get Value")
              ),
              Text("Value: $_value",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
