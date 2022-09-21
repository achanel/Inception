# Inception

Этот проект направлен на расширение ваших знаний в области системного администрирования с помощью Docker.
Вы будете виртуализировать несколько образов Docker, создавая их в своей новой виртуальной машине.

# SUMMARY

* Mandatory part

You then have to set up:
• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

• A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.

• A Docker container that contains MariaDB only without nginx.

• A volume that contains your WordPress database.

• A second volume that contains your WordPress website files.

• A docker-network that establishes the connection between your containers.

* Bonus part

• Set up redis cache for your WordPress website in order to properly manage the
cache.

• Set up a FTP server container pointing to the volume of your WordPress website.

• Create a simple static website in the language of your choice except PHP (Yes, PHP
is excluded!). For example, a showcase site or a site for presenting your resume.

• Set up Adminer.

• Set up a service of your choice that you think is useful. During the defense, you
will have to justify your choice.

# RUN

* 1 Run:
```bash
make
```
* 2:
Open: https://achanel.42.fr/

# LINKS

![basic](diagram.png)
