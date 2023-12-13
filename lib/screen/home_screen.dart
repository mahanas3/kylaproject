import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final dobController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            TextField(
              controller: dobController,
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));

                calculateAge(date!);

                dobController.text = DateFormat('MM/dd/yyyy').format(date!);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
      ),
    );
  }

  String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    var age = currentDate.year - birthDate.year;
    print(age);
    return age.toString();
  }
}
