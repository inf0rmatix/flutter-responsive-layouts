import 'package:flutter/widgets.dart';

import 'row_element_info.dart';

class RowElement {
  final RowElementInfo data;
  final Widget child;

  RowElement({
    this.data = const RowElementInfo(),
    required this.child,
  });
}
