
import 'dart:convert';

AttendanceSchedules attendanceSchedulesFromJson(String str) => AttendanceSchedules.fromJson(json.decode(str));

String attendanceSchedulesToJson(AttendanceSchedules data) => json.encode(data.toJson());

class AttendanceSchedules {
    AttendanceSchedules({
        this.schedules,
    });

    List<ScheduleElement>? schedules;

    AttendanceSchedules copyWith({
        List<ScheduleElement>? schedules,
    }) => 
        AttendanceSchedules(
            schedules: schedules ?? this.schedules,
        );

    factory AttendanceSchedules.fromJson(Map<String, dynamic> json) => AttendanceSchedules(
        schedules: json["schedules"] == null ? [] : List<ScheduleElement>.from(json["schedules"]!.map((x) => ScheduleElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "schedules": schedules == null ? [] : List<dynamic>.from(schedules!.map((x) => x.toJson())),
    };
}

class ScheduleElement {
    ScheduleElement({
        this.id,
        this.employeeId,
        this.scheduleId,
        this.branchId,
        this.workDays,
        this.holidays,
        this.isOneWorkDay,
        this.isHoliday,
        this.isVaction,
        this.startDate,
        this.repeatWeeks,
        this.createdAt,
        this.updatedAt,
        this.schedule,
    });

    int? id;
    int? employeeId;
    int? scheduleId;
    int? branchId;
    String? workDays;
    String? holidays;
    String? isOneWorkDay;
    String? isHoliday;
    String? isVaction;
    DateTime? startDate;
    int? repeatWeeks;
    dynamic createdAt;
    dynamic updatedAt;
    ScheduleSchedule? schedule;

    ScheduleElement copyWith({
        int? id,
        int? employeeId,
        int? scheduleId,
        int? branchId,
        String? workDays,
        String? holidays,
        String? isOneWorkDay,
        String? isHoliday,
        String? isVaction,
        DateTime? startDate,
        int? repeatWeeks,
        dynamic createdAt,
        dynamic updatedAt,
        ScheduleSchedule? schedule,
    }) => 
        ScheduleElement(
            id: id ?? this.id,
            employeeId: employeeId ?? this.employeeId,
            scheduleId: scheduleId ?? this.scheduleId,
            branchId: branchId ?? this.branchId,
            workDays: workDays ?? this.workDays,
            holidays: holidays ?? this.holidays,
            isOneWorkDay: isOneWorkDay ?? this.isOneWorkDay,
            isHoliday: isHoliday ?? this.isHoliday,
            isVaction: isVaction ?? this.isVaction,
            startDate: startDate ?? this.startDate,
            repeatWeeks: repeatWeeks ?? this.repeatWeeks,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            schedule: schedule ?? this.schedule,
        );

    factory ScheduleElement.fromJson(Map<String, dynamic> json) => ScheduleElement(
        id: json["id"],
        employeeId: json["employee_id"],
        scheduleId: json["schedule_id"],
        branchId: json["branch_id"],
        workDays: json["work_days"],
        holidays: json["holidays"],
        isOneWorkDay: json["is_one_work_day"],
        isHoliday: json["is_holiday"],
        isVaction: json["is_vaction"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        repeatWeeks: json["repeat_weeks"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        schedule: json["schedule"] == null ? null : ScheduleSchedule.fromJson(json["schedule"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employee_id": employeeId,
        "schedule_id": scheduleId,
        "branch_id": branchId,
        "work_days": workDays,
        "holidays": holidays,
        "is_one_work_day": isOneWorkDay,
        "is_holiday": isHoliday,
        "is_vaction": isVaction,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "repeat_weeks": repeatWeeks,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "schedule": schedule?.toJson(),
    };
}

class ScheduleSchedule {
    ScheduleSchedule({
        this.id,
        this.name,
        this.from,
        this.to,
        this.color,
        this.flexibility,
        this.attendBefore,
        this.attendLate,
        this.attendAfter,
        this.leaveBefore,
        this.leaveDeficiency,
        this.leaveAfter,
        this.additionalWork,
        this.leaveNotRequired,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? from;
    String? to;
    String? color;
    int? flexibility;
    int? attendBefore;
    int? attendLate;
    int? attendAfter;
    int? leaveBefore;
    int? leaveDeficiency;
    int? leaveAfter;
    int? additionalWork;
    int? leaveNotRequired;
    DateTime? createdAt;
    DateTime? updatedAt;

    ScheduleSchedule copyWith({
        int? id,
        String? name,
        String? from,
        String? to,
        String? color,
        int? flexibility,
        int? attendBefore,
        int? attendLate,
        int? attendAfter,
        int? leaveBefore,
        int? leaveDeficiency,
        int? leaveAfter,
        int? additionalWork,
        int? leaveNotRequired,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        ScheduleSchedule(
            id: id ?? this.id,
            name: name ?? this.name,
            from: from ?? this.from,
            to: to ?? this.to,
            color: color ?? this.color,
            flexibility: flexibility ?? this.flexibility,
            attendBefore: attendBefore ?? this.attendBefore,
            attendLate: attendLate ?? this.attendLate,
            attendAfter: attendAfter ?? this.attendAfter,
            leaveBefore: leaveBefore ?? this.leaveBefore,
            leaveDeficiency: leaveDeficiency ?? this.leaveDeficiency,
            leaveAfter: leaveAfter ?? this.leaveAfter,
            additionalWork: additionalWork ?? this.additionalWork,
            leaveNotRequired: leaveNotRequired ?? this.leaveNotRequired,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory ScheduleSchedule.fromJson(Map<String, dynamic> json) => ScheduleSchedule(
        id: json["id"],
        name: json["name"],
        from: json["from"],
        to: json["to"],
        color: json["color"],
        flexibility: json["flexibility"],
        attendBefore: json["attend_before"],
        attendLate: json["attend_late"],
        attendAfter: json["attend_after"],
        leaveBefore: json["leave_before"],
        leaveDeficiency: json["leave_deficiency"],
        leaveAfter: json["leave_after"],
        additionalWork: json["additional_work"],
        leaveNotRequired: json["leave_not_required"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "from": from,
        "to": to,
        "color": color,
        "flexibility": flexibility,
        "attend_before": attendBefore,
        "attend_late": attendLate,
        "attend_after": attendAfter,
        "leave_before": leaveBefore,
        "leave_deficiency": leaveDeficiency,
        "leave_after": leaveAfter,
        "additional_work": additionalWork,
        "leave_not_required": leaveNotRequired,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
