
import 'package:splitter_web_frontend/src/models/login/login_model.dart';
import '../../models/global_models.dart';

mixin LoginService {
  Future<Response> login(LoginModel loginRequest);
  
}
