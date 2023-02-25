
import 'package:flutter/cupertino.dart';

import '../../domain/repositery/attendance_repo.dart';

class AttendanceProvider extends ChangeNotifier{
  final AttendanceRepo attendanceRepo;


  AttendanceProvider({required this.attendanceRepo, });

}