#! /bin/sh

echo "\n *** 🚀begin🚀 *** \n"

echo "\n --- ⛵️获取 podspec 文件名和路径⛵️ --- \n"

# 获取到文件路径
podspec_file_path=""
podspec_file_name=""
# 文件后缀名
podspec_file_ext="podspec"
# 文件夹路径，pwd 表示当前文件夹
directory="$(pwd)"

# 参数1：路径；参数2：文件后缀名
function getFileAtDirectory() {
	for element in $(ls $1); do
		dir_or_file=$1"/"$element
		# echo "$dir_or_file"
		if [ -d $dir_or_file ]; then
			getFileAtDirectory $dir_or_file
		else
			podspec_file_ext=${dir_or_file##*.}
			if [[ $podspec_file_ext == $2 ]]; then
				echo "$dir_or_file 是 $2 文件"
				podspec_file_path=$dir_or_file
				podspec_file_name=$element
			fi
		fi
	done
}
getFileAtDirectory $directory $podspec_file_ext

echo "\n >>>>>>"
echo "\n podspec_file_path: ${podspec_file_path}"
echo "\n podspec_file_name: ${podspec_file_name}"
echo "\n <<<<<<"

echo "\n --- ⛵️获取 podspec 文件内容⛵️ --- \n"

# 查找 podspec 的版本
search_version="s.version"

# 读取 podspec 的版本
podspec_version=""

# 定义要读取文件的路径
my_file="${podspec_file_name}"
# 按行读取 podspec 文件的内容
while read my_line; do
	# 输出读到的每一行
	# echo $my_line

	# 查找到包含的内容，正则表达式获取以 ${search_version} 开头的内容
	result=$(echo ${my_line} | grep "^${search_version}")
	if [[ "$result" != "" ]]; then
		echo "\n ${my_line} 包含 ${search_version}"

		# 分割字符串，是变量名称，不是变量的值；前面的空格表示分割的字符，后面的空格不可省略
		array=(${result// / })
		# 数组长度
		count=${#array[@]}
		# 获取最后一个元素内容
		version=${array[count - 1]}
		# 去掉 '
		version=${version//\'/}

		podspec_version=$version

		break
	# else
	# 	echo "\n ${my_line} 不包含 ${search_version}"
	fi
done <$my_file

echo "\n >>>>>>"
echo "\n podspec_version: ${podspec_version}"
echo "\n <<<<<<"

# pod_spec_name=${podspec_file_name}
# pod_spec_version=${podspec_version}

# 多行注释
:<<EOF
echo "\n --- ⛵️执行 pod install⛵️ --- \n"

echo "cd ./Example"
cd ./Example
echo "pod install \n"
pod install

# 回到上级目录
echo "\n cd .. :返回上级目录"
cd ..
EOF

echo "\n --- ⛵执行 git 本地提交代码⛵️ --- \n"
echo "git add ."
git add .
echo "git status \n"
git status
echo "git commit -m \"\""

function readCommitInfo() {
	# commit记录信息，从键盘读取，-t 设置一个很大的时间秒数，表示一直等待用户输入，这里设置的时等待 24 小时，即 86400 秒
	if read -p "👀请输入 commit 信息<按 Enter 结束>：" git_commit_desc; then
		# git_commit_desc="${git_commit_desc}"

		git commit -m "${git_commit_desc}"
		# git pull origin master
		git push #-u origin master
	else
		echo "\n  ⚠️输入超时，该脚本退出，请重新执行该脚本⚠️ \n"
		exit 1
	fi
}

# 如果没有输入 commit 信息递归提示用户输入
if [[ "${git_commit_desc}" == "" ]]; then
	echo "git_commit_desc：${git_commit_desc}"
	readCommitInfo
fi
		

echo "\n --- ⛵️执行 pod 本地验证⛵️ --- \n"

# pod 本地验证
echo "pod lib lint --use-libraries --allow-warnings"
# --use-libraries --allow-warnings：使用静态库、忽略警告，如果 lib lint 使用了，
# 那么 spec lint 和 push 时也要使用
pod lib lint --use-libraries --allow-warnings
# 前一个命令执行成功之后再执行 then 里面的
if [ $? -eq 0 ]; then
	echo "\n --- 🎉pod 本地验证成功🎉 --- \n"
	# $(git describe --tags $(git rev-list --tags --max-count=1))
	# 获取最新的 tag
	latestTag="$(git describe --tags $(git rev-list --tags --max-count=1))"

	if [[ "$podspec_version" != "$latestTag" ]]; then
		echo "\n --- ⛵️执行 git 打tag，并推送到远端⛵️ --- \n"
		echo "git tag ${podspec_version}"
		git tag ${podspec_version}
		echo "git push origin master --tags"
		git push origin master --tags
	else
		echo "\n --- 🚫git 远端 tag 和 本地 podspec 中 s.version 相同，无需 pod repo push🚫 --- \n"
		exit 1
	fi
else
	echo "\n --- 😡😡pod 本地验证失败，退出脚本😡😡 --- \n"
	exit 1
fi

# pod 远端验证，这里可以不用远端验证，因为下面的 pod repo push xxx 本身会执行一遍 pod 远端验证
echo "pod spec lint --use-libraries --allow-warnings"
pod spec lint --use-libraries --allow-warnings
# 异常处理，上一个命令没有执行成功，直接退出脚本
if [[ $? -ne 0 ]]; then
	echo "\n --- 😡😡pod 远端验证失败，退出脚本😡😡 --- \n"
	exit 1
fi

# OKPodSpecs 为 pod repo add 时，自己定义的和远端对应的名称
# 本地定义的索引库名称，可以修改为自己的
local_specs_repo_name="OKPodSpecs"
# git 远端索引库地址，可以修改为自己的，https 或者 ssh 形式
reomte_specs_url="git@github.com:KeymonWong/OKPodSpecs.git"
# 管理所有 xxx.podspec 的远端索引库被 pod repo add 之后，被添加到了本地的 ~/.cocoapods/repos 目录下
remote_specs_file_directory_at_local="~/.cocoapods/repos/${local_specs_repo_name}"
# -d 判断目录是否存在
if [[ ! -d $remote_specs_file_directory_at_local ]]; then
	echo "\n --- ⛵️本地存在 远端的索引repo，直接 push⛵️ --- \n"
	pod repo push ${local_specs_repo_name} ${podspec_file_name} --use-libraries --allow-warnings

	# 异常处理，上一个命令没有执行成功，直接退出脚本
	if [[ $? -ne 0 ]]; then
		echo "\n --- 😡😡pod repo push 失败，退出脚本😡😡 --- \n"
		exit 1
	fi
else
	echo "\n --- ⛵️本地不存在 远端的索引repo，先 add 再 push⛵️ --- \n"
	pod repo add ${local_specs_repo_name} ${reomte_specs_url}
	pod repo push ${local_specs_repo_name} ${podspec_file_name} --use-libraries --allow-warnings

	# 异常处理，上一个命令没有执行成功，直接退出脚本
	if [[ $? -ne 0 ]]; then
		echo "\n --- 😡😡pod repo push 失败，退出脚本😡😡 --- \n"
		exit 1
	fi
fi

echo "*** 🎉🎉🎉All Well Done🎉🎉🎉 ***"
