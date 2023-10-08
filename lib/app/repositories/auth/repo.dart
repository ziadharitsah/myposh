import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myposh/app/models/auth/request/request_login.dart';
import 'package:http/http.dart' as http;
import 'package:myposh/app/models/auth/request/request_register.dart';
import 'package:myposh/app/models/auth/response/response_user.dart';
import 'package:myposh/app/repositories/auth/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth/response/response_auth.dart';

part 'repository.dart';
