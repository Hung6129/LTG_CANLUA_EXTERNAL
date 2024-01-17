abstract class ReportErrEvent {}

class InitEvent extends ReportErrEvent {}

class SendReportErrEvent extends ReportErrEvent {
  String content;
  SendReportErrEvent({
    required this.content,
  });
}
