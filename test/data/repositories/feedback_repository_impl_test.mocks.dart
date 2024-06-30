// Mocks generated by Mockito 5.4.4 from annotations
// in speech_craft/test/data/repositories/feedback_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:speech_craft/data/data_sources/feedback_data/feedback_remote_data_source.dart'
    as _i3;
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart'
    as _i2;
import 'package:speech_craft/data/models/upload_audio_request/time_range.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserSuccessRate_0 extends _i1.SmartFake
    implements _i2.UserSuccessRate {
  _FakeUserSuccessRate_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FeedbackRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFeedbackRemoteDataSource extends _i1.Mock
    implements _i3.FeedbackRemoteDataSource {
  @override
  _i4.Future<_i2.UserSuccessRate> getSuccessRate() => (super.noSuchMethod(
        Invocation.method(
          #getSuccessRate,
          [],
        ),
        returnValue:
            _i4.Future<_i2.UserSuccessRate>.value(_FakeUserSuccessRate_0(
          this,
          Invocation.method(
            #getSuccessRate,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.UserSuccessRate>.value(_FakeUserSuccessRate_0(
          this,
          Invocation.method(
            #getSuccessRate,
            [],
          ),
        )),
      ) as _i4.Future<_i2.UserSuccessRate>);

  @override
  _i4.Future<int> uploadAudio({
    required _i5.Uint8List? bytes,
    required _i6.TimeRange? timeRange,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadAudio,
          [],
          {
            #bytes: bytes,
            #timeRange: timeRange,
          },
        ),
        returnValue: _i4.Future<int>.value(0),
        returnValueForMissingStub: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
}