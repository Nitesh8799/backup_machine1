
mkdir /backups/
tar -zcvf /backups/rpmdb-$(date +"%d%m%Y").tar.gz  /var/lib/rpm
rm -f /var/lib/rpm/__db*		
/usr/lib/rpm/rpmdb_verify /var/lib/rpm/Packages
cd /var/lib/rpm/
mv /var/lib/rpm/Packages /var/lib/rpm/Packages.back
/usr/lib/rpm/rpmdb_dump Packages.back | /usr/lib/rpm/rpmdb_load Packages
/usr/lib/rpm/rpmdb_verify Packages
rpm -qa >/dev/null
rpm -vv --rebuilddb
git clone https://github.com/facebookincubator/dcrpm.git
cd dcrpm
python setup.py install
dcrpm
