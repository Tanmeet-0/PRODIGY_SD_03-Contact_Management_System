import "base_contact_edit_form.dart";

class EditContactPage extends BaseContactEditForm {
  final void Function() close_contact_edit_page;
  final dynamic content_data;
  EditContactPage(
      {super.key,
      required super.contacts_serializer,
      required this.content_data,
      required this.close_contact_edit_page})
      : super(
          contact_name: content_data["name"],
          contact_number: content_data["number"],
        );
  @override
  void on_save() {
    contacts_serializer.edit_contact(
        content_data["id"], name_controller.text, number_controller.text);
  }

  @override
  void on_save_or_cancel() {
    close_contact_edit_page();
  }
}
