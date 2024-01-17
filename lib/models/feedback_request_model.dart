import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'feedback_request_model.g.dart';

@JsonSerializable()
class FeedbackRequestModel {
  String? content;
  String? appid;

  FeedbackRequestModel({this.content, this.appid});

  factory FeedbackRequestModel.fromJson(Map<String, dynamic> json) => _$FeedbackRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackRequestModelToJson(this);
}

