class EndPoints {
  static const String baseUrl = 'https://erp.softwarecloud2.com/api/';
  static const String googleMapsBaseUrl = 'https://maps.googleapis.com';
  static const String imageUrl = 'https://test.fitariki.com/';
  static const String apiKey = '123';
  static const String topic = 'fitariki';

  static checkAttend(id) => 'employee/attendance/attend/$id';
  static checkLeave(id) => 'employee/attendance/leave/$id';
  static checkOnSchedule(id) => 'employee/attendance/closest/schedule/$id';
  static employeeSchedule(id) => 'employee/attendance/schedules/$id';
  static daySchedules(id) => 'employee/attendance/day/schedules/$id';
  static const String register = '';
  static const String login = 'employee/login';
  static const String updatePassword = '';
  static const String resetPassword = '';
  static const String sendVerificationCode = '';
  static const String getVerificationCode = '';
  static salaryDetails(id) => ' / $id';

  ///Requests
  static allRequest(id) => 'employee/request/index/$id';

  static const String loanRequest = 'employee/loan/request/store';
  static const String loanTypes = 'employee/loan/types/index';
  static deleteLoanRequest(id) => 'employee/loan/request/destroy/$id';

  static getCovenantRequest(id) => 'employee/loan/request/destroy/$id';
  static const String covenantTypes = 'employee/pledge/types/index';
  static const String assetRequest = 'employee/loan/request/store';
  static deleteAssetRequest(id) => 'employee/loan/request/destroy/$id';

  static const String permissionRequest = 'employee/permission/request/store';
  static const String permissionTypes = 'employee/permission/types/index';
  static deletePermissionRequest(id) => 'employee/loan/request/destroy/$id';

  static const String vacationTypes = 'employee/vaction/types/index';
  static const String vacationRequest = 'employee/vacation/request/store';
  static deleteVacationRequest(id) => 'employee/loan/request/destroy/$id';

  ///App Config
  static const String setting = '';
  static const String contact = '';

  ///App Content
  static const String getContact = 'app/contact';
  static const String getCountries = 'app/countries';
  static const String getBanks = 'app/banks';

  /// maps
  static const String geoCodeUrl = '/maps/api/geocode/';
  static const String autoComplete = '/maps/api/place/autocomplete/';
}
