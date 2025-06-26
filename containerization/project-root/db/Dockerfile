FROM mysql:8.3.0

# Set default configs in CMD, no need for config files
CMD ["mysqld", "--default_authentication_plugin=mysql_native_password", \
     "--character-set-server=utf8mb4", \
     "--collation-server=utf8mb4_unicode_ci"]