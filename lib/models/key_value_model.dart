import 'package:equatable/equatable.dart';

class KeyValueModel extends Equatable {
  final String key;
  final String vaule;
  const KeyValueModel({
    required this.key,
    required this.vaule,
  });
  @override
  List<Object> get props => [key];
}
