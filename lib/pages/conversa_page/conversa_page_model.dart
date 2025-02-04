import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'conversa_page_widget.dart' show ConversaPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class ConversaPageModel extends FlutterFlowModel<ConversaPageWidget> {
  ///  Local state fields for this page.

  bool audioRecording = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  AudioRecorder? audioRecorder;
  String? audioPath;
  FFUploadedFile recordedFileBytes1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String? gg;
  FFUploadedFile recordedFileBytes2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    timerController.dispose();
  }
}
