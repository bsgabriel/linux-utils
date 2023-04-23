# script para instalação de softwares que uso com mais frequência (ou seja, não podem faltar)

sudo apt update;
sudo apt upgrade -y;
sudo apt install dirmngr ca-certificates software-properties-common gnupg gnupg2 apt-transport-https curl -y 

# vscode apt repository
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg;
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/;
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list';
rm -f packages.microsoft.gpg;

# dbeaver apt repository
sudo add-apt-repository ppa:serge-rider/dbeaver-ceurces.list.d/dbeaver.list -y

# github cli repo
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# intellij repo
sudo add-apt-repository ppa:mmk2410/intellij-idea -y 

#sublime-text repo
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimetext-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/sublimetext-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# android studio
sudo add-apt-repository ppa:maarten-fonville/android-studio;

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
echo "--------- Installing vscode ---------";
sudo apt install code -y;
echo "-------------------------------------";

echo "";
echo "-------------- Intellij -------------"
sudo apt install intellij-idea-community -y
echo "-------------------------------------"

echo "";
echo "-------- Installing eclipse ---------";
sudo snap install eclipse --classic;
echo "-------------------------------------";

echo "";
echo "------------ dbeaver-ce -------------";
sudo apt install dbeaver-ce;
echo "-------------------------------------";
echo "";

echo "";
echo "---------- Installing git -----------";
sudo apt install git -y;
echo "-------------------------------------";

echo "";
echo "----------- GitHub CLI --------------"
sudo apt install gh -y
echo "-------------------------------------";

echo "";
echo "-------- Installing gtk-libs --------";
sudo apt install canberra-gtk-module -y;
sudo apt install libcanberra-gtk-module -y;
echo "-------------------------------------";

echo "";
echo "----- Installing nautilus-admin -----"
sudo apt install nautilus-admin -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing postman ---------";
sudo snap install postman;
echo "-------------------------------------";

echo "-------- Installing spotify ---------";
sudo snap install spotify;
echo "-------------------------------------";

echo "";
echo "--------- Installing copyq ----------";
sudo apt install copyq -y;
echo "-------------------------------------";

echo "";
echo "------ Installing sublime-text ------";
sudo apt install sublime-text -y;
echo "-------------------------------------";

echo "";
echo "----- Installing Android Studio -----";
echo sudo apt install android-studio -y;
echo "-------------------------------------";
