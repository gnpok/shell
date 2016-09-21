###ssh安全措施
> /var/log/secure中经常看到有人一直试探服务器密码，于是想了点办法来解决

* 修改ssh端口号
> 在/etc/ssh中修改port,修改大一点的端口号，让别人很难扫描到

* 利用`fail2ban`软件进行防护
> fail2ban的原理就是每一分钟查看secure日至文件，若同一个ip失败尝试过多则用iptables将其封杀，具体使用请问百度

* ssh密码不要使用弱口令
