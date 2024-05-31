import 'package:flutter/material.dart';
import 'package:skeeper/src/data.dart';

class BodyPadding extends EdgeInsets {
  const BodyPadding._(super.value) : super.all();

  const BodyPadding.small() : this._(Values.kDefaultSmallPadding);

  const BodyPadding.medium() : this._(Values.kDefaultMediumPadding);

  const BodyPadding.large() : this._(Values.kDefaultLargePadding);
}
