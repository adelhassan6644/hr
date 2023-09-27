class EndPoints {
  static const String baseUrl = 'https://erp.softwarecloud2.com/api';
  static const String googleMapsBaseUrl = 'https://maps.googleapis.com';
  static const String imageUrl = 'https://test.fitariki.com/';
  static const String apiKey = '123';
  static const String topic = 'fitariki';

  static checkIn(id) => '/employee/attendance/attend/$id';
  static employeeSchedule(id) => '/employee/attendance/schedules/$id';
  static daySchedules(id) => '/employee/attendance/day/schedules/$id';
  static const String register = '';
  static const String login = '/employee/login';
  static const String updatePassword = '';
  static const String resetPassword = '';
  static const String sendVerificationCode = '';
  static const String getVerificationCode = '';
  static salaryDetails(id) => ' / $id';


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
