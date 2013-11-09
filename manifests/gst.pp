node default {

  $host_schema = "localhost:1521/XE"
  $sqlplus = "sqlplus system/manager@//$host_schema"
  $sqlplus_weblog_test = "sqlplus weblog_test/weblog_test@//$host_schema"
  $sqlplus_kf_download_test = "sqlplus kf_download_test/kf_download_test@//$host_schema"
  $echo_tables = "echo 'select OBJECT_NAME from user_objects where object_type = \'TABLE\';'"

  exec { "create-tables-weblog-test":
    command => "echo exit | $sqlplus @/vagrant/sql/weblog_test.ora.sql",
    path => "/bin:/u01/app/oracle/product/11.2.0/xe/bin",
    unless => "$echo_tables | $sqlplus_weblog_test | grep SERVICES2",
  }

  exec { "create-tables-kf-download-test":
    command => "echo exit | $sqlplus @/vagrant/sql/kf_download_test.ora.sql",
    path => "/bin:/u01/app/oracle/product/11.2.0/xe/bin",
    unless => "$echo_tables | $kf_download_test | grep SMUSER",
  }

}
