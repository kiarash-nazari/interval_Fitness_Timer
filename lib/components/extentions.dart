import 'package:flutter/material.dart';

extension SizedBoxHeight on num {
  SizedBox get heightBox {
    return SizedBox(height: toDouble());
  }

  SizedBox get widthBox {
    return SizedBox(width: toDouble());
  }
}
// extension Utility on BuildContext {
//   void nextEditableTextFocus() {
//     do {
//       FocusScope.of(this).nextFocus();
//     } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
//   }
// }