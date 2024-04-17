git clone https://github.com/Blobby-Boi/BlobeVM
cd BlobeVM
pip install textual
sleep 2
python3 installer.py
docker build -t blobevm . --no-cache
cd ..

sudo apt update
sudo apt install -y jq

mkdir Save
cp -r BlobeVM/root/config/* Save

json_file="BlobeVM/options.json"
if jq ".enablekvm" "$json_file" | grep -q true; then
    docker run -d --name=BlobeVM -e PUID=1000 -e PGID=1000 --device=/dev/kvm --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=BlobeVM -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config --restart unless-stopped blobevm
else
    docker run -d --name=BlobeVM -e PUID=1000 -e PGID=1000 --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=BlobeVM -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config --restart unless-stopped blobevm
fi
clear
echo "BLOBEVM WAS INSTALLED SUCCESSFULLY! Check Port Tab"
