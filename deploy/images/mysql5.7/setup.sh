#!/bin/bash
set -e

#查看mysql服务的状态
echo `service mysql status`
echo '1.启动mysql....'

#启动mysql
service mysql start
sleep 3
echo `service mysql status`

echo '2.开始导入数据....'
#导入数据
#建库
mysql  < /mysql/schema.sql
#建表
mysql --database=xwwd  < /mysql/init.sql
mysql --database=xwwd  < /mysql/update.sql
echo "导入数据库完毕!!!"
sleep 3
echo `service mysql status`

#重新设置mysql密码
echo '4.开始修改密码....'
mysql < /mysql/privileges.sql
echo '5.修改密码完毕....'

#sleep 3
echo `service mysql status`
echo `mysql容器启动完毕,且数据导入成功`

tail -f /dev/null

