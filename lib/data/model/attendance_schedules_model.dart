// To parse this JSON data, do
//
//     final attendanceSchedules = attendanceSchedulesFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app/core/color_resources.dart';

AttendanceSchedules attendanceSchedulesFromJson(String str) => AttendanceSchedules.fromJson(json.decode(str));

String attendanceSchedulesToJson(AttendanceSchedules data) => json.encode(data.toJson());

class AttendanceSchedules {
    AttendanceSchedules({
        this.schedules,
    });

    List<Schedule>? schedules;

    AttendanceSchedules copyWith({
        List<Schedule>? schedules,
    }) =>
        AttendanceSchedules(
            schedules: schedules ?? this.schedules,
        );

    factory AttendanceSchedules.fromJson(Map<String, dynamic> json) => AttendanceSchedules(
        schedules: json["schedules"] == null ? [] : List<Schedule>.from(json["schedules"]!.map((x) => Schedule.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "schedules": schedules == null ? [] : List<dynamic>.from(schedules!.map((x) => x.toJson())),
    };
}

class Schedule {
    Schedule({
        this.start,
        this.end,
        this.id,
        this.title,
        this.allDay,
        this.scheduleId,
        this.isAttend,
        this.color = Colors.green
    });

    DateTime? start;
    DateTime? end;
    int? id;
    String? title;
    bool? allDay;
    int? scheduleId;
    bool? isAttend;
    Color? color;

    Schedule copyWith({
        DateTime? start,
        DateTime? end,
        int? id,
        String? title,
        bool? allDay,
        int? scheduleId,
        bool? isAttend,
        Color? color
    }) =>
        Schedule(
            start: start ?? this.start,
            end: end ?? this.end,
            id: id ?? this.id,
            title: title ?? this.title,
            allDay: allDay ?? this.allDay,
            scheduleId: scheduleId ?? this.scheduleId,
            isAttend: isAttend ?? this.isAttend,
            color: color ?? this.color,
        );

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        id: json["id"],
        title: json["title"],
        allDay: json["allDay"],
        scheduleId: json["schedule_id"],
        isAttend: json["is_attend"]??true,
       color: (DateTime.parse(json["start"]).isAfter(DateTime.now())&&json["is_attend"]==true)?Colors.green:Colors.red

    );

    Map<String, dynamic> toJson() => {
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "id": id,
        "title": title,
        "allDay": allDay,
        "schedule_id": scheduleId,
        "is_attend": isAttend,
    };
}
