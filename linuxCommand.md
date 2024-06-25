sudo apt-get update
             upgrade

sudo apt-get install <package>
sudo apt-get remove <package>
sudo apt-cache search <keyword>

install the package
sudo dpkg -i <package.deb>


uname -a  //sytem information
df -h //Shows disk space usage
free -h //free space
top // dynamic real-time view of system processes

file system:
ls
cp
mv
mkdir
rm -rf my_videos

networking:
ifconfig
ping <host>: Pings a host to check connectivity
netstat -tuln
iptables
 - iptables <OPTIONS> <CHAIN> <RULE>
 - iptables -L
 - iptables -A INPUT -p tcp --dport 80 -j ACCEPT
 - iptables -D INPUT -p tcp --dport 80 -j ACCEPT



Process Management:
ps aux
kill <PID>: Sends a termination signal to a process with the specified PID.
killall <process_name>: Kills all processes with the specified name.

Logs and Monitoring:
tail -f <logfile>: Displays the last few lines of a file and monitors for new lines.
grep <pattern> <file>: Searches for a pattern in a file
journalctl: Views system logs using systemd's journal.

ssh <user>@<host>: Connects to a remote host via SSH.
scp <file> <user>@<host>:<destination>: Copies files securely between hosts using SSH.
