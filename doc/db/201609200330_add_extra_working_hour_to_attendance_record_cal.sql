use BlueHr
go

alter table AttendanceRecordCal add oriExtraWorkingHour float;

alter table AttendanceRecordCal add actExtraWorkingHour float;

alter table AttendanceRecordCal add extraworkType int;