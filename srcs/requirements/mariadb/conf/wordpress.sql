CREATE DATABASE wordpress;
CREATE USER 'achanel'@'%' IDENTIFIED BY 'achapas';
GRANT ALL PRIVILEGES ON wordpress.* TO 'achanel'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rpass';