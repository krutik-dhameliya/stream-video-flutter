// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart' hide TextTheme;

import '../utils/device_segmentation.dart';
import '../widgets/floating_view/floating_view_alignment.dart';
import 'themes.dart';

/// {@template streamVideoThemeData}
/// Theme data for Stream Video
/// {@endtemplate}
class StreamVideoTheme extends ThemeExtension<StreamVideoTheme> {
  /// Creates a theme from scratch
  factory StreamVideoTheme({
    required Brightness brightness,
    StreamTextTheme? textTheme,
    StreamColorTheme? colorTheme,
    StreamCallContentThemeData? callContentTheme,
    StreamCallControlsThemeData? callControlsTheme,
    StreamUserAvatarThemeData? userAvatarTheme,
    StreamLobbyViewThemeData? lobbyViewTheme,
    StreamCallParticipantThemeData? callParticipantTheme,
    StreamLocalVideoThemeData? localVideoTheme,
    StreamIncomingOutgoingCallThemeData? incomingCallTheme,
    StreamIncomingOutgoingCallThemeData? outgoingCallTheme,
    StreamLivestreamThemeData? livestreamTheme,
  }) {
    final isDark = brightness == Brightness.dark;
    textTheme ??=
        isDark ? const StreamTextTheme.dark() : const StreamTextTheme.light();
    colorTheme ??=
        isDark ? const StreamColorTheme.dark() : const StreamColorTheme.light();

    final defaultTheme = StreamVideoTheme.fromColorAndTextTheme(
      colorTheme,
      textTheme,
    );

    final customizedTheme = defaultTheme.copyWith(
      textTheme: textTheme,
      colorTheme: colorTheme,
      callContentTheme: callContentTheme,
      callControlsTheme: callControlsTheme,
      userAvatarTheme: userAvatarTheme,
      lobbyViewTheme: lobbyViewTheme,
      callParticipantTheme: callParticipantTheme,
      localVideoTheme: localVideoTheme,
      incomingCallTheme: incomingCallTheme,
      outgoingCallTheme: outgoingCallTheme,
      livestreamTheme: livestreamTheme,
    );

    return defaultTheme.merge(customizedTheme);
  }

  /// Theme initialized with light
  factory StreamVideoTheme.light() =>
      StreamVideoTheme(brightness: Brightness.light);

  /// Theme initialized with dark
  factory StreamVideoTheme.dark() =>
      StreamVideoTheme(brightness: Brightness.dark);

  /// Raw theme initialization
  const StreamVideoTheme.raw({
    required this.textTheme,
    required this.colorTheme,
    required this.callControlsTheme,
    required this.userAvatarTheme,
    required this.lobbyViewTheme,
    required this.callParticipantTheme,
    required this.localVideoTheme,
    required this.incomingCallTheme,
    required this.callContentTheme,
    required this.outgoingCallTheme,
    required this.livestreamTheme,
  });

  /// Creates a theme from a Material [Theme]
  factory StreamVideoTheme.fromTheme(ThemeData theme) {
    final defaultTheme = StreamVideoTheme(brightness: theme.brightness);
    final customizedTheme = StreamVideoTheme.fromColorAndTextTheme(
      defaultTheme.colorTheme.copyWith(
        accentPrimary: theme.colorScheme.secondary,
      ),
      defaultTheme.textTheme,
    );
    return defaultTheme.merge(customizedTheme);
  }

  /// Creates a theme from a [StreamColorTheme] and a [StreamTextTheme]
  factory StreamVideoTheme.fromColorAndTextTheme(
    StreamColorTheme colorTheme,
    StreamTextTheme textTheme,
  ) {
    return StreamVideoTheme.raw(
      textTheme: textTheme,
      colorTheme: colorTheme,
      callControlsTheme: StreamCallControlsThemeData(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        backgroundColor: colorTheme.barsBg,
        elevation: 8,
        padding: const EdgeInsets.all(14),
        spacing: 10,
        optionIconColor: Colors.black,
        inactiveOptionIconColor: Colors.white,
        optionElevation: 2,
        inactiveOptionElevation: 2,
        optionBackgroundColor: Colors.white,
        inactiveOptionBackgroundColor:
            // ignore: deprecated_member_use
            colorTheme.overlay.withOpacity(0.4),
        optionShape: const CircleBorder(),
        optionPadding: const EdgeInsets.all(16),
      ),
      userAvatarTheme: StreamUserAvatarThemeData(
        borderRadius: BorderRadius.circular(20),
        constraints: const BoxConstraints.tightFor(
          height: 40,
          width: 40,
        ),
        initialsTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorTheme.barsBg,
        ),
        selectionColor: colorTheme.accentPrimary,
        selectionThickness: 4,
      ),
      lobbyViewTheme: StreamLobbyViewThemeData(
        backgroundColor: Colors.white,
        cardBackgroundColor: const Color(0xFFF2F2F2),
        userAvatarTheme: StreamUserAvatarThemeData(
          constraints: const BoxConstraints.tightFor(
            height: 100,
            width: 100,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          initialsTextStyle: textTheme.title1.copyWith(color: Colors.white),
          selectionColor: colorTheme.accentPrimary,
          selectionThickness: 4,
        ),
      ),
      callParticipantTheme: StreamCallParticipantThemeData(
        showSpeakerBorder: true,
        borderRadius: isDesktopDevice
            ? const BorderRadius.all(Radius.circular(12))
            : BorderRadius.zero,
        speakerBorderColor: colorTheme.accentPrimary,
        speakerBorderThickness: 4,
        backgroundColor: colorTheme.disabled,
        userAvatarTheme: StreamUserAvatarThemeData(
          constraints: const BoxConstraints.tightFor(
            height: 100,
            width: 100,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          initialsTextStyle: textTheme.title1.copyWith(color: Colors.white),
          selectionColor: colorTheme.accentPrimary,
          selectionThickness: 4,
        ),
        audioLevelIndicatorColor: colorTheme.accentPrimary,
        participantLabelTextStyle:
            textTheme.footnote.copyWith(color: Colors.white),
        disabledMicrophoneColor: colorTheme.accentError,
        enabledMicrophoneColor: Colors.white,
        connectionLevelActiveColor: colorTheme.accentPrimary,
        connectionLevelInactiveColor: Colors.white,
      ),
      localVideoTheme: const StreamLocalVideoThemeData(
        localVideoHeight: 150,
        localVideoWidth: 125,
        localVideoPadding: 16,
        initialAlignment: FloatingViewAlignment.topRight,
        enableSnappingBehavior: true,
        userAvatarTheme: StreamUserAvatarThemeData(
          constraints: BoxConstraints.tightFor(
            height: 50,
            width: 50,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
          initialsTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      incomingCallTheme: StreamIncomingOutgoingCallThemeData(
        singleParticipantAvatarTheme: StreamUserAvatarThemeData(
          initialsTextStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorTheme.barsBg,
          ),
          constraints: const BoxConstraints(
            minHeight: 160,
            minWidth: 160,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        multipleParticipantAvatarTheme: StreamUserAvatarThemeData(
          initialsTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colorTheme.barsBg,
          ),
          constraints: const BoxConstraints(
            minHeight: 80,
            minWidth: 80,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        singleParticipantTextStyle: TextStyle(
          fontSize: 28,
          color: colorTheme.barsBg,
          fontWeight: FontWeight.bold,
        ),
        multipleParticipantTextStyle: TextStyle(
          fontSize: 20,
          color: colorTheme.barsBg,
        ),
        callingLabelTextStyle: TextStyle(
          fontSize: 20,
          // ignore: deprecated_member_use
          color: colorTheme.barsBg.withOpacity(0.6),
          fontWeight: FontWeight.bold,
        ),
      ),
      callContentTheme: const StreamCallContentThemeData(
        callContentBackgroundColor: Color(0XFF272A30),
      ),
      outgoingCallTheme: StreamIncomingOutgoingCallThemeData(
        singleParticipantAvatarTheme: StreamUserAvatarThemeData(
          initialsTextStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorTheme.barsBg,
          ),
          constraints: const BoxConstraints(
            minHeight: 160,
            minWidth: 160,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        multipleParticipantAvatarTheme: StreamUserAvatarThemeData(
          initialsTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colorTheme.barsBg,
          ),
          constraints: const BoxConstraints(
            minHeight: 80,
            minWidth: 80,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        singleParticipantTextStyle: TextStyle(
          fontSize: 28,
          color: colorTheme.barsBg,
          fontWeight: FontWeight.bold,
        ),
        multipleParticipantTextStyle: TextStyle(
          fontSize: 20,
          color: colorTheme.barsBg,
        ),
        callingLabelTextStyle: TextStyle(
          fontSize: 20,
          // ignore: deprecated_member_use
          color: colorTheme.barsBg.withOpacity(0.6),
          fontWeight: FontWeight.bold,
        ),
      ),
      livestreamTheme: StreamLivestreamThemeData(
        playIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        pauseIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        playPauseIconSize: 64,
        liveButtonColor: colorTheme.accentPrimary,
        backstageButtonColor: colorTheme.accentError,
        callStateButtonTextStyle: const TextStyle(
          color: Colors.white,
        ),
        participantCountTextStyle: const TextStyle(
          color: Colors.white,
        ),
        durationTextStyle: const TextStyle(
          color: Colors.white,
        ),
        participantIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        speakerEnabledIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        speakerDisabledIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        expandIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        contractIconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }

  static final StreamVideoTheme _kLightFallbackTheme = StreamVideoTheme.light();
  static final StreamVideoTheme _kDarkFallbackTheme = StreamVideoTheme.dark();

  static StreamVideoTheme of(BuildContext context) {
    final theme = Theme.of(context);
    final streamVideoTheme = theme.extension<StreamVideoTheme>();

    if (streamVideoTheme != null) return streamVideoTheme;
    if (theme.brightness == Brightness.light) return _kLightFallbackTheme;
    return _kDarkFallbackTheme;
  }

  /// The text themes used in the widgets.
  final StreamTextTheme textTheme;

  /// The color themes used in the widgets.
  final StreamColorTheme colorTheme;

  /// The color themes used in CallControlsView
  final StreamCallControlsThemeData callControlsTheme;

  /// Theme for the user avatar widget.
  final StreamUserAvatarThemeData userAvatarTheme;

  /// Theme for the pre-joining view widget.
  final StreamLobbyViewThemeData lobbyViewTheme;

  /// Theme for the call participant widget.
  final StreamCallParticipantThemeData callParticipantTheme;

  /// Theme for the local video widget.
  final StreamLocalVideoThemeData localVideoTheme;

  /// Theme for the outgoing call widget.
  final StreamIncomingOutgoingCallThemeData incomingCallTheme;

  /// Theme for the call content widget.
  final StreamCallContentThemeData callContentTheme;

  /// Theme for the outgoing call widget.
  final StreamIncomingOutgoingCallThemeData outgoingCallTheme;

  /// Theme for the outgoing call widget.
  final StreamLivestreamThemeData livestreamTheme;

  /// Creates a copy of [StreamVideoTheme] with specified attributes
  /// overridden.
  @override
  StreamVideoTheme copyWith({
    StreamTextTheme? textTheme,
    StreamColorTheme? colorTheme,
    StreamCallControlsThemeData? callControlsTheme,
    StreamUserAvatarThemeData? userAvatarTheme,
    StreamLobbyViewThemeData? lobbyViewTheme,
    StreamCallParticipantThemeData? callParticipantTheme,
    StreamLocalVideoThemeData? localVideoTheme,
    StreamIncomingOutgoingCallThemeData? incomingCallTheme,
    StreamCallContentThemeData? callContentTheme,
    StreamIncomingOutgoingCallThemeData? outgoingCallTheme,
    StreamLivestreamThemeData? livestreamTheme,
  }) =>
      StreamVideoTheme.raw(
        textTheme: this.textTheme.merge(textTheme),
        colorTheme: this.colorTheme.merge(colorTheme),
        callControlsTheme: this.callControlsTheme.merge(callControlsTheme),
        userAvatarTheme: this.userAvatarTheme.merge(userAvatarTheme),
        lobbyViewTheme: this.lobbyViewTheme.merge(lobbyViewTheme),
        callParticipantTheme:
            this.callParticipantTheme.merge(callParticipantTheme),
        localVideoTheme: this.localVideoTheme.merge(localVideoTheme),
        incomingCallTheme: this.incomingCallTheme.merge(incomingCallTheme),
        callContentTheme: this.callContentTheme.merge(callContentTheme),
        outgoingCallTheme: this.outgoingCallTheme.merge(outgoingCallTheme),
        livestreamTheme: this.livestreamTheme.merge(livestreamTheme),
      );

  /// Merge themes
  StreamVideoTheme merge(StreamVideoTheme? other) {
    if (other == null) return this;
    return copyWith(
      textTheme: textTheme.merge(other.textTheme),
      colorTheme: colorTheme.merge(other.colorTheme),
      callControlsTheme: callControlsTheme.merge(callControlsTheme),
      userAvatarTheme: userAvatarTheme.merge(other.userAvatarTheme),
      lobbyViewTheme: lobbyViewTheme.merge(other.lobbyViewTheme),
      callParticipantTheme:
          callParticipantTheme.merge(other.callParticipantTheme),
      incomingCallTheme: incomingCallTheme.merge(other.incomingCallTheme),
      callContentTheme: callContentTheme.merge(other.callContentTheme),
      outgoingCallTheme: outgoingCallTheme.merge(other.outgoingCallTheme),
      livestreamTheme: livestreamTheme.merge(other.livestreamTheme),
    );
  }

  @override
  ThemeExtension<StreamVideoTheme> lerp(
    ThemeExtension<StreamVideoTheme>? other,
    double t,
  ) {
    if (other is! StreamVideoTheme) {
      return this;
    }
    return StreamVideoTheme.raw(
      textTheme: textTheme.lerp(other.textTheme, t),
      colorTheme: colorTheme.lerp(other.colorTheme, t),
      userAvatarTheme: userAvatarTheme.lerp(other.userAvatarTheme, t),
      lobbyViewTheme: lobbyViewTheme.lerp(other.lobbyViewTheme, t),
      callParticipantTheme:
          callParticipantTheme.lerp(other.callParticipantTheme, t),
      localVideoTheme: localVideoTheme.lerp(other.localVideoTheme, t),
      callControlsTheme: callControlsTheme.lerp(other.callControlsTheme, t),
      incomingCallTheme: incomingCallTheme.lerp(other.incomingCallTheme, t),
      callContentTheme: callContentTheme.lerp(other.callContentTheme, t),
      outgoingCallTheme: outgoingCallTheme.lerp(other.outgoingCallTheme, t),
      livestreamTheme: livestreamTheme.lerp(other.livestreamTheme, t),
    );
  }
}
