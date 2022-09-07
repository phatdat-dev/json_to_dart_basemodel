import 'package:build/build.dart';
import 'package:code_generators/json_to_dart/json_to_dart.dart' show ModelGenerator;

class ExportBuildFile implements Builder {
  //get all file json
  @override
  Map<String, List<String>> get buildExtensions => {
        '.json': ['.model.dart']
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    // Retrieve the currently matched asset
    AssetId inputId = buildStep.inputId;

    // Create a  target `AssetId` based on the current one
    var copyAssetId = inputId.changeExtension('.model.dart');
    var contents = await buildStep.readAsString(inputId);

    //name model want to export
    final generator = ModelGenerator('AutoGenericModel');
    final dartCode = generator.generateUnsafeDart(contents);

    // Write out the  asset
    await buildStep.writeAsString(copyAssetId, '''
${dartCode.code}
''');
  }
}
