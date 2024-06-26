// Mocks generated by Mockito 5.4.4 from annotations
// in speech_craft/test/presentation/app/pages/welcome_page/cubit/query_params/query_params_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:speech_craft/domain/entities/language_entity.dart' as _i4;
import 'package:speech_craft/domain/entities/region_code_entity.dart' as _i5;
import 'package:speech_craft/domain/repositories/search_query_params_repository.dart'
    as _i2;
import 'package:speech_craft/domain/use_cases/search_query_params_use_cases.dart'
    as _i3;

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

class _FakeQueryParamsRepository_0 extends _i1.SmartFake
    implements _i2.SearchQueryParamsRepository {
  _FakeQueryParamsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [QueryParamsUseCases].
///
/// See the documentation for Mockito's code generation for more information.
class MockQueryParamsUseCases extends _i1.Mock
    implements _i3.SearchQueryParamsUseCases {
  @override
  _i2.SearchQueryParamsRepository get queryParamsRepository => (super.noSuchMethod(
        Invocation.getter(#queryParamsRepository),
        returnValue: _FakeQueryParamsRepository_0(
          this,
          Invocation.getter(#queryParamsRepository),
        ),
        returnValueForMissingStub: _FakeQueryParamsRepository_0(
          this,
          Invocation.getter(#queryParamsRepository),
        ),
      ) as _i2.SearchQueryParamsRepository);

  @override
  List<_i4.LanguageEntity> getLanguages() => (super.noSuchMethod(
        Invocation.method(
          #getLanguages,
          [],
        ),
        returnValue: <_i4.LanguageEntity>[],
        returnValueForMissingStub: <_i4.LanguageEntity>[],
      ) as List<_i4.LanguageEntity>);

  @override
  List<_i5.RegionCodeEntity> getRegionCodes() => (super.noSuchMethod(
        Invocation.method(
          #getRegionCodes,
          [],
        ),
        returnValue: <_i5.RegionCodeEntity>[],
        returnValueForMissingStub: <_i5.RegionCodeEntity>[],
      ) as List<_i5.RegionCodeEntity>);
}
