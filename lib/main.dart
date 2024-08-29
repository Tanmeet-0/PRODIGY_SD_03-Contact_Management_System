import 'package:flutter/material.dart';
import 'contacts_serializer.dart';
import 'all_contacts_page.dart';
import 'new_contact_page.dart';
import "edit_contact_page.dart";
import "styles.dart" as styles;

// to do
// add validation for new contact and edit contact
// add country codes to numbers
// one contact can have many numbers
// label each number of a contact
// expanded view for a single contact
// clip long text in all contacts page
// add sorting by names
// add searching 
// import contacts as csv

void main() {
  runApp(const MyContactManagementApp());
}

class MyContactManagementApp extends StatelessWidget {
  const MyContactManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app_theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: "Contact Management System",
      theme: app_theme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late ContactsSerializer contacts_serializer;
  Widget current_page = Text("loading");

  @override
  void initState() {
    super.initState();
    ContactsSerializer.create().then((new_contacts_serializer) {
      contacts_serializer = new_contacts_serializer;
      open_all_contacts_page();
    });
  }

  void open_all_contacts_page() {
    setState(() {
      current_page = AllContactsPage(
        contacts_serializer: contacts_serializer,
        open_new_contact_page: open_new_contact_page,
        open_contact_edit_page: open_contact_edit_page,
      );
    });
  }

  void open_new_contact_page() {
    setState(() {
      current_page = NewContactPage(
          contacts_serializer: contacts_serializer,
          close_new_contact_page: open_all_contacts_page);
    });
  }

  void open_contact_edit_page(dynamic contact_data) {
    setState(() {
      current_page = EditContactPage(
          contacts_serializer: contacts_serializer,
          content_data: contact_data,
          close_contact_edit_page: open_all_contacts_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    styles.create_styles_from_theme(Theme.of(context));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: styles.app_bar_color,
        scrolledUnderElevation: 0,
        title: Text(
          "Contacts",
          style: styles.main_heading_text_style,
        ),
      ),
      backgroundColor: styles.background_color,
      body: current_page,
    );
  }
}
