
# pgAdmin apt repository
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add;
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list';

sudo apt update;

echo "";
echo "------- Installing postgresql -------";
sudo apt install postgresql -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing pgadmin ---------";
sudo apt install pgadmin4 -y;
echo "-------------------------------------";
