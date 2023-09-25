class EndPoints {
  static const String baseUrl = 'https://erp.softwarecloud2.com/api';
  static const String googleMapsBaseUrl = 'https://maps.googleapis.com';
  static const String imageUrl = 'https://test.fitariki.com/';
  static const String apiKey = 'eGvviZ/npgc2Blb4/PSymh1tyb/UIt3aq82W6f+Wn4=';
  static const String topic = 'fitariki';

  static attendEmployee(id) => '/employee/attendance/attend/$id';
  static employeeSchedule(id) => '/employee/attendance/schedules/$id';
  static daySchedules(id) => '/employee/attendance/schedules/$id';
  static const String register = '';
  static const String login = '/employee/login';
  static const String updatePassword = '';
  static const String resetPassword = '';
  static const String sendVerificationCode = '';
  static const String getVerificationCode = '';
  static const String getSlider = '';
  static const String publicLessons = '';
  static const String todaySchedule = '';
  static const String getPaidLessons = '';
  static const String getReversedLessons = '';
  static const String eventByCategory = '';
  static const String eventByCities = '';
  static const String eventByCitiesCategory = '';
  static const String getProfileInfo = '';
  static const String getCategories = '';
  static const String getFeaturedEventUrl = '';
  static const String updateProfileInfo = '';
  static const String getNotification = '';
  static const String makeAsRaed = '';
  static const String getWishListInfo = '';
  static const String addRemoveWishListInfo = '';
  static const String feedBack = '';
  static const String chatList = '';
  static const String startNewChat = '';
  static const String makeAsRead = '';
  static const String search = '';
  static const String searchFilters = '';
  static const String partnerUri = 'd';
  static const String settings = '';
  static const String couponURl = '';
  static const String citiesURl = '';
  static const String sendSupportMassage = '';
  static const String showReplies = '';

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
