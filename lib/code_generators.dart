// ignore_for_file: import_of_legacy_library_into_null_safe

library code_generators;

//dart pub run build_runner build

// import 'package:code_generators/src/blog_homepage_builder.dart';
import 'package:build/build.dart';
import 'package:code_generators/src/export_build_file.dart';
// import 'package:code_generators/src/markdown_to_html.dart';

Builder exportBuildFile(BuilderOptions options) => ExportBuildFile();

// Builder markdownToHtmlBuilder(BuilderOptions options) => MarkdownToHtmlBuilder(options);

// Builder blogHomepageBuilder(BuilderOptions options) => BlogHomepageBuilder();

// PostProcessBuilder cleanupUnneededFiles(BuilderOptions options) => FileDeletingBuilder([
//       '.md',
//       '.yaml',
//       '.lock',
//     ]);
