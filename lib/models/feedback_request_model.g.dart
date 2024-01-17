// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackRequestModel _$FeedbackRequestModelFromJson(
        Map<String, dynamic> json) =>
    FeedbackRequestModel(
      content: json['content'] as String?,
      appid: json['appid'] as String?,
    );

Map<String, dynamic> _$FeedbackRequestModelToJson(
        FeedbackRequestModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'appid': instance.appid,
    };
