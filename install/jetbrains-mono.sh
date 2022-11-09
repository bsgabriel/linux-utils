echo "";
echo "--------- JetBrains-Mono ------------";
tmp_folder="jetbrains-tmp";
zip_name="jetbrains-mono.zip"
url="https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*11zv8we*_ga*MTQxMDAwOTYxNS4xNjUwNjg2ODA0*_ga_9J976DJZ68*MTY2MjAwMDU2Ny44LjEuMTY2MjAwMDc0Ni4wLjAuMA..&_ga=2.102079169.1394010789.1662000568-1410009615.1650686804";

mkdir $tmp_folder;
wget -O $tmp_folder/jetbrains-mono.zip $url;
cd $tmp_folder;
unzip $zip_name;

if [ ! -d ~/.local/share/fonts ]; then
	echo "criando ${HOME}/.local/share/fonts..."
	mkdir ~/.local/share/fonts;
fi;

cp -r fonts/* ~/.local/share/fonts;

cd ..;
rm -r $tmp_folder;
fc-cache -f -v;
echo "-------------------------------------";
