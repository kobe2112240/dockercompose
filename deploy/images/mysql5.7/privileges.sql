use mysql;
select host, user from user;
create user xwwd identified by 'xwwd';
grant all on xwwd.* to xwwd@'%' identified by 'xwwd' with grant option;
flush privileges;
