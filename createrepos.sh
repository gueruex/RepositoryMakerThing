#!/bin/bash

if ! test -f /usr/bin/reposync ; then
       yum -y install reposync
fi

if ! test -f /usr/bin/createrepo ; then
        yum -y install createrepo
fi

mkdir -p /var/repo/
reposync --gpgcheck --newest-only --repoid=baseos --destdir=/var/repo --downloadcomps
createrepo /var/repo/baseos

reposync --gpgcheck --newest-only --repoid=appstream --destdir=/var/repo --downloadcomps
createrepo /var/repo/appstream

reposync --gpgcheck --newest-only --repoid=extras --destdir=/var/repo --downloadcomps
createrepo /var/repo/extras

reposync --gpgcheck --newest-only --repoid=powertools --destdir=/var/repo --downloadcomps
createrepo /var/repo/powertools

reposync --gpgcheck --newest-only --repoid=epel --destdir=/var/repo --downloadcomps
createrepo /var/repo/epel
