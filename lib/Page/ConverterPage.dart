import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live_currency_rate/live_currency_rate.dart';
import 'package:project_akhir_mobile/Component/CommonField.dart';
import 'package:project_akhir_mobile/Component/ConvertButton.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  List<String> listWaktuBagian = <String>['WIB', 'WITA', 'WIT', 'UTC'];
  late String waktuBagian = listWaktuBagian.first;
  late String timeString;
  late Timer timer;
  late double input;
  late double output;
  String currencyInput = "USD";
  String currencyOutput = "IDR";
  late String result;
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
    result = '';
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void convert() async {
    CurrencyRate rate =
    await LiveCurrencyRate.convertCurrency(currencyInput, currencyOutput, double.parse(inputController.text));
    setState(() {
      result =rate.result.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
          padding: const EdgeInsets.all(20),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                //WARNA DAN SUDUT BACKGROUND KONVERSI WAKTU
                padding: const EdgeInsets.all(20),
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Time In Four Zone',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 28,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: size.width * 1,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            timeString,
                            style:
                            const TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          child: DropdownButton<String>(
                            underline: Container(),
                            value: waktuBagian,
                            elevation: 16,
                            onChanged: (String? value) {
                              setState(() {
                                waktuBagian = value!;
                              });
                            },
                            items: listWaktuBagian
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontSize: 25, fontFamily: 'Poppins'),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 60,
              ),
              Container(
                //WARNA DAN SUDUT MENU KONVERSI UANG
                color: Colors.grey.shade100,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Money Converter',
                            style: TextStyle(
                              fontSize: 28,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: size.width * 1,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child:
                          // TEXTFIELD INPUT KOVERSI
                          CommonTextField(label: '', controller: inputController)
                          // TEXTFIELD INPUT KOVERSI
                        ),
                        const SizedBox(width: 10),
                        DropdownButton(
                          value: currencyInput,
                          items: const <String>['IDR', 'USD', 'SAR']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              currencyInput = value!;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 3, 3, 3)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: MediaQuery.of(context).size.width / 2,
                          height: 55,
                          child: Text(
                            //HASIL KOMVERSI
                            result,
                            //HASIL KONVERSI
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButton(
                          value: currencyOutput,
                          items: const <String>['IDR', 'USD', 'SAR']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              currencyOutput = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ConvertButton(onPressed: convert)
                  ],
                ),
              ),
            ],
          ),

    );
  }

  void _getTime() {
    DateTime waktu;
    if (waktuBagian == 'WITA') {
      waktu = DateTime.now().add(const Duration(hours: 1));
    } else if (waktuBagian == 'WIT') {
      waktu = DateTime.now().add(const Duration(hours: 2));
    } else if (waktuBagian == 'UTC') {
      waktu = DateTime.now().toUtc();
    } else {
      waktu = DateTime.now();
    }

    final String formattedDateTime = _formatDateTime(waktu);
    setState(() {
      timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('kk:mm:ss').format(dateTime);
  }
}
