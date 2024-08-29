import 'package:flutter/material.dart';

bool styles_created = false;
late Color background_color;
late Color app_bar_color;
late Color all_text_color;
late Color contact_container_color;
late Color contact_container_border_color;
late Color elevated_button_color;
late Color icon_button_focus_color;
late Color add_icon_color;
late Color edit_icon_color;
late Color delete_icon_color;
late Color save_icon_color;
late Color cancel_icon_color;
late TextStyle body_text_style;
late TextStyle main_heading_text_style;
late ButtonStyle elevated_button_style;

void create_styles_from_theme(ThemeData theme) {
  background_color = theme.colorScheme.onPrimary;
  app_bar_color = theme.colorScheme.onPrimaryFixed;
  all_text_color = theme.colorScheme.primary;
  contact_container_color = theme.colorScheme.primaryContainer;
  contact_container_border_color = theme.colorScheme.onPrimaryContainer;
  elevated_button_color = theme.colorScheme.onPrimaryFixed;
  icon_button_focus_color = Colors.white.withAlpha(30);
  add_icon_color = Colors.greenAccent.shade700;
  edit_icon_color = Colors.blueAccent.shade700;
  delete_icon_color = Colors.redAccent.shade700;
  save_icon_color = edit_icon_color;
  cancel_icon_color = delete_icon_color;
  body_text_style =
      theme.textTheme.headlineLarge!.copyWith(color: all_text_color);
  main_heading_text_style =
      theme.textTheme.displayLarge!.copyWith(color: all_text_color);
  elevated_button_style = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(elevated_button_color));
  styles_created = true;
}
