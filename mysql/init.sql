-- Set MySQL configuration for WordPress
SET GLOBAL max_allowed_packet = 64 * 1024 * 1024;
SET GLOBAL innodb_buffer_pool_size = 1024 * 1024 * 1024;
SET GLOBAL innodb_log_file_size = 256 * 1024 * 1024;
SET GLOBAL innodb_flush_log_at_trx_commit = 2;
SET GLOBAL innodb_flush_method = 'O_DIRECT';

-- Create WordPress database if it doesn't exist
CREATE DATABASE IF NOT EXISTS wordpress;

-- Grant privileges to WordPress user
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;