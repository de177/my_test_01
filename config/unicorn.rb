# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/my_test_01"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/my_test_01/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/log/unicorn/unicorn_mail_intra_err.log"
stdout_path "/var/log/unicorn/unicorn_mail_intra_out.log"

# Unicorn socket
#listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.mail_intra.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
