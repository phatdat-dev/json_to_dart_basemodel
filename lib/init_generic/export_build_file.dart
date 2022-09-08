import 'package:build/build.dart';
import 'package:code_generators/json_to_dart/json_to_dart.dart' show ModelGenerator;

//https://github.com/dart-lang/build/blob/master/example/lib/example.dart
class ExportBuildFile implements Builder {
  //get all file json
  @override
  Map<String, List<String>> get buildExtensions => {
        // To implement directory moves, this builder uses capture groups
        // ({{}}). Capture groups can match anything in the input's path,
        // including subdirectories. The `^assets` at the beginning ensures that
        // only jsons under the top-level `assets/` folder will be considered.
        '.json': ['.model.dart'],
      };
  @override
  Future<void> build(BuildStep buildStep) async {
    // Retrieve the currently matched asset
    final inputId = buildStep.inputId;

    // final outputId = AssetId(
    //   inputId.package,
    //   inputId.path
    //       //.replaceFirst('assets/', 'generated/')
    //       .replaceFirst('.json', '.model.dart'),
    // );
    final outputId = inputId.changeExtension('.model.dart');

    final _name = outputId.path.split('.')[0].split('/').last;

    final className = upperFirstCase(_name.split('_'));

    var contents = await buildStep.readAsString(inputId);

    //name model want to export
    final generator = ModelGenerator(className);
    final dartCode = generator.generateUnsafeDart(contents);

    // Write out the  asset
    await buildStep.writeAsString(outputId, '''
${dartCode.code}
''');
  }
}

//upperCase
String upperFirstCase(List<String> listString) {
  for (var i = 0; i < listString.length; i++) {
    listString[i] = listString[i][0].toUpperCase() + listString[i].substring(1);
  }
  return listString.join('');
}
