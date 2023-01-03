import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class VideoCall {
  static Future<dynamic> videoCall(String serverURL, String room, String name,String email,{ String avatar = ""}) async{
    var options = JitsiMeetingOptions(roomNameOrUrl: room, serverUrl: serverURL, userDisplayName: name, userEmail: email, isAudioMuted: false, isVideoMuted: true);
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onConferenceWillJoin: (url) => print("onConferenceWillJoin: url: $url"),
        onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
        onConferenceTerminated: (url, error) => print("onConferenceTerminated: url: $url, error: $error"),
      ),
    );
  }
}