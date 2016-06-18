#!/bin/bash

mysql -hlocalhost -uroot << EOF
use coveros;
CREATE TABLE devopslab (state VARCHAR(20), abbreviation VARCHAR(2));
LOAD DATA LOCAL INFILE '/home/vagrant/StateTable.txt' INTO TABLE devopslab;
GRANT ALL PRIVILEGES on *.* TO user1@192.168.33.11;

quit;
EOF