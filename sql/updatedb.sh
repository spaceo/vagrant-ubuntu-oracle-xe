#!/bin/bash

# Users; Prepare import (truncate etc.)
echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus kf_download_test/kf_download_test@//localhost:1521/XE  @/vagrant/sql/pre_kf_download.sql
# Users; Import user tables.
echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus kf_download_test/kf_download_test@//localhost:1521/XE  @/vagrant/sql/gst_dumps/kf_download.dmp
# Permissions (truncate etc.)
echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus weblog_test/weblog_test@//localhost:1521/XE  @/vagrant/sql/pre_weblog.sql
# Permissions; IMport permissions.
echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus weblog_test/weblog_test@//localhost:1521/XE  @/vagrant/sql/gst_dumps/weblog.dmp
# Users; Sync smuser and smuser_extra from postgres.
echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus kf_download_test/kf_download_test@//localhost:1521/XE  @/vagrant/sql/smuser.sql

