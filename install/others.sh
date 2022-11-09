# script de instalação de outros softwares/utilitários que eventualmente uso

# peek repo
sudo add-apt-repository ppa:peek-developers/stable -y

# anydesk apt repository
curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY | gpg --dearmor | sudo tee /usr/share/keyrings/anydesk.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main' | sudo tee /etc/apt/sources.list.d/anydesk.list

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
echo "--------- Installing htop -----------";
sudo apt install htop -y;
echo "-------------------------------------";

echo "";
echo "--------- Installing maven ----------";
sudo apt install maven -y;
echo "-------------------------------------";

echo "";
echo "--------- Installing gradle ---------";
sudo sudo snap install gradle --classic;
echo "-------------------------------------";

echo "";
echo "--------- Installing peek -----------";
sudo apt install peek -y;
echo "-------------------------------------";

echo "";
echo "-------- Installing anydesk ---------";
sudo apt install anydesk -y;
echo "-------------------------------------";

echo "";
echo "------------ Journable --------------";
sudo apt install flatpak -y;
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install flathub net.daase.journable -y;
echo "-------------------------------------";