import 'package:flutter/material.dart';

class BodyPadding extends EdgeInsets {
  const BodyPadding._(super.value) : super.all();

  const BodyPadding.small() : this._(8);

  const BodyPadding.medium() : this._(14);

  const BodyPadding.large() : this._(24);
}
