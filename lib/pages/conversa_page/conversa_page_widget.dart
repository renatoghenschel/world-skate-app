import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'conversa_page_model.dart';
export 'conversa_page_model.dart';

class ConversaPageWidget extends StatefulWidget {
  const ConversaPageWidget({
    super.key,
    required this.participantsImages,
    required this.participantsNames,
    required this.chatID,
  });

  final List<String>? participantsImages;
  final List<String>? participantsNames;
  final DocumentReference? chatID;

  @override
  State<ConversaPageWidget> createState() => _ConversaPageWidgetState();
}

class _ConversaPageWidgetState extends State<ConversaPageWidget> {
  late ConversaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversaPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Chat',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://i.pinimg.com/originals/62/40/b6/6240b66d5c50c8661eee78b439a7d33c.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.arrow_back_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed('chats');
                                          },
                                        ),
                                        AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: 60.0,
                                            height: 60.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              functions.guestImage(
                                                  widget.participantsImages!
                                                      .toList(),
                                                  currentUserPhoto)!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              functions.guestName(
                                                  widget.participantsNames!
                                                      .toList(),
                                                  currentUserDisplayName),
                                              'guestName',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 13,
                                  child: StreamBuilder<List<MessagesRecord>>(
                                    stream: queryMessagesRecord(
                                      parent: widget.chatID,
                                      queryBuilder: (messagesRecord) =>
                                          messagesRecord.orderBy('ts',
                                              descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MessagesRecord>
                                          messagesMessagesRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            messagesMessagesRecordList.length,
                                        itemBuilder: (context, messagesIndex) {
                                          final messagesMessagesRecord =
                                              messagesMessagesRecordList[
                                                  messagesIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                children: [
                                                  if (messagesMessagesRecord
                                                          .senderID !=
                                                      currentUserReference)
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    2.0,
                                                                    7.0,
                                                                    2.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.7,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (messagesMessagesRecord
                                                                        .type ==
                                                                    'i/t')
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (messagesMessagesRecord.messageText !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              messagesMessagesRecord.messageText,
                                                                              maxLines: 10,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        if (messagesMessagesRecord.messageImage !=
                                                                                '')
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              messagesMessagesRecord.messageImage,
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (messagesMessagesRecord
                                                                        .type ==
                                                                    'audio')
                                                                  FlutterFlowAudioPlayer(
                                                                    audio: Audio
                                                                        .network(
                                                                      messagesMessagesRecord
                                                                          .audio,
                                                                      metas:
                                                                          Metas(
                                                                        title:
                                                                            '',
                                                                      ),
                                                                    ),
                                                                    titleTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    playbackDurationTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    playbackButtonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    elevation:
                                                                        0.0,
                                                                    playInBackground:
                                                                        PlayInBackground
                                                                            .disabledRestoreOnForeground,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (messagesMessagesRecord
                                                          .senderID ==
                                                      currentUserReference)
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    2.0,
                                                                    7.0,
                                                                    2.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.7,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFF075E54),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (messagesMessagesRecord
                                                                        .type ==
                                                                    'i/t')
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (messagesMessagesRecord.messageText !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              messagesMessagesRecord.messageText,
                                                                              maxLines: 10,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        if (messagesMessagesRecord.messageImage !=
                                                                                '')
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              messagesMessagesRecord.messageImage,
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (messagesMessagesRecord
                                                                        .type ==
                                                                    'audio')
                                                                  FlutterFlowAudioPlayer(
                                                                    audio: Audio
                                                                        .network(
                                                                      messagesMessagesRecord
                                                                          .audio,
                                                                      metas:
                                                                          Metas(
                                                                        title:
                                                                            '',
                                                                      ),
                                                                    ),
                                                                    titleTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    playbackDurationTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    fillColor:
                                                                        const Color(
                                                                            0xFF075E54),
                                                                    playbackButtonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    elevation:
                                                                        0.0,
                                                                    playInBackground:
                                                                        PlayInBackground
                                                                            .disabledRestoreOnForeground,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          await MessagesRecord.createDoc(
                                                  widget.chatID!)
                                              .set(createMessagesRecordData(
                                            senderID: currentUserReference,
                                            senderName: currentUserDisplayName,
                                            senderImage: currentUserPhoto,
                                            messageText:
                                                _model.textController.text,
                                            ts: getCurrentTimestamp,
                                            type: 'i/t',
                                          ));
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });

                                          await widget.chatID!
                                              .update(createChatsRecordData(
                                            lastMessage:
                                                _model.textController.text,
                                            lastMessageTS: getCurrentTimestamp,
                                            lastMessageType: 'text',
                                          ));
                                        },
                                        autofocus: false,
                                        textInputAction: TextInputAction.send,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText:
                                              'Digite sua mensagem aqui...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_model.audioRecording)
                            Container(
                              width: 60.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Visibility(
                                visible: _model.audioRecording,
                                child: FlutterFlowTimer(
                                  initialTime: _model.timerInitialTimeMs,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timerController,
                                  updateStateInterval:
                                      const Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) safeSetState(() {});
                                  },
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          if (!_model.audioRecording)
                            FlutterFlowIconButton(
                              borderRadius: 30.0,
                              buttonSize: 50.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              hoverColor: const Color(0xFF3F27FF),
                              icon: Icon(
                                Icons.mic,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                _model.audioRecording = true;
                                safeSetState(() {});
                                _model.timerController.onStartTimer();
                                await requestPermission(microphonePermission);
                                await startAudioRecording(
                                  context,
                                  audioRecorder: _model.audioRecorder ??=
                                      AudioRecorder(),
                                );
                              },
                            ),
                          if (_model.audioRecording)
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 50.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              hoverColor: const Color(0xFF3F27FF),
                              icon: Icon(
                                Icons.send,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                await stopAudioRecording(
                                  audioRecorder: _model.audioRecorder,
                                  audioName: 'recordedFileBytes1',
                                  onRecordingComplete:
                                      (audioFilePath, audioBytes) {
                                    _model.audioPath = audioFilePath;
                                    _model.recordedFileBytes1 = audioBytes;
                                  },
                                );

                                await MessagesRecord.createDoc(widget.chatID!)
                                    .set(createMessagesRecordData(
                                  senderID: currentUserReference,
                                  senderName: currentUserDisplayName,
                                  senderImage: currentUserPhoto,
                                  audio: _model.audioPath,
                                  ts: getCurrentTimestamp,
                                  type: 'audio',
                                ));

                                await widget.chatID!
                                    .update(createChatsRecordData(
                                  lastMessageTS: getCurrentTimestamp,
                                  lastMessageType: 'audio',
                                  lastMessageAudio: _model.audioPath,
                                ));
                                _model.audioRecording = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                            ),
                          if (_model.audioRecording)
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 50.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              hoverColor: const Color(0xFF3F27FF),
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                await stopAudioRecording(
                                  audioRecorder: _model.audioRecorder,
                                  audioName: 'recordedFileBytes2',
                                  onRecordingComplete:
                                      (audioFilePath, audioBytes) {
                                    _model.gg = audioFilePath;
                                    _model.recordedFileBytes2 = audioBytes;
                                  },
                                );

                                _model.audioRecording = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                            ),
                        ].divide(const SizedBox(height: 3.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
