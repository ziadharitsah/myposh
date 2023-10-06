import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myposh/app/controller/auth/bloc/auth_bloc.dart';
import 'package:myposh/app/models/auth/request/request_login.dart';
import 'package:myposh/app/repositories/auth/api.dart';
import 'package:myposh/app/repositories/auth/contans.dart';

import '../../component/common/custom_form_button.dart';
import '../../component/common/custom_input_field.dart';
import '../../component/common/page_header.dart';
import '../../component/common/page_heading.dart';
import '../dashboard/main_screen.dart';

part 'forgot_password_page.dart';
part 'sign_up_page.dart';
part 'sign_in_page.dart';
