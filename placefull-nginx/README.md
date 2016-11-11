# placefull-nginx


### Chef

- Chef 12.0 or later


Uses basic command line executions to install the latet version of NGinx.  It will only work on Amazon Linux. Ideally a more generic cookbook should be used to install Nginx.

Also adds password security by copying an included htpasswd file to the nGinx directoy on the box.

Also add security and kibana/elasticsearch routing with an included nginx.conf file


if you wish to change the user/password combo found in the htpasswd file do this on an Amazon linux box. Then copy and paste the contents of the generated htpasswd file.
placefull is the user


cd ~
yum install httpd-tools
htpasswd -c htpasswd placefull
 



