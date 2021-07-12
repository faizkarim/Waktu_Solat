import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class AppListTileSwitch extends StatelessWidget {
  final bool toggleValue;
  final String title;
  final IconData icon;
  final ValueChanged<bool> onChange;

  AppListTileSwitch({
    this.toggleValue,
    this.title,
    this.icon,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileSwitch(
      value: toggleValue,
      leading: Icon(icon),
      onChanged: onChange,
      visualDensity: VisualDensity.comfortable,
      switchType: SwitchType.cupertino,
      switchActiveColor: Colors.amber,
      title: Text(title ?? ""),
    );
  }
}
