import 'package:flutter/material.dart';

import '../../../app/core/color_resources.dart';

class ScheduleModel {
  ScheduleModel(
      {this.start,
      this.end,
      this.id,
      this.title,
      this.allDay,
      this.attendedAt,
      this.leavingAt,
      this.scheduleId,
      this.isAttend,
      this.color = Colors.green});

  DateTime? start;
  DateTime? end;
  DateTime? attendedAt;
  DateTime? leavingAt;
  int? id;
  String? title;
  bool? allDay;
  int? scheduleId;
  bool? isAttend;
  Color? color;

  ScheduleModel copyWith(
          {DateTime? start,
          DateTime? end,
          int? id,
          String? title,
          bool? allDay,
          int? scheduleId,
          bool? isAttend,
          Color? color}) =>
      ScheduleModel(
        start: start ?? this.start,
        end: end ?? this.end,
        id: id ?? this.id,
        title: title ?? this.title,
        allDay: allDay ?? this.allDay,
        scheduleId: scheduleId ?? this.scheduleId,
        isAttend: isAttend ?? this.isAttend,
        color: color ?? this.color,
      );

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
      start: json["start"] == null ? null : DateTime.parse(json["start"]),
      end: json["end"] == null ? null : DateTime.parse(json["end"]),
      attendedAt: json["attended_at"] == null
          ? null
          : DateTime.parse(json["attended_at"]),
      leavingAt: json["leaving_at"] == null
          ? null
          : DateTime.parse(json["leaving_at"]),
      id: json["id"],
      title: json["title"],
      allDay: json["allDay"],
      scheduleId: json["schedule_id"],
      isAttend: json["is_attend"] ?? true,
      color: json["title"] == "Holiday"
          ? Styles.ACTIVE
          : (DateTime.parse(json["start"]).isAfter(DateTime.now()) &&
                  json["is_attend"] == true)
              ? Styles.PRIMARY_COLOR
              : Styles.IN_ACTIVE);

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
