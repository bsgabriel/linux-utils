url='https://download2.gluonhq.com/scenebuilder/18.0.0/install/linux/SceneBuilder-18.0.0.deb'
file_name=$(basename "$url")
wget $url
sudo dpkg -i $file_name
rm $file_name
