#/bin/bash
echo 'deb http://http.debian.net/debian jessie-backports main' > /etc/apt/sources.list.d/backports.list

apt-get update
ker=$(/bin/uname -r)
apt-get install -t jessie-backports -y linux-image-${ker} hyperv-daemons

mods=( hv_vmbus hv_storvsc hv_blkvsc hv_netvsc )
module_file=/etc/initramfs-tools/modules
for mod in ${mods[@]}
do
    if ! grep $mod $module_file >> /dev/null; then
        echo  "${mod}" >> $module_file
    fi
done

echo "Created $(cat ${module_file})"
eval /usr/sbin/update-initramfs -u
