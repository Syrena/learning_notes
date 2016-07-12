###### 分隔字符串为字符串数组
str_file="$1"
OLD_IFS="$IFS"
IFS=","
arr=$(cat $str_file)
IFS="$OLD_IFS"
for s in ${arr[@]}; do echo $s; done

###### ssh 与 bash
#ssh $REMOTE_YUM bash -s -- < ./check_signature.sh -i $SIG_ID -a $SIG_DIGEST -f ${mcp_path}/Alpha/latest
#ssh < ./check_signature.sh $REMOTE_YUM bash -s -- ${mcp_alpha}/latest
#ssh $REMOTE_YUM bash -s -- ${mcp_alpha}/latest < ./check_signature.sh
#ssh $REMOTE_YUM < ./check_signature.sh bash -s -- ${mcp_alpha}/latest

#mcp_base_reg="/srv/html/mcp/release/mcp8_[0-9](_[a-zA-Z0-9]+)?/Alpha/[0-9]+/base"
###### trap
#testfun() {
#    echo "nothing"
#    return 1
##    exit 3
#}
#ERRTRAP(){
#  echo "[LINE:$1] Error: Command or function exited with status $?"
#  exit 45
#}
#trap 'ERRTRAP $LINENO' ERR
#trap 'echo exit ${FUNCNAME[0]} with status $?' EXIT
##trap 'echo $?' ERR
#echo "*********excuting"
#testfun
##mkdir adir/adir
#echo "*********over"
#
#exit 23

###### 子shell的变量和函数
#people="father"
#father() {
#echo this is $people
#}
#bash tt.sh
#echo $people
#father
#echo $people
#export -p

###### 写文件
#echo "KERNEL==\"*\", SUBSYSTEM==\"net\", ACTION==\"add\", DRIVERS==\"qeth\", \
#ATTRS{card_type}==\"OSD_10GIG\", RUN+=\"/usr/bin/rcpu.sh %k %E{ACTION}\"" > deletable/test_file
#
cat << EOF > deletable/test_file2
#!/bin/bash
#
# Performance Fix (workaround).
# Set rps_cpus mask to include all of the CPU's configured for the LPAR
# Copyright (c) IBM Corp. 2015.

MASK="ff"
file="/sys/class/net/\$1/queues/rx-0/rps_cpus"
[ -f \${file} ] && echo \$MASK > \$file
EOF

cat << EOF > deletable/test_file4.sh
# workaround
cat << EOFEOF > deletable/test_file3
#!/bin/bash
#
# Performance Fix (workaround).
# Set rps_cpus mask to include all of the CPU's configured for the LPAR
# Copyright (c) IBM Corp. 2015.

MASK="ff"
file="/sys/class/net/\\\$1/queues/rx-0/rps_cpus"
[ -f \\\${file} ] && echo \\\$MASK > \\\$file
EOFEOF
EOF
chmod a+x deletable/test_file4.sh
deletable/test_file4.sh


###### 定制$PS4
#export PS4='+{$LINENO:${FUNCNAME[0]}} '

###### expect 
# 命令行参数 
# $argv，参数数组，使用[lindex $argv n]获取，$argv0为脚本名字
# $argc，参数个数
# http://xstarcd.github.io/wiki/shell/expect.html
#set username [lindex $argv 0]
#set passwd [lindex $argv 1]
# 
#set timeout 30
# 
## spawn是expect内部命令，开启ssh连接
#spawn ssh -l $username 9.152.166.45
# 
## 判断上次输出结果里是否包含“password:”的字符串，如果有则立即返回，否则就等待一段时间(timeout)后返回
#expect "password:"
# 
## 发送内容ispass(密码、命令等)
#send "$passwd\r"
#interact
#spawn ls
#expect eof
#catch wait result
# 
## 发送内容给用户
#send_user "\nFor you ...\n"
#send_user "result: [lindex $result 3]\n"
##send_user "$argv0 [lrange $argv 0 2]\n"
#send_user "$argv0\n"
#send_user "[lrange $argv 0 2]\n"
#send_user "[lindex $argv 2]\n"
#send_user "It's OK\n"
# 执行完成后保持交互状态，控制权交给控制台(手工操作)。否则会完成后会退出。
# interact
#exit

###### cut 和 list 格式
#cmd="find ./deletable -type f -maxdepth 1"
#list=$($cmd)
#echo "1> list is $list"
#echo "2> list is $(echo $list)"
#listb=$($cmd | paste -s -d" ")
#echo "listb is $listb"
#echo "------------"
#for item in $listb; do
#	echo $item
#done
#cp $listb ./tttt

###### 函数返回字符串
#function return_str() {
#	echo liusl
#}
#name=$(return_str)
#echo "My name is $name"

###### 空文件测试
#function has_line() {
#	[ -f file ] && {
#		 sed -i '/^$/d' file
#		[ ! -s file ] && {
#			echo empty && rm file
#			return 1
#		}
#		[ -s file ] && {
#			read line < file
#			sed -i "1d" file
#			return 0
#		}
#	}
#	return 2
#}
#while has_line; do
#	echo "got it:"$line
##	echo ".....next line......"
##	sed q file
##	echo "'''''''''''"
#done

###### 解析命令选项
#function upload() {
#	while getopts :p:i:o: opt
#    do
#        case $opt in
#            p) with_path=$OPTARG;;
#            i) local_file=$OPTARG;;
#            o) remote_file=$OPTARG;;
##            *) usage; exit 1;;
#        esac
#    done
#    if test "$with_path" = "y"; then
#        echo yes
#    else
#        echo no
#    fi
#    echo "local file is: $local_file"
#    echo "remote file is: $remote_file"
#}
#upload -p y -i main.sh -o files/file.sh

###### 局部变量显式声明
#function echo_local_variable() {
#	local var=$1
#	varout=$1
#	echo $var
#}
#function echo_echo() {
#	echo "first:"$var
#	echo "second:"$varout
#}
#echo_local_variable "liuliu"
#echo_echo

###### 包名列表去掉版本和后缀，-i使得原地更改
#sed -i "s/\-[0-9].*rpm/""/" list-base.txt

###### 数组测试
#list[0]="liusl"
#list[1]="3"
#list[2]="oh yeah"
#for item in ${list[@]}; do
#    echo $item
#done
#echo ${#list[@]}
#echo ${list[2]}

###### if和与或的条件判断
#vara="liusl"
#varb="liusl"
#function get-and {
#    # when vara==varb, the following $? is 0
#    # when vara!=varb, the following $? is 1
#    [ "$vara" = "$varb" ]
#    echo $?
#    # if the condition return 0, will echo equal
#    [ "$vara" = "$varb" ] && echo equal
#    
#    [ "$vara" = "$varb" ] && return 0
#    return 1
#}
## if get-and return 0, it means yes and echo equal
#if get-and; then
#    echo "finally, equal"
#else
#    echo "finally, not equal"
#fi

###### 列出特定后缀文件并逐个访问
#DELETE_MCP_PKGS="*.sh"
#for file in $DELETE_MCP_PKGS; do
#    echo $file
#done

###### 构造变量并赋值使用
#name="liusl-folder"
#variable=name
#echo ${!variable}
#mkdir ${!variable}

###### ls得到的值判断个数
#list="$(ls aaa*)"
#echo "the list is:"
#echo $list
#for item in $list; do
#    echo $item
#done
#echo ${#list}
#echo ${list[@]}
#echo ${list[*]}
#echo "----"
##OLD_IFS="$IFS"
##IFS="\t"
#arr=($list)
##IFS="$OLD_IFS"
#echo ${arr}
#echo ${#arr[@]}
#for item in ${arr[@]}; do
#    echo $item
#done

###### 字符串截取，以校验和为例
#list="$(sha1sum systemd-208-11.el7_0.6.kvmibm.4.s390x.rpm| cut -d ' ' -f1)"
#echo $list

###### 判断文件及文件夹是否存在 
#dir="./var"
#if test -d $dir; then
#    echo "yes"
#fi
#dirb="./rpms"
##if ls $dirb/*.rpm >/dev/null 2>&1; then
#if ls *.rpm >/dev/null 2>&1; then
#    echo "file yes"
#fi

###### 字符串
#LATEST_UNSIGNED_ID="$(date +%Y%m%d-%H%M%S)"
#ZFROBISHER_UNSIGNED_TARBALL="zfrobisher-rpms-unsigned-$LATEST_UNSIGNED_ID"".tar.gz"
#echo $ZFROBISHER_UNSIGNED_TARBALL

###### 
#source ./func-test
#change-string
#echo-string

###### 写文件
#cat <<EOF > writing-test.txt
#1111111111111
#EOF
#flag="false"
#if test "$flag" = "true"; then
#    cat <<EOF >>writing-test.txt
#2222222222
#EOF
#fi
#cat <<EOF >> writing-test.txt
#33333333333
#EOF

###### 上一个命令状态
#rmdir non-exist-folder
#if test "$?" != 0; then
#    echo failure!
#fi
#
#createrepo_c pdir > /dev/null
#if test "$?" == 0; then
#    echo successful!
#fi

###### 显示时去掉换行
#line=`find -type f -iname "*.sh"`
#echo "this is " $line

###### 字符串截取(http://justcoding.iteye.com/blog/1963463)
#str='http://www.baidu.com/cut-string.html'
#echo $str
#echo ${str#*/}  #从左边开始删除第一次出现子字符串即其左边字符，保留右边字符。
#echo ${str##*/} #删除最后出现的"/"及其左边所有字符
#echo ${str%/*}
#echo ${str%%/*}

##signID=${str: -6}
#signID=$str
#echo -e $signID
#echo -e ${signID%??}


####### case 和 颜色
#echo "these are the packages."
#read -p "do you want to show them all? " answer
#case $answer in 
#yes)
#    echo -e "\033[2;31mlasjdflkasjkd\033[0m";;
#no)
#    echo -e "\033[2;37mnonono\033[0m";;
#esac


####### 字符串空测试
#str=""
#[ -n "$str" ] && echo "not empty"
#str=
#if [ -n "$str" ]; then
#    echo "not empty"
#else
#    echo "empty"
#fi
#STRING=
#
#if [ -z "$STRING" ]; then 
#    echo "STRING is empty" 
#fi
#
#if [ -n "$STRING" ]; then 
#    echo "STRING is not empty" 
#fi
