#!/bin/bash

echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus kf_download_test/kf_download_test@//localhost:1521/XE  @/vagrant/sql/pre_kf_download.sql

echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus kf_download_test/kf_download_test@//localhost:1521/XE  @/vagrant/sql/gst_dumps/kf_download.dmp

echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus weblog_test/weblog_test@//localhost:1521/XE  @/vagrant/sql/pre_weblog.sql

echo "EXIT;" | NLS_LANG=AMERICAN_AMERICA.UTF8 rlwrap sqlplus weblog_test/weblog_test@//localhost:1521/XE  @/vagrant/sql/gst_dumps/weblog.dmp

