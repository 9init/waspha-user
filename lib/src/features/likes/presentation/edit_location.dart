import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';

import '../domain/likes_domain.dart';

class EditAddressScreen extends HookWidget {
  String? title;
  String? phone;
  String? landmark;
  String? address;
  EditAddressScreen(
      {super.key, this.title, this.phone, this.landmark, this.address});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isMeChecked = useState(false);
    final isOtherChecked = useState(false);
    TextEditingController _titleController = TextEditingController(text: title);
    TextEditingController _landmarkController =
        TextEditingController(text: landmark);

    PhoneController _phoneController =
        PhoneController(PhoneNumber(isoCode: IsoCode.KW, nsn: phone ?? ""));
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomCloseButton(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add new address",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 348,
                height: 750,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pick an icon", style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Icon(Icons.home),
                                    Checkbox(value: false, onChanged: (v) {})
                                  ],
                                );
                              }),
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _titleController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Title is required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Address Title",
                                      hintText: "Enter your address Title",
                                      border: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Used phone no.",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Checkbox(
                                      value: isMeChecked.value,
                                      onChanged: (v) {
                                        isMeChecked.value = v!;
                                        isOtherChecked.value = !v;
                                      }),
                                  title: Text("me"),
                                ),
                                ListTile(
                                  leading: Checkbox(
                                      value: isOtherChecked.value,
                                      onChanged: (v) {
                                        isOtherChecked.value = v!;
                                        isMeChecked.value = !v;
                                      }),
                                  title: Text("other"),
                                  trailing: SizedBox(
                                    width: 150,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: "Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: PhoneFormField(
                                    controller: _phoneController,
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      border: UnderlineInputBorder(),
                                    ),
                                    showFlagInInput: true,
                                    defaultCountry: IsoCode.KW,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      width: 244,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF663399),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Pick from contact list",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: TextFormField(
                                        controller: _landmarkController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Landmark is required";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Landmark",
                                            hintText: "Landmark",
                                            border: UnderlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Icon(Icons.info)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Location",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Consumer(
                                  builder: (context, ref, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        context.push('/choose_location');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          address != null
                                              ? Expanded(child: Text(address!))
                                              : Text("Choose location on map"),
                                          Icon(Icons.location_on)
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Consumer(
                                  builder: (context, ref, child) {
                                    return SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xFF663399)),
                                            ),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                ref
                                                    .read(addLocationProvider(
                                                      landmark:
                                                          _landmarkController
                                                              .text,
                                                      title:
                                                          _titleController.text,
                                                      phone: _phoneController
                                                          .value!.international
                                                          .toString(),
                                                    ).future)
                                                    .then((value) =>
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    value))));
                                              }
                                            },
                                            child: Text("Save",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17))));
                                  },
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
