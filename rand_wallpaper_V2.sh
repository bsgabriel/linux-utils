dir=~/.local/share/backgrounds/
param="org.gnome.desktop.background"

# currentWallpaper=$(gsettings get $param picture-uri)
# currentWallpaper=$(echo $currentWallpaper | cut -d "/" -f11-)
# currentWallpaper=$(echo $currentWallpaper | sed 's/.$//')
currentWallpaper=$(echo $(echo $(gsettings get $param picture-uri) | cut -d "/" -f11-) | sed 's/.$//')

change_wallpaper() {
	ls $dir | sort -R | tail -$N | while read file; do
		if [ "$file" = "$currentWallpaper" ]; then
			echo "The wallpaper '${file}' is already in use. Trying again"
			echo ""
			change_wallpaper
			break;
		fi

		echo "setting wallpaper: ${file}"
		img_path="file:///$dir/$file"
		gsettings set $param picture-uri $img_path
		gsettings set $param picture-options stretched
		break
	done
}

change_wallpaper
