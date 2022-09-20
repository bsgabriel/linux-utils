dir=~/.local/share/backgrounds/
param="org.gnome.desktop.background"

ls $dir | sort -R | tail -$N | while read file; do
	echo "setting wallpaper: ${file}"
	img_path="file:///$dir/$file"
	gsettings set $param picture-uri $img_path
	gsettings set $param picture-options stretched
	break
done
