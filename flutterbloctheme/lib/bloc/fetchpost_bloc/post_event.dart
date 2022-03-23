import 'package:flutter/cupertino.dart';

@immutable
abstract class PostEvent {}

class PostFetchEvent extends PostEvent {}

class PostDetailFetchEvent extends PostEvent {}

class LoginFetchEvent extends PostEvent {}
