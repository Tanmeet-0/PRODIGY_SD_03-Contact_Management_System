import 'package:flutter/material.dart';
import 'contacts_serializer.dart';
import "styles.dart" as styles;

abstract class BaseContactEditForm extends StatelessWidget {
  final ContactsSerializer contacts_serializer;
  final String contact_name;
  final String contact_number;
  BaseContactEditForm(
      {super.key,
      required this.contacts_serializer,
      required this.contact_name,
      required this.contact_number});
  void on_save();
  void on_save_or_cancel();
  final name_controller = TextEditingController();
  final number_controller = TextEditingController();
  final form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    name_controller.text = contact_name;
    number_controller.text = contact_number;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          color: styles.contact_container_color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 3, color: styles.contact_container_border_color),
        ),
        child: Form(
          key: form_key,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                        "Name : ",
                        style: styles.body_text_style,
                      ),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: name_controller,
                          style: styles.body_text_style,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: styles.contact_container_border_color,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: styles.contact_container_border_color,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                        "Number : ",
                        style: styles.body_text_style,
                      ),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: number_controller,
                          style: styles.body_text_style,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: styles.contact_container_border_color,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: styles.contact_container_border_color,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: styles.elevated_button_style,
                        onPressed: () {
                          on_save();
                          on_save_or_cancel();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Icon(
                                  Icons.save,
                                  size: styles.body_text_style.fontSize,
                                  color: styles.save_icon_color,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Save",
                                  style: styles.body_text_style,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      ElevatedButton(
                          style: styles.elevated_button_style,
                          onPressed: () {
                            on_save_or_cancel();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Icon(
                                    Icons.cancel,
                                    color: styles.cancel_icon_color,
                                    size: styles.body_text_style.fontSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Cancel",
                                    style: styles.body_text_style,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
