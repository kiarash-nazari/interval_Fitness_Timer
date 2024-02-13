import 'package:flutter/material.dart';

extension SizedBoxHeight on num {
  SizedBox get heightBox {
    return SizedBox(height: this.toDouble());
  }
}