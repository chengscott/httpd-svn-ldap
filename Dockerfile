FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    apache2 \
    ca-certificates \
    subversion \
    libapache2-mod-svn
RUN a2enmod dav dav_svn authz_svn ldap authnz_ldap
COPY dav_svn.conf /etc/apache2/mods-available
EXPOSE 80
ENTRYPOINT service apache2 start && tail -f /var/log/apache2/error.log
