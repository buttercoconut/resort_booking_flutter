import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'api/resort_api.dart';

Future<void> main() async {
  final api = ResortApi();
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(api.router.handler);

  final server = await io.serve(handler, 'localhost', 8080);
  print('Server listening on port ${server.port}');
}
