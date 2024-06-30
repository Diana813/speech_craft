// Mocks generated by Mockito 5.4.4 from annotations
// in speech_craft/test/data/repositories/search_query_params_repository_implementation_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:speech_craft/data/data_sources/search_query_params_data/search_query_params_data_source.dart'
    as _i2;
import 'package:speech_craft/data/models/search_request/country.dart' as _i4;
import 'package:speech_craft/data/models/search_request/language.dart' as _i3;

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

/// A class which mocks [SearchQueryParamsDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchQueryParamsDataSource extends _i1.Mock
    implements _i2.SearchQueryParamsDataSource {
  @override
  List<_i3.Language> getLanguages() => (super.noSuchMethod(
        Invocation.method(
          #getLanguages,
          [],
        ),
        returnValue: <_i3.Language>[],
        returnValueForMissingStub: <_i3.Language>[],
      ) as List<_i3.Language>);

  @override
  List<_i4.Country> getCountries() => (super.noSuchMethod(
        Invocation.method(
          #getCountries,
          [],
        ),
        returnValue: <_i4.Country>[],
        returnValueForMissingStub: <_i4.Country>[],
      ) as List<_i4.Country>);
}
