import 'package:flutter/material.dart';

class ObjectRadius extends BorderRadius {
  ObjectRadius._(final double value) : super.all(Radius.circular(value));

  ObjectRadius.none() : this._(0);

  ObjectRadius.extraSmall() : this._(4);

  ObjectRadius.small() : this._(8);

  ObjectRadius.medium() : this._(12);

  ObjectRadius.large() : this._(16);

  ObjectRadius.extraLarge() : this._(24);

  ObjectRadius.full() : this._(32);
}
