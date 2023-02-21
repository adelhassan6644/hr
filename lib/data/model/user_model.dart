
class DirectManager {
  DirectManager({
    this.id,
    this.enName,
    this.arName,
    this.email,
    this.image,
    this.phone,
    this.password,
    this.address,
    this.description,
    this.otp,
    this.dateOfBirth,
    this.dateOfJoining,
    this.dateOfLeaving,
    this.otpVerifiedAt,
    this.status,
    this.gender,
    this.rememberToken,
    this.directManagerId,
    this.jobRoleId,
    this.hrEmployeeId,
    this.nationalId,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.jobNumber,
    this.state,
    this.zipcode,
    this.homePhone,
    this.emergencyName,
    this.vactions,
    this.salary,
    this.languageId,
    this.jobTypeId,
    this.jobCategoryId,
    this.jobLevelId,
    this.jobUnitId,
    this.branchId,
    this.locationRequired,
    this.employeeInfo,
    this.directManager,
    this.country,
    this.national,
    this.jobRole,
    this.jobType,
    this.jobCategory,
    this.jobUnit,
    this.jobLevel,
    this.branch,
    this.hrEmployee,
    this.employeeRecompenses,
    this.contract,
  });

  final int? id;
  final String? enName;
  final String? arName;
  final String? email;
  final dynamic image;
  final String? phone;
  final dynamic password;
  final String? address;
  final dynamic description;
  final dynamic otp;
  final dynamic dateOfBirth;
  final DateTime? dateOfJoining;
  final dynamic dateOfLeaving;
  final dynamic otpVerifiedAt;
  final dynamic status;
  final int? gender;
  final dynamic rememberToken;
  final int? directManagerId;
  final int? jobRoleId;
  final dynamic hrEmployeeId;
  final int? nationalId;
  final int? countryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? jobNumber;
  final dynamic state;
  final dynamic zipcode;
  final dynamic homePhone;
  final dynamic emergencyName;
  final int? vactions;
  final int? salary;
  final dynamic languageId;
  final int? jobTypeId;
  final int? jobCategoryId;
  final int? jobLevelId;
  final int? jobUnitId;
  final int? branchId;
  final int? locationRequired;
  final EmployeeInfo? employeeInfo;
  final UserModel? directManager;
  final Country? country;
  final Country? national;
  final Job? jobRole;
  final Job? jobType;
  final Job? jobCategory;
  final Job? jobUnit;
  final Job? jobLevel;
  final Branch? branch;
  final dynamic hrEmployee;
  final List<dynamic>? employeeRecompenses;
  final Contract? contract;

  factory DirectManager.fromJson(Map<String, dynamic> json) => DirectManager(
    id: json["id"],
    enName: json["en_name"],
    arName: json["ar_name"],
    email: json["email"],
    image: json["image"],
    phone: json["phone"],
    password: json["password"],
    address: json["address"],
    description: json["description"],
    otp: json["otp"],
    dateOfBirth: json["date_of_birth"],
    dateOfJoining: json["date_of_joining"] == null ? null : DateTime.parse(json["date_of_joining"]),
    dateOfLeaving: json["date_of_leaving"],
    otpVerifiedAt: json["otp_verified_at"],
    status: json["status"],
    gender: json["gender"],
    rememberToken: json["remember_token"],
    directManagerId: json["direct_manager_id"],
    jobRoleId: json["job_role_id"],
    hrEmployeeId: json["hr_employee_id"],
    nationalId: json["national_id"],
    countryId: json["country_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    jobNumber: json["job_number"],
    state: json["state"],
    zipcode: json["zipcode"],
    homePhone: json["home_phone"],
    emergencyName: json["emergency_name"],
    vactions: json["vactions"],
    salary: json["salary"],
    languageId: json["language_id"],
    jobTypeId: json["job_type_id"],
    jobCategoryId: json["job_category_id"],
    jobLevelId: json["job_level_id"],
    jobUnitId: json["job_unit_id"],
    branchId: json["branch_id"],
    locationRequired: json["location_required"],
    employeeInfo: json["employee_info"] == null ? null : EmployeeInfo.fromJson(json["employee_info"]),
    directManager: json["direct_manager"] == null ? null : UserModel.fromJson(json["direct_manager"]),
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    national: json["national"] == null ? null : Country.fromJson(json["national"]),
    jobRole: json["job_role"] == null ? null : Job.fromJson(json["job_role"]),
    jobType: json["job_type"] == null ? null : Job.fromJson(json["job_type"]),
    jobCategory: json["job_category"] == null ? null : Job.fromJson(json["job_category"]),
    jobUnit: json["job_unit"] == null ? null : Job.fromJson(json["job_unit"]),
    jobLevel: json["job_level"] == null ? null : Job.fromJson(json["job_level"]),
    branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
    hrEmployee: json["hr_employee"],
    employeeRecompenses: json["employee_recompenses"] == null ? [] : List<dynamic>.from(json["employee_recompenses"]!.map((x) => x)),
    contract: json["contract"] == null ? null : Contract.fromJson(json["contract"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "en_name": enName,
    "ar_name": arName,
    "email": email,
    "image": image,
    "phone": phone,
    "password": password,
    "address": address,
    "description": description,
    "otp": otp,
    "date_of_birth": dateOfBirth,
    "date_of_joining": dateOfJoining?.toIso8601String(),
    "date_of_leaving": dateOfLeaving,
    "otp_verified_at": otpVerifiedAt,
    "status": status,
    "gender": gender,
    "remember_token": rememberToken,
    "direct_manager_id": directManagerId,
    "job_role_id": jobRoleId,
    "hr_employee_id": hrEmployeeId,
    "national_id": nationalId,
    "country_id": countryId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "job_number": jobNumber,
    "state": state,
    "zipcode": zipcode,
    "home_phone": homePhone,
    "emergency_name": emergencyName,
    "vactions": vactions,
    "salary": salary,
    "language_id": languageId,
    "job_type_id": jobTypeId,
    "job_category_id": jobCategoryId,
    "job_level_id": jobLevelId,
    "job_unit_id": jobUnitId,
    "branch_id": branchId,
    "location_required": locationRequired,
    "employee_info": employeeInfo?.toJson(),
    "direct_manager": directManager?.toJson(),
    "country": country?.toJson(),
    "national": national?.toJson(),
    "job_role": jobRole?.toJson(),
    "job_type": jobType?.toJson(),
    "job_category": jobCategory?.toJson(),
    "job_unit": jobUnit?.toJson(),
    "job_level": jobLevel?.toJson(),
    "branch": branch?.toJson(),
    "hr_employee": hrEmployee,
    "employee_recompenses": employeeRecompenses == null ? [] : List<dynamic>.from(employeeRecompenses!.map((x) => x)),
    "contract": contract?.toJson(),
  };
}

class UserModel {
  UserModel({
    this.id,
    this.enName,
    this.arName,
    this.email,
    this.image,
    this.phone,
    this.password,
    this.address,
    this.description,
    this.dateOfBirth,
    this.dateOfJoining,
    this.dateOfLeaving,
    this.status,
    this.gender,
    this.directManagerId,
    this.jobRoleId,
    this.hrEmployeeId,
    this.nationalId,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.jobNumber,
    this.state,
    this.zipcode,
    this.homePhone,
    this.emergencyName,
    this.vacations,
    this.salary,
    this.languageId,
    this.jobTypeId,
    this.jobCategoryId,
    this.jobLevelId,
    this.jobUnitId,
    this.branchId,
    this.locationRequired,
    this.employeeInfo,
    this.directManager,
    this.country,
    this.national,
    this.jobRole,
    this.jobType,
    this.jobCategory,
    this.jobUnit,
    this.jobLevel,
    this.branch,
    this.hrEmployee,
    this.employeeRecompenses,
    this.contract,
  });

  final int? id;
  final String? enName;
  final String? arName;
  final String? email;
  final String? image;
  final String? phone;
  final String? password;
  final String? address;
  final dynamic description;
  final DateTime? dateOfBirth;
  final DateTime? dateOfJoining;
  final dynamic dateOfLeaving;
  final dynamic status;
  final int? gender;
  final int? directManagerId;
  final int? jobRoleId;
  final dynamic hrEmployeeId;
  final int? nationalId;
  final int? countryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? jobNumber;
  final String? state;
  final String? zipcode;
  final String? homePhone;
  final String? emergencyName;
  final int? vacations;
  final int? salary;
  final int? languageId;
  final int? jobTypeId;
  final int? jobCategoryId;
  final int? jobLevelId;
  final int? jobUnitId;
  final int? branchId;
  final int? locationRequired;
  final EmployeeInfo? employeeInfo;
  final DirectManager? directManager;
  final Country? country;
  final Country? national;
  final Job? jobRole;
  final Job? jobType;
  final Job? jobCategory;
  final Job? jobUnit;
  final Job? jobLevel;
  final Branch? branch;
  final dynamic hrEmployee;
  final List<EmployeeRecompense>? employeeRecompenses;
  final Contract? contract;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    enName: json["en_name"],
    arName: json["ar_name"],
    email: json["email"],
    image: json["image"],
    phone: json["phone"],
    password: json["password"],
    address: json["address"],
    description: json["description"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    dateOfJoining: json["date_of_joining"] == null ? null : DateTime.parse(json["date_of_joining"]),
    dateOfLeaving: json["date_of_leaving"],
    status: json["status"],
    gender: json["gender"],
    directManagerId: json["direct_manager_id"],
    jobRoleId: json["job_role_id"],
    hrEmployeeId: json["hr_employee_id"],
    nationalId: json["national_id"],
    countryId: json["country_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    jobNumber: json["job_number"],
    state: json["state"],
    zipcode: json["zipcode"],
    homePhone: json["home_phone"],
    emergencyName: json["emergency_name"],
    vacations: json["vactions"],
    salary: json["salary"],
    languageId: json["language_id"],
    jobTypeId: json["job_type_id"],
    jobCategoryId: json["job_category_id"],
    jobLevelId: json["job_level_id"],
    jobUnitId: json["job_unit_id"],
    branchId: json["branch_id"],
    locationRequired: json["location_required"],
    employeeInfo: json["employee_info"] == null ? null : EmployeeInfo.fromJson(json["employee_info"]),
    directManager: json["direct_manager"] == null ? null : DirectManager.fromJson(json["direct_manager"]),
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    national: json["national"] == null ? null : Country.fromJson(json["national"]),
    jobRole: json["job_role"] == null ? null : Job.fromJson(json["job_role"]),
    jobType: json["job_type"] == null ? null : Job.fromJson(json["job_type"]),
    jobCategory: json["job_category"] == null ? null : Job.fromJson(json["job_category"]),
    jobUnit: json["job_unit"] == null ? null : Job.fromJson(json["job_unit"]),
    jobLevel: json["job_level"] == null ? null : Job.fromJson(json["job_level"]),
    branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
    hrEmployee: json["hr_employee"],
    employeeRecompenses: json["employee_recompenses"] == null ? [] : List<EmployeeRecompense>.from(json["employee_recompenses"]!.map((x) => EmployeeRecompense.fromJson(x))),
    contract: json["contract"] == null ? null : Contract.fromJson(json["contract"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "en_name": enName,
    "ar_name": arName,
    "email": email,
    "image": image,
    "phone": phone,
    "password": password,
    "address": address,
    "description": description,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "date_of_joining": dateOfJoining?.toIso8601String(),
    "date_of_leaving": dateOfLeaving,
    "status": status,
    "gender": gender,
    "direct_manager_id": directManagerId,
    "job_role_id": jobRoleId,
    "hr_employee_id": hrEmployeeId,
    "national_id": nationalId,
    "country_id": countryId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "job_number": jobNumber,
    "state": state,
    "zipcode": zipcode,
    "home_phone": homePhone,
    "emergency_name": emergencyName,
    "vactions": vacations,
    "salary": salary,
    "language_id": languageId,
    "job_type_id": jobTypeId,
    "job_category_id": jobCategoryId,
    "job_level_id": jobLevelId,
    "job_unit_id": jobUnitId,
    "branch_id": branchId,
    "location_required": locationRequired,
    "employee_info": employeeInfo?.toJson(),
    "direct_manager": directManager?.toJson(),
    "country": country?.toJson(),
    "national": national?.toJson(),
    "job_role": jobRole?.toJson(),
    "job_type": jobType?.toJson(),
    "job_category": jobCategory?.toJson(),
    "job_unit": jobUnit?.toJson(),
    "job_level": jobLevel?.toJson(),
    "branch": branch?.toJson(),
    "hr_employee": hrEmployee,
    "employee_recompenses": employeeRecompenses == null ? [] : List<dynamic>.from(employeeRecompenses!.map((x) => x.toJson())),
    "contract": contract?.toJson(),
  };
}

class Branch {
  Branch({
    this.id,
    this.enName,
    this.arName,
    this.description,
    this.location,
    this.countryId,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? enName;
  final String? arName;
  final String? description;
  final dynamic location;
  final int? countryId;
  final dynamic cityId;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    enName: json["en_name"],
    arName: json["ar_name"],
    description: json["description"],
    location: json["location"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "en_name": enName,
    "ar_name": arName,
    "description": description,
    "location": location,
    "country_id": countryId,
    "city_id": cityId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Contract {
  Contract({
    this.id,
    this.employeeId,
    this.contractTypeId,
    this.contractDurationId,
    this.jobRoleId,
    this.hrEmployeeId,
    this.name,
    this.startDate,
    this.endDate,
    this.hejriStartDate,
    this.hejriEndDate,
    this.isActive,
    this.isTestingPeriod,
    this.testingPeriodStartDate,
    this.testingPeriodEndDate,
    this.hejriTestingPeriodStartDate,
    this.hejriTestingPeriodEndDate,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? employeeId;
  final int? contractTypeId;
  final int? contractDurationId;
  final dynamic jobRoleId;
  final dynamic hrEmployeeId;
  final dynamic name;
  final dynamic startDate;
  final dynamic endDate;
  final dynamic hejriStartDate;
  final dynamic hejriEndDate;
  final dynamic isActive;
  final dynamic isTestingPeriod;
  final dynamic testingPeriodStartDate;
  final dynamic testingPeriodEndDate;
  final dynamic hejriTestingPeriodStartDate;
  final dynamic hejriTestingPeriodEndDate;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
    id: json["id"],
    employeeId: json["employee_id"],
    contractTypeId: json["contract_type_id"],
    contractDurationId: json["contract_duration_id"],
    jobRoleId: json["job_role_id"],
    hrEmployeeId: json["hr_employee_id"],
    name: json["name"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    hejriStartDate: json["hejri_start_date"],
    hejriEndDate: json["hejri_end_date"],
    isActive: json["is_active"],
    isTestingPeriod: json["is_testing_period"],
    testingPeriodStartDate: json["testing_period_start_date"],
    testingPeriodEndDate: json["testing_period_end_date"],
    hejriTestingPeriodStartDate: json["hejri_testing_period_start_date"],
    hejriTestingPeriodEndDate: json["hejri_testing_period_end_date"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "contract_type_id": contractTypeId,
    "contract_duration_id": contractDurationId,
    "job_role_id": jobRoleId,
    "hr_employee_id": hrEmployeeId,
    "name": name,
    "start_date": startDate,
    "end_date": endDate,
    "hejri_start_date": hejriStartDate,
    "hejri_end_date": hejriEndDate,
    "is_active": isActive,
    "is_testing_period": isTestingPeriod,
    "testing_period_start_date": testingPeriodStartDate,
    "testing_period_end_date": testingPeriodEndDate,
    "hejri_testing_period_start_date": hejriTestingPeriodStartDate,
    "hejri_testing_period_end_date": hejriTestingPeriodEndDate,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Country {
  Country({
    this.id,
    this.countryCode,
    this.countryEnName,
    this.countryArName,
    this.countryEnNationality,
    this.countryArNationality,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? countryCode;
  final String? countryEnName;
  final String? countryArName;
  final String? countryEnNationality;
  final String? countryArNationality;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    countryCode: json["country_code"],
    countryEnName: json["country_enName"],
    countryArName: json["country_arName"],
    countryEnNationality: json["country_enNationality"],
    countryArNationality: json["country_arNationality"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_code": countryCode,
    "country_enName": countryEnName,
    "country_arName": countryArName,
    "country_enNationality": countryEnNationality,
    "country_arNationality": countryArNationality,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class EmployeeInfo {
  EmployeeInfo({
    this.id,
    this.employeeId,
    this.homeCountryId,
    this.homeCityId,
    this.religion,
    this.phone,
    this.email,
    this.address,
    this.emergencyContact,
    this.emergencyPhone,
    this.emergencyEmail,
    this.emergencyAddress,
    this.emergencyRelation,
    this.insideKindom,
    this.idNumber,
    this.idType,
    this.idDocument,
    this.idIssueDate,
    this.idIssueExpire,
    this.idIssuePlace,
    this.hejriIdIssueDate,
    this.hejriIdIssueExpire,
    this.passportDocument,
    this.passportNumber,
    this.passportIssueDate,
    this.passportIssueExpire,
    this.passportIssuePlace,
    this.hejriPassportIssueDate,
    this.hejriPassportIssueExpire,
    this.homeAddress,
    this.maritalStatus,
    this.createdAt,
    this.updatedAt,
    this.state,
    this.zipcode,
    this.homePhone,
    this.emergencyName,
  });

  final int? id;
  final int? employeeId;
  final int? homeCountryId;
  final dynamic homeCityId;
  final String? religion;
  final String? phone;
  final String? email;
  final String? address;
  final dynamic emergencyContact;
  final String? emergencyPhone;
  final String? emergencyEmail;
  final String? emergencyAddress;
  final String? emergencyRelation;
  final int? insideKindom;
  final String? idNumber;
  final dynamic idType;
  final dynamic idDocument;
  final DateTime? idIssueDate;
  final DateTime? idIssueExpire;
  final String? idIssuePlace;
  final dynamic hejriIdIssueDate;
  final dynamic hejriIdIssueExpire;
  final dynamic passportDocument;
  final String? passportNumber;
  final DateTime? passportIssueDate;
  final dynamic passportIssueExpire;
  final String? passportIssuePlace;
  final dynamic hejriPassportIssueDate;
  final dynamic hejriPassportIssueExpire;
  final String? homeAddress;
  final int? maritalStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? state;
  final dynamic zipcode;
  final String? homePhone;
  final String? emergencyName;

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) => EmployeeInfo(
    id: json["id"],
    employeeId: json["employee_id"],
    homeCountryId: json["home_country_id"],
    homeCityId: json["home_city_id"],
    religion: json["religion"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    emergencyContact: json["emergency_contact"],
    emergencyPhone: json["emergency_phone"],
    emergencyEmail: json["emergency_email"],
    emergencyAddress: json["emergency_address"],
    emergencyRelation: json["emergency_relation"],
    insideKindom: json["inside_kindom"],
    idNumber: json["id_number"],
    idType: json["id_type"],
    idDocument: json["id_document"],
    idIssueDate: json["id_issue_date"] == null ? null : DateTime.parse(json["id_issue_date"]),
    idIssueExpire: json["id_issue_expire"] == null ? null : DateTime.parse(json["id_issue_expire"]),
    idIssuePlace: json["id_issue_place"],
    hejriIdIssueDate: json["hejri_id_issue_date"],
    hejriIdIssueExpire: json["hejri_id_issue_expire"],
    passportDocument: json["passport_document"],
    passportNumber: json["passport_number"],
    passportIssueDate: json["passport_issue_date"] == null ? null : DateTime.parse(json["passport_issue_date"]),
    passportIssueExpire: json["passport_issue_expire"],
    passportIssuePlace: json["passport_issue_place"],
    hejriPassportIssueDate: json["hejri_passport_issue_date"],
    hejriPassportIssueExpire: json["hejri_passport_issue_expire"],
    homeAddress: json["home_address"],
    maritalStatus: json["marital_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    state: json["state"],
    zipcode: json["zipcode"],
    homePhone: json["home_phone"],
    emergencyName: json["emergency_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "home_country_id": homeCountryId,
    "home_city_id": homeCityId,
    "religion": religion,
    "phone": phone,
    "email": email,
    "address": address,
    "emergency_contact": emergencyContact,
    "emergency_phone": emergencyPhone,
    "emergency_email": emergencyEmail,
    "emergency_address": emergencyAddress,
    "emergency_relation": emergencyRelation,
    "inside_kindom": insideKindom,
    "id_number": idNumber,
    "id_type": idType,
    "id_document": idDocument,
    "id_issue_date": "${idIssueDate!.year.toString().padLeft(4, '0')}-${idIssueDate!.month.toString().padLeft(2, '0')}-${idIssueDate!.day.toString().padLeft(2, '0')}",
    "id_issue_expire": "${idIssueExpire!.year.toString().padLeft(4, '0')}-${idIssueExpire!.month.toString().padLeft(2, '0')}-${idIssueExpire!.day.toString().padLeft(2, '0')}",
    "id_issue_place": idIssuePlace,
    "hejri_id_issue_date": hejriIdIssueDate,
    "hejri_id_issue_expire": hejriIdIssueExpire,
    "passport_document": passportDocument,
    "passport_number": passportNumber,
    "passport_issue_date": "${passportIssueDate!.year.toString().padLeft(4, '0')}-${passportIssueDate!.month.toString().padLeft(2, '0')}-${passportIssueDate!.day.toString().padLeft(2, '0')}",
    "passport_issue_expire": passportIssueExpire,
    "passport_issue_place": passportIssuePlace,
    "hejri_passport_issue_date": hejriPassportIssueDate,
    "hejri_passport_issue_expire": hejriPassportIssueExpire,
    "home_address": homeAddress,
    "marital_status": maritalStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "state": state,
    "zipcode": zipcode,
    "home_phone": homePhone,
    "emergency_name": emergencyName,
  };
}

class Job {
  Job({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.managerId,
    this.jobTitle,
  });

  final int? id;
  final String? name;
  final String? description;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int? managerId;
  final String? jobTitle;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    managerId: json["manager_id"],
    jobTitle: json["job_title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "manager_id": managerId,
    "job_title": jobTitle,
  };
}

class EmployeeRecompense {
  EmployeeRecompense({
    this.id,
    this.enName,
    this.arName,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.amount,
    this.comment,
    this.employeeId,
    this.recompenseId,
    this.pivot,
  });

  final int? id;
  final String? enName;
  final String? arName;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? amount;
  final dynamic comment;
  final int? employeeId;
  final int? recompenseId;
  final Pivot? pivot;

  factory EmployeeRecompense.fromJson(Map<String, dynamic> json) => EmployeeRecompense(
    id: json["id"],
    enName: json["en_name"],
    arName: json["ar_name"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    amount: json["amount"],
    comment: json["comment"],
    employeeId: json["employee_id"],
    recompenseId: json["recompense_id"],
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "en_name": enName,
    "ar_name": arName,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "amount": amount,
    "comment": comment,
    "employee_id": employeeId,
    "recompense_id": recompenseId,
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  Pivot({
    this.employeeId,
    this.recompenseId,
  });

  final int? employeeId;
  final int? recompenseId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    employeeId: json["employee_id"],
    recompenseId: json["recompense_id"],
  );

  Map<String, dynamic> toJson() => {
    "employee_id": employeeId,
    "recompense_id": recompenseId,
  };
}
