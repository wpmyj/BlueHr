USE [BlueHr]
GO
 
 
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫ�б�', N'SysRole', N'Index', NULL, N'Ȩ�޹���', 0, N'[Index ҳ��]��ɫ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫ����', N'SysRole', N'Create', NULL, N'Ȩ�޹���', 0, N'[Create ����]��ɫ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫ�༭', N'SysRole', N'Edit', NULL, N'Ȩ�޹���', 0, N'[Edit ����]��ɫ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫɾ��', N'SysRole', N'Delete', NULL, N'Ȩ�޹���', 0, N'[Delete ����]��ɫ����')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ȩ���б�', N'SystemAuthorization', N'Index', NULL, N'Ȩ�޹���', 0, N'[Index ҳ��]Ȩ�޹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ȩ�޴���', N'SystemAuthorization', N'Create', NULL, N'Ȩ�޹���', 0, N'[Create ����]Ȩ�޹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ȩ�ޱ༭', N'SystemAuthorization', N'Edit', NULL, N'Ȩ�޹���', 0, N'[Edit ����]Ȩ�޹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ȩ��ɾ��', N'SystemAuthorization', N'Delete', NULL, N'Ȩ�޹���', 0, N'[Delete ����]Ȩ�޹���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫȨ���б�', N'SysRoleAuthorization', N'Index', NULL, N'Ȩ�޹���', 0, N'[Index ҳ��]��ɫȨ��')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫȨ�޴���', N'SysRoleAuthorization', N'Create', NULL, N'Ȩ�޹���', 0, N'[Create ����]��ɫȨ��')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫȨ�ޱ༭', N'SysRoleAuthorization', N'Edit', NULL, N'Ȩ�޹���', 0, N'[Edit ����]��ɫȨ��')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ɫȨ��ɾ��', N'SysRoleAuthorization', N'Delete', NULL, N'Ȩ�޹���', 0, N'[Delete ����]��ɫȨ��')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�û��б�', N'User', N'Index', NULL, N'�û�����', 0, N'[Index ҳ��]�û�����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�û�����', N'User', N'Create', NULL, N'�û�����', 0, N'[Create ����]�û�����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�û��༭', N'User', N'Edit', NULL, N'�û�����', 0, N'[Edit ����]�û�����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�û�ɾ��', N'User', N'Delete', NULL, N'�û�����', 0, N'[Delete ����]�û�����')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ְλ�б�', N'JobTitle', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]ְλ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ְλ����', N'JobTitle', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]ְλ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ְλ�༭', N'JobTitle', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]ְλ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ְλɾ��', N'JobTitle', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]ְλ����')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ա�����б�', N'StaffType', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]��Ա���͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ա��������', N'StaffType', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]��Ա���͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ա���ͱ༭', N'StaffType', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]��Ա���͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ա����ɾ��', N'StaffType', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]��Ա���͹���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤�������б�', N'CertificateType', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]֤�����͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤����������', N'CertificateType', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]֤�����͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤�����ͱ༭', N'CertificateType', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]֤�����͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤������ɾ��', N'CertificateType', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]֤�����͹���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ѧ���б�', N'DegreeType', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]ѧ������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ѧ������', N'DegreeType', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]ѧ������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ѧ���༭', N'DegreeType', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]ѧ������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ѧ��ɾ��', N'DegreeType', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]ѧ������')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�����б�', N'InSureType', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]���չ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��������', N'InSureType', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]���չ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ձ༭', N'InSureType', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]���չ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'����ɾ��', N'InSureType', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]���չ���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ְ�����б�', N'ResignType', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]��ְ���͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ְ��������', N'ResignType', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]��ְ���͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ְ���ͱ༭', N'ResignType', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]��ְ���͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ְ����ɾ��', N'ResignType', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]��ְ���͹���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ�������б�', N'AbsenceType', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]ȱ�����͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ����������', N'AbsenceType', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]ȱ�����͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ�����ͱ༭', N'AbsenceType', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]ȱ�����͹���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ������ɾ��', N'AbsenceType', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]ȱ�����͹���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ӱ������б�', N'ExtraWorkType', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]�Ӱ����͹���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ϣ���б�', N'WorkAndRests', N'Index', NULL, N'������Ϣ', 0, N'[Index ҳ��]��Ϣ������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ϣ������', N'WorkAndRests', N'Create', NULL, N'������Ϣ', 0, N'[Create ����]��Ϣ������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ϣ���༭', N'WorkAndRests', N'Edit', NULL, N'������Ϣ', 0, N'[Edit ����]��Ϣ������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ϣ��ɾ��', N'WorkAndRests', N'Delete', NULL, N'������Ϣ', 0, N'[Delete ����]��Ϣ������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��Ϣ������', N'WorkAndRests', N'Import', NULL, N'������Ϣ', 0, N'[Import ����]��Ϣ������')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��˾�б�', N'Company', N'Index', NULL, N'��˾����', 0, N'[Index ҳ��]��˾����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��˾����', N'Company', N'Create', NULL, N'��˾����', 0, N'[Create ����]��˾����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��˾�༭', N'Company', N'Edit', NULL, N'��˾����', 0, N'[Edit ����]��˾����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��˾ɾ��', N'Company', N'Delete', NULL, N'��˾����', 0, N'[Delete ����]��˾����')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�����б�', N'Department', N'Index', NULL, N'���Ź���', 0, N'[Index ҳ��]���Ź���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��������', N'Department', N'Create', NULL, N'���Ź���', 0, N'[Create ����]���Ź���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ű༭', N'Department', N'Edit', NULL, N'���Ź���', 0, N'[Edit ����]���Ź���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'����ɾ��', N'Department', N'Delete', NULL, N'���Ź���', 0, N'[Delete ����]���Ź���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ŵ���', N'Department', N'Import', NULL, N'���Ź���', 0, N'[Import ����]���Ź���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա���б�', N'Staff', N'Index', NULL, N'Ա������', 0, N'[Index ҳ��]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա������', N'Staff', N'Create', NULL, N'Ա������', 0, N'[Create ����]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա���༭', N'Staff', N'Edit', NULL, N'Ա������', 0, N'[Edit ����]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա��ɾ��', N'Staff', N'Delete', NULL, N'Ա������', 0, N'[Delete ����]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա���鿴', N'Staff', N'Show', NULL, N'Ա������', 0, N'[Show ����]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա������', N'Staff', N'Import', NULL, N'Ա������', 0, N'[Import ����]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա��ת��', N'Staff', N'ToFullMemeber', NULL, N'Ա������', 0, N'[ToFullMemeber ����]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա����ְ', N'Staff', N'Resign', NULL, N'Ա������', 0, N'[Resign ����]Ա������')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'Ա������', N'Staff', N'changeJob', NULL, N'Ա������', 0, N'[changeJob ����]Ա������')




INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤���б�', N'Certificate', N'Index', NULL, N'Ա��֤�չ���', 0, N'[Index ҳ��]֤�չ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤������', N'Certificate', N'Create', NULL, N'Ա��֤�չ���', 0, N'[Create ����]֤�չ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤�ձ༭', N'Certificate', N'Edit', NULL, N'Ա��֤�չ���', 0, N'[Edit ����]֤�չ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'֤��ɾ��', N'Certificate', N'Delete', NULL, N'Ա��֤�չ���', 0, N'[Delete ����]֤�չ���')




INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'����б�', N'Shift', N'Index', NULL, N'�Ű����', 0, N'[Index ҳ��]��ι���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�������', N'Shift', N'Create', NULL, N'�Ű����', 0, N'[Create ����]��ι���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��α༭', N'Shift', N'Edit', NULL, N'�Ű����', 0, N'[Edit ����]��ι���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ɾ��', N'Shift', N'Delete', NULL, N'�Ű����', 0, N'[Delete ����]��ι���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ű��б�', N'ShiftSchedule', N'Index', NULL, N'�Ű����', 0, N'[Index ҳ��]�Ű����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ű�����', N'ShiftSchedule', N'Create', NULL, N'�Ű����', 0, N'[Create ����]�Ű����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ű�༭', N'ShiftSchedule', N'Edit', NULL, N'�Ű����', 0, N'[Edit ����]�Ű����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ű�ɾ��', N'ShiftSchedule', N'Delete', NULL, N'�Ű����', 0, N'[Delete ����]�Ű����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Űർ��', N'ShiftSchedule', N'Import', NULL, N'�Ű����', 0, N'[Import ����]�Ű����')


INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ϸ��¼�б�', N'AttendanceRecordDetail', N'Index', NULL, N'���ڹ���', 0, N'[Index ҳ��]��ϸ��¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ϸ��¼����', N'AttendanceRecordDetail', N'Create', NULL, N'���ڹ���', 0, N'[Create ����]��ϸ��¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ϸ��¼�༭', N'AttendanceRecordDetail', N'Edit', NULL, N'���ڹ���', 0, N'[Edit ����]��ϸ��¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'��ϸ��¼ɾ��', N'AttendanceRecordDetail', N'Delete', NULL, N'���ڹ���', 0, N'[Delete ����]��ϸ��¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ִ�п��ڼ���', N'AttendanceRecordDetail', N'Calculate', NULL, N'���ڹ���', 0, N'[Calculate ����]��ϸ��¼����')



INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ͳ�Ƽ�¼�б�', N'AttendanceRecordCal', N'Index', NULL, N'���ڹ���', 0, N'[Index ҳ��]ͳ�Ƽ�¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ͳ�Ƽ�¼����', N'AttendanceRecordCal', N'Create', NULL, N'���ڹ���', 0, N'[Create ����]ͳ�Ƽ�¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ͳ�Ƽ�¼������ʱ', N'AttendanceRecordCal', N'Edit', NULL, N'���ڹ���', 0, N'[Edit ����]ͳ�Ƽ�¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ͳ�Ƽ�¼����', N'AttendanceRecordCal', N'Show', NULL, N'���ڹ���', 0, N'[Show ����]ͳ�Ƽ�¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ͳ�Ƽ�¼ɾ��', N'AttendanceRecordCal', N'Delete', NULL, N'���ڹ���', 0, N'[Delete ����]ͳ�Ƽ�¼����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ͳ�Ƽ�¼��������', N'AttendanceRecordCal', N'ExportReport', NULL, N'���ڹ���', 0, N'[ExportReport ����]ͳ�Ƽ�¼����')


INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�쳣ͳ���б�', N'AttendanceRecordCal', N'ExceptionList', NULL, N'���ڹ���', 0, N'[Index ҳ��]�쳣ͳ�ƹ���')
 
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ���б�', N'AbsenceRecrod', N'Index', NULL, N'ȱ�ڹ���', 0, N'[Index ҳ��]ȱ�ڹ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ������', N'AbsenceRecrod', N'Create', NULL, N'ȱ�ڹ���', 0, N'[Create ����]ȱ�ڹ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ�ڱ༭', N'AbsenceRecrod', N'Edit', NULL, N'ȱ�ڹ���', 0, N'[Edit ����]ȱ�ڹ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ��ɾ��', N'AbsenceRecrod', N'Delete', NULL, N'ȱ�ڹ���', 0, N'[Delete ����]ȱ�ڹ���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ȱ������', N'AbsenceRecrod', N'ApprovalAbsenceRecord', NULL, N'ȱ�ڹ���', 0, N'[ApprovalAbsenceRecord ����]ȱ�ڹ���')


INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ӱ��б�', N'ExtraWorkRecord', N'Index', NULL, N'�Ӱ����', 0, N'[Index ҳ��]�Ӱ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ӱ�����', N'ExtraWorkRecord', N'Create', NULL, N'�Ӱ����', 0, N'[Create ����]�Ӱ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ӱ�༭', N'ExtraWorkRecord', N'Edit', NULL, N'�Ӱ����', 0, N'[Edit ����]�Ӱ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ӱ�ɾ��', N'ExtraWorkRecord', N'Delete', NULL, N'�Ӱ����', 0, N'[Delete ����]�Ӱ����')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�Ӱ�����', N'ExtraWorkRecord', N'ApprovalExtraWorkRecord', NULL, N'�Ӱ����', 0, N'[ApprovalExtraWorkRecord ����]�Ӱ����')



INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ϵͳ�����б�', N'TaskRound', N'Index', NULL, N'ϵͳ�������', 0, N'[Index ҳ��]ϵͳ�������') 

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ڼ��������б�', N'QuartzJob', N'Index', NULL, N'ϵͳ����', 0, N'[Index ҳ��]���ڼ������ù���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ڼ�����������', N'QuartzJob', N'Create', NULL, N'ϵͳ����', 0, N'[Create ����]���ڼ������ù���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ڼ������ñ༭', N'QuartzJob', N'Edit', NULL, N'ϵͳ����', 0, N'[Edit ����]���ڼ������ù���')
INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'���ڼ�������ɾ��', N'QuartzJob', N'Delete', NULL, N'ϵͳ����', 0, N'[Delete ����]���ڼ������ù���')

INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'ϵͳ��Ϣ�����б�', N'SystemSetting', N'Index', NULL, N'ϵͳ����', 0, N'[Index ҳ��]ϵͳ��Ϣ���ù���') 


INSERT [dbo].[SysAuthorization] ( [name], [controlName], [actionName], [parentId], [funCode], [isDelete], [remarks]) VALUES ( N'�鿴��Ϣ', N'MessageRecord', N'Index', NULL, N'ϵͳ����', 0, N'[Index ҳ��]�鿴��Ϣ')  