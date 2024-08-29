import "base_contact_edit_form.dart";

class NewContactPage extends BaseContactEditForm {
  final void Function() close_new_contact_page;
  NewContactPage(
      {super.key,
      required super.contacts_serializer,
      required this.close_new_contact_page})
      : super(contact_name: "", contact_number: "");
  @override
  void on_save() {
    contacts_serializer.add_contact(
        name_controller.text, number_controller.text);
  }

  @override
  void on_save_or_cancel() {
    close_new_contact_page();
  }
}
