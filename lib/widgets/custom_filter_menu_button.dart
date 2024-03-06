import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menu_button/menu_button.dart';

class CustomFilterMenuButton extends ConsumerStatefulWidget {
  const CustomFilterMenuButton({super.key});

  @override
  ConsumerState<CustomFilterMenuButton> createState() => _CustomFilterMenuButtonState();
}


List<String> keys = <String>[
  'Low',
  'Medium',
  'High',
];

String selectedKey = keys[0];


class _CustomFilterMenuButtonState extends ConsumerState<CustomFilterMenuButton> {

  final Widget normalChildButton = SizedBox(
    width: 93,
    height: 40,
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
              child: Text(selectedKey, overflow: TextOverflow.ellipsis)
          ),
          const SizedBox(
            width: 12,
            height: 17,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return MenuButton<String>(
      items: keys,
      itemBuilder: (String value) => Container(
        height: 40,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
        child: Text(value),
      ),
      toggledChild: Container(
        child: normalChildButton,
      ),
      onItemSelected: (String value) {
        setState(() {
          selectedKey = value;
        });
      },
      onMenuButtonToggle: (bool isToggle) {
        print(isToggle);
      },
      child: normalChildButton,
    );
  }
}
