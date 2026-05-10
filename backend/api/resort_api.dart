import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/resort_service.dart';

class ResortApi {
  final ResortService _service = ResortService();

  Router get router {
    final router = Router();

    router.get('/resorts', _getResorts);
    router.get('/resorts/<id>', _getResortById);
    router.post('/resorts', _createResort);
    router.put('/resorts/<id>', _updateResort);
    router.delete('/resorts/<id>', _deleteResort);

    return router;
  }

  Future<Response> _getResorts(Request request) async {
    final resorts = await _service.getAllResorts();
    return Response.ok(resorts.toString());
  }

  Future<Response> _getResortById(Request request, String id) async {
    final resort = await _service.getResortById(id);
    if (resort == null) {
      return Response.notFound('Resort not found');
    }
    return Response.ok(resort.toString());
  }

  Future<Response> _createResort(Request request) async {
    // Simplified: parse body as JSON string
    final body = await request.readAsString();
    final resort = await _service.createResort(body);
    return Response.ok(resort.toString());
  }

  Future<Response> _updateResort(Request request, String id) async {
    final body = await request.readAsString();
    final resort = await _service.updateResort(id, body);
    if (resort == null) {
      return Response.notFound('Resort not found');
    }
    return Response.ok(resort.toString());
  }

  Future<Response> _deleteResort(Request request, String id) async {
    final success = await _service.deleteResort(id);
    if (!success) {
      return Response.notFound('Resort not found');
    }
    return Response.ok('Deleted');
  }
}
