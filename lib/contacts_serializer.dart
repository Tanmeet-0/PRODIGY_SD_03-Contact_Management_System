import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class ContactsSerializer {
  static const String _contacts_json_data_file_name = "contacts.json";
  late File _contacts_json_file;
  late List<dynamic> contacts_data;
  int max_contact_id = -1;

  ContactsSerializer._();

  static Future<ContactsSerializer> create() async {
    ContactsSerializer contacts_serializer = ContactsSerializer._();
    await contacts_serializer._open_or_create_contacts_file();
    contacts_serializer._load_contacts_data();
    return contacts_serializer;
  }

  Future<void> _open_or_create_contacts_file() async {
    Directory app_directory = await getApplicationSupportDirectory();
    String path_to_file =
        "${app_directory.path}\\$_contacts_json_data_file_name";
    _contacts_json_file = File(path_to_file);
    if (!_contacts_json_file.existsSync()) {
      _contacts_json_file.createSync();
    }
    if (_contacts_json_file.readAsStringSync().isEmpty) {
      _contacts_json_file
          .writeAsStringSync("[]"); // setting empty list of contacts as default
    }
  }

  void _load_contacts_data() {
    contacts_data = jsonDecode(_contacts_json_file.readAsStringSync());
    //id is index
    max_contact_id = contacts_data.length - 1;
  }

  void _save_contacts_data() {
    _contacts_json_file.writeAsStringSync(jsonEncode(contacts_data));
  }

  void add_contact(String name, String number) {
    //id is index
    max_contact_id += 1;
    dynamic new_contact = {
      "id": max_contact_id,
      "name": name,
      "number": number
    };
    contacts_data.add(new_contact);
    _save_contacts_data();
  }

  void delete_contact(int id) {
    //id is index
    contacts_data.removeAt(id);
    for (int i = id; i < contacts_data.length; i += 1) {
      contacts_data[i]["id"] -= 1;
    }
    max_contact_id -= 1;
    _save_contacts_data();
  }

  void edit_contact(int id, String name, String number) {
    //id is index
    contacts_data[id]["name"] = name;
    contacts_data[id]["number"] = number;
    _save_contacts_data();
  }
}
