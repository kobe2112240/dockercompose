FROM mysql:latest
MAINTAINER HeXin <hexincloud@gmail.com>


#设置免密登录 执行setup之后重新生成权限

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

#将所需文件放到容器中
#业务系统脚本
COPY comments.sql /mysql/comments.sql
COPY init.sql    /mysql/init.sql
COPY update.sql /mysql/update.sql
#启动脚本
COPY setup.sh /mysql/setup.sh
#数据库初始化脚本
COPY schema.sql /mysql/schema.sql
COPY privileges.sql /mysql/privileges.sql

###修复时区误差bug
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


#设置容器启动时执行的命令
CMD ["sh", "/mysql/setup.sh"]
