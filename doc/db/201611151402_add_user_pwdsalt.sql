use BlueHr
go

alter table [user] add pwdSalt varchar(200);

---用户的密码将重新设置为初始密码 123456@
update [User] set pwdSalt='ZVqcOaidXIYon8nzi+C1Gqf6kHlgrZFWjoAHBX5zo9/JyDfC',
                  pwd='5086e4b986ee1ebd21694ce7d32a5269'
                  where pwdSalt is null;