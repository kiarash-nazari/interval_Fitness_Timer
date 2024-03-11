import 'package:flutter/material.dart';

extension SizedBoxHeight on num {
  SizedBox get heightBox {
    return SizedBox(height: toDouble());
  }

  SizedBox get widthBox {
    return SizedBox(width: toDouble());
  }
}
