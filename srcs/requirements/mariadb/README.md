## Mariadb configuration

### Networking

2 things are needed :
- Modify my.cnf in `/etc/mysql/`
- SQL commands 

#### My.cnf :
under `[mysqld]` :
 - add `port = 3306`		// specify only the port 3306 to connect to it
 - add `bind_address=*` 	// all ip on the network are able to connect
				// otherwise : `bind_address=xx.xx.xx.xx` or `<service name>`

#### SQL commands :
```
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypass';
CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypass';

GRANT ALL ON *.* TO 'myuser'@'localhost';
GRANT ALL ON *.* TO 'myuser'@'%';
FLUSH PRIVILEGEES;
```
> This create a user with password and accessible to @'x' ip address. It can be a service : 'wordpress' or 'nginx'.
> '%' is a wildcard to specify that all ip addresses can connect with this user on mariadb.


