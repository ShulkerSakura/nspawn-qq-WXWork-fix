#!/bin/bash
#判断系统是否满足先决条件
echo "[搜索nspawn-qq deepin容器]"
sleep 0.5s
if [ -d $HOME/.machines/deepin ];then
	echo "-发现deepin容器"
	echo "~/.machines/deepin"
	sleep 0.3s
	echo "[搜索容器内已初始化的企业微信Prefix]"
	sleep 0.5s
	if [ -d $HOME/.machines/deepin/home/u1000/.deepinwine/Deepin-WXWork ];then
		echo "-企业微信Prefix存在,继续执行"
		echo "~/.machines/deepin/home/u1000/.deepinwine/Deepin-WXWork"
		sleep 0.3s
	else
		echo "企业微信Prefix不存在,请安装企业微信后至少运行一次以完成初始化"
		exit 0;
	fi
else
	echo "-未发现nspawn-qq deepin容器"
	sleep 0.1s
	echo "请先安装nspawn-qq deepin容器"
	echo "https://github.com/loaden/nspawn-qq"
	exit 0
fi
#替换容器内企业微信的启动脚本
echo "[替换容器企业微信启动脚本]"
sleep 0.3s
echo "-备份原始启动脚本"
sudo mv -v $HOME/.machines/deepin/opt/apps/com.qq.weixin.work.deepin/files/run.sh $HOME/.machines/deepin/opt/apps/com.qq.weixin.work.deepin/files/run.sh.old
sleep 0.3s
echo "-生成新的启动脚本"
sudo echo '#!/bin/bash
env WINEPREFIX=/home/u1000/.deepinwine/Deepin-WXWork/ deepin-wine6-stable /home/u1000/.deepinwine/Deepin-WXWork/drive_c/Program\ Files/WXWork/WXWork.exe' > run.sh
chmod +x run.sh
sudo mv run.sh $HOME/.machines/deepin/opt/apps/com.qq.weixin.work.deepin/files/
sleep 0.3s
#工作完成
echo "[nspawn-qq企业微信修复完成]"
exit 0;