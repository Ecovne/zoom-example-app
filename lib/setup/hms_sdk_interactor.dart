//Project imports
import 'package:hmssdk_flutter/hmssdk_flutter.dart';

class HMSSDKInteractor {
  late HMSConfig config;
  late List<HMSMessage> messages;
  late HMSSDK hmsSDK;

  HMSSDKInteractor() {
    hmsSDK = HMSSDK();
    hmsSDK.build();
  }

  Future<void> join({required HMSConfig config}) async {
    this.config = config;
    await hmsSDK.join(config: this.config);
  }

  void leave({required HMSActionResultListener hmsActionResultListener}) async {
    hmsSDK.leave(hmsActionResultListener: hmsActionResultListener);
  }

  Future<HMSException?> switchAudio({bool isOn = false}) async {
    return await hmsSDK.switchAudio(isOn: isOn);
  }

  Future<HMSException?> switchVideo({bool isOn = false}) async {
    return await hmsSDK.switchVideo(isOn: isOn);
  }

  Future<void> switchCamera() async {
    return await hmsSDK.switchCamera();
  }

  void sendBroadcastMessage(
      String message, HMSActionResultListener hmsActionResultListener) {
    hmsSDK.sendBroadcastMessage(
        message: message,
        type: "chat",
        hmsActionResultListener: hmsActionResultListener);
  }

  void sendDirectMessage(String message, HMSPeer peer,
      HMSActionResultListener hmsActionResultListener) async {
    hmsSDK.sendDirectMessage(
        message: message,
        peer: peer,
        type: "chat",
        hmsActionResultListener: hmsActionResultListener);
  }

  void sendGroupMessage(String message, String roleName,
      HMSActionResultListener hmsActionResultListener) async {
    hmsSDK.sendGroupMessage(
        message: message,
        roleName: roleName,
        type: "chat",
        hmsActionResultListener: hmsActionResultListener);
  }

  Future<void> preview({required HMSConfig config}) async {
    this.config = config;
    return hmsSDK.preview(config: config);
  }

  void startHMSLogger(HMSLogLevel webRtclogLevel, HMSLogLevel logLevel) {
    hmsSDK.startHMSLogger(webRtclogLevel: webRtclogLevel, logLevel: logLevel);
  }

  void removeHMSLogger() {
    hmsSDK.removeHMSLogger();
  }

  void addLogsListener(HMSLogListener hmsLogListener) {
    hmsSDK.addLogListener(hmsLogListener: hmsLogListener);
  }

  void removeLogsListener(HMSLogListener hmsLogListener) {
    hmsSDK.removeLogListener(hmsLogListener: hmsLogListener);
  }

  void addMeetingListener(HMSUpdateListener listener) {
    hmsSDK.addMeetingListener(listener: listener);
  }

  void removeMeetingListener(HMSUpdateListener listener) {
    hmsSDK.removeMeetingListener(listener: listener);
  }

  void addPreviewListener(HMSPreviewListener listener) {
    hmsSDK.addPreviewListener(listener: listener);
  }

  void removePreviewListener(HMSPreviewListener listener) {
    hmsSDK.removePreviewListener(listener: listener);
  }

  void acceptChangeRole(HMSActionResultListener hmsActionResultListener) {
    hmsSDK.acceptChangeRole(hmsActionResultListener: hmsActionResultListener);
  }

  void stopCapturing() {
    hmsSDK.stopCapturing();
  }

  Future<HMSPeer?> getLocalPeer() async {
    return await hmsSDK.getLocalPeer();
  }

  Future<bool> startCapturing() async {
    return await hmsSDK.startCapturing();
  }

  Future<HMSPeer?> getPeer({required String peerId}) async {
    List<HMSPeer>? peers = await hmsSDK.getPeers();

    return peers?.firstWhere((element) => element.peerId == peerId);
  }

  void changeTrackState(HMSPeer peer, bool mute, bool isVideoTrack,
      HMSActionResultListener hmsActionResultListener) {
    hmsSDK.changeTrackState(
        peer: peer,
        mute: mute,
        isVideoTrack: isVideoTrack,
        hmsActionResultListener: hmsActionResultListener);
  }

  // TODO: implement accept change Track request

  void endRoom(bool lock, String reason,
      HMSActionResultListener hmsActionResultListener) {
    hmsSDK.endRoom(
        lock: lock,
        reason: reason,
        hmsActionResultListener: hmsActionResultListener);
  }

  void removePeer(
      HMSPeer peer, HMSActionResultListener hmsActionResultListener) {
    hmsSDK.removePeer(
        peer: peer,
        reason: "Removing Peer from Flutter",
        hmsActionResultListener: hmsActionResultListener);
  }

  void changeRole(
      {required HMSPeer peer,
      required String roleName,
      bool forceChange = false,
      required HMSActionResultListener hmsActionResultListener}) {
    hmsSDK.changeRole(
        peer: peer,
        roleName: roleName,
        forceChange: forceChange,
        hmsActionResultListener: hmsActionResultListener);
  }

  Future<List<HMSRole>> getRoles() async {
    return await hmsSDK.getRoles();
  }

  Future<bool> isAudioMute(HMSPeer? peer) async {
    return await hmsSDK.isAudioMute(peer: peer);
  }

  Future<bool> isVideoMute(HMSPeer? peer) async {
    // TODO: add permission checks in exmaple app UI
    return await hmsSDK.isVideoMute(peer: peer);
  }

  void muteAll() {
    // TODO: add permission checks in exmaple app UI
    hmsSDK.muteAll();
  }

  void unMuteAll() {
    // TODO: add permission checks in exmaple app UI
    hmsSDK.unMuteAll();
  }

  void setPlayBackAllowed(bool allow) {
    // TODO: add permission checks in exmaple app UI
    hmsSDK.setPlayBackAllowed(allow: allow);
  }

  void startRtmpOrRecording(HMSRecordingConfig hmsRecordingConfig,
      HMSActionResultListener hmsActionResultListener) {
    hmsSDK.startRtmpOrRecording(
        hmsRecordingConfig: hmsRecordingConfig,
        hmsActionResultListener: hmsActionResultListener);
  }

  void stopRtmpAndRecording(HMSActionResultListener hmsActionResultListener) {
    hmsSDK.stopRtmpAndRecording(
        hmsActionResultListener: hmsActionResultListener);
  }

  Future<HMSRoom?> getRoom() async {
    return await hmsSDK.getRoom();
  }

  void changeMetadata(
      {required String metadata,
      required HMSActionResultListener hmsActionResultListener}) {
    hmsSDK.changeMetadata(
        metadata: metadata, hmsActionResultListener: hmsActionResultListener);
  }

  void changeName(
      {required String name,
      required HMSActionResultListener hmsActionResultListener}) {
    hmsSDK.changeName(
        name: name, hmsActionResultListener: hmsActionResultListener);
  }
}
