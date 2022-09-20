sudo apt update;
sudo apt upgrade -y;

sudo apt install apt-transport-https -y;
sudo apt install curl -y;

echo "Installing repositories"

# anydesk apt repository
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -;
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list;

# sublime-text apt repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -;
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;

# vscode apt repository
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg;
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/;
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list';
rm -f packages.microsoft.gpg;

# pgAdmin apt repository
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add;
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list';

# wine apt repository
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'

# dbeaver apt repository
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

# github cli repo
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# peek repo
sudo add-apt-repository ppa:peek-developers/stable

# intellij repo
sudo add-apt-repository ppa:mmk2410/intellij-idea -y


sudo apt update;

echo "";
echo "---------- Installing java ----------";
sudo apt install default-jre -y;
sudo apt install default-jdk -y;
sudo apt install openjfx -y;
sudo apt install libopenjfx-java -y;
sudo apt install openjdk-8-jdk -y;
sudo apt install openjdk-8-jre -y;
echo "-------------------------------------";

echo "";
echo "------- Installing net-tools --------";
sudo apt install net-tools -y;
echo "-------------------------------------";

echo "";
echo "---------- Installing ssh -----------";
sudo apt install ssh -y;
echo "-------------------------------------";

echo "";
echo "---------- Installing pip -----------";
sudo apt install python3-pip -y;
echo "-------------------------------------";

echo "";
echo "--------- Installing vscode ---------";
sudo apt install code -y;
echo "-------------------------------------";

echo "";
echo "------ Installing sublime-text ------";
sudo apt install sublime-text -y;
echo "-------------------------------------";


echo "";
echo "------- Installing postgresql -------";
sudo apt install postgresql -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing pgadmin ---------";
sudo apt install pgadmin4 -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing anydesk ---------";
sudo apt install anydesk -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing gtk-libs --------";
sudo apt install canberra-gtk-module -y;
sudo apt install libcanberra-gtk-module -y;
echo "-------------------------------------";

echo "";
echo "--------- Installing copyq ----------";
sudo apt install copyq -y;
echo "-------------------------------------";

echo "";
echo "---------- Installing git -----------";
sudo apt install git -y;
echo "-------------------------------------";

echo "";
echo "------- Installing papi-tools -------";
sudo apt install papi-tools -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing lolcat ----------";
sudo apt install lolcat -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing unrar -----------";
sudo apt install unrar -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing figlet ----------";
sudo apt install figlet -y;
echo "-------------------------------------";

echo "";
echo "----- Installing nautilus-admin -----"
sudo apt install nautilus-admin -y;
echo "-------------------------------------";

echo "";
echo "--------- Installing htop -----------";
sudo apt install htop -y;
echo "-------------------------------------";

echo "";
echo "--------- Installing wine -----------";
sudo apt install winehq-stable -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing postman ---------";
sudo snap install postman;
echo "-------------------------------------";

echo "";
echo "------------ dbeaver-ce -------------";
sudo apt install dbeaver-ce;
echo "-------------------------------------";

echo "";
echo "-------- Installing eclipse ---------";
sudo snap install eclipse --classic;
echo "-------------------------------------";

echo "";
echo "-------- Installing spotify ---------";
sudo snap install spotify;
echo "-------------------------------------";

echo "";
echo "--------- Installing maven ----------";
sudo apt install maven -y;
echo "-------------------------------------";

echo "";
echo "------ Installing scenebuilder ------";
url='https://download2.gluonhq.com/scenebuilder/18.0.0/install/linux/SceneBuilder-18.0.0.deb'
file_name=$(basename "$url")
wget $url
sudo dpkg -i $file_name
rm $file_name
echo "-------------------------------------";

echo "";
echo "--------- Installing peek -----------";
sudo apt install peek -y;
echo "-------------------------------------";

echo "";
echo "--------- Installing gradle ---------";
sudo sudo snap install gradle --classic;
echo "-------------------------------------";

echo "";
echo "----------- GitHub CLI --------------"
sudo apt install gh -y
echo "-------------------------------------";

echo "";
echo "------------- Firefox ----------------"
current=$(lsb_release -rs)
ref='22.04' # depois dessa versão, o firefox vem pré instalado como snap
low=$(echo -e "$ref\n$ref" | sort --version-sort | head --lines=1)

# se a versão atual for maior ou igual que a versao 22.04, remove o snap do firefox
if [[ $low < $currentVersion || $low == $currentVersion ]]; then
	# removendo pacote snap do firefox, e adicionando repositório apt
	sudo snap remove firefox;
	sudo add-apt-repository ppa:mozillateam/ppa;

	echo '
	Package: *
	Pin: release o=LP-PPA-mozillateam
	Pin-Priority: 1001
	' | sudo tee /etc/apt/preferences.d/mozilla-firefox;

	echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox;
	sudo apt install firefox -y;
fi
echo "-------------------------------------";

echo "";
echo "--------- JetBrains-Mono ------------";
tmp_folder="jetbrains-tmp";
zip_name="jetbrains-mono.zip"
url="https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*11zv8we*_ga*MTQxMDAwOTYxNS4xNjUwNjg2ODA0*_ga_9J976DJZ68*MTY2MjAwMDU2Ny44LjEuMTY2MjAwMDc0Ni4wLjAuMA..&_ga=2.102079169.1394010789.1662000568-1410009615.1650686804";

mkdir $tmp_folder;
wget -O $tmp_folder/jetbrains-mono.zip $url;
cd $tmp_folder;
unzip $zip_name;
cp -r fonts/* ~/.local/share/fonts;

cd ..;
rm -r tmp_folder;
fc-cache -f -v;
echo "-------------------------------------";

echo "";
echo "------------ Journable --------------";
sudo apt install flatpak -y;
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install flathub net.daase.journable -y;
echo "-------------------------------------";

echo "";
echo "-------------- Intellij -------------"
sudo apt install intellij-idea-community -y
echo "-------------------------------------"