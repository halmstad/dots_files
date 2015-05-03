## 概述
这是一个mac和linux下常用工具的配置repo，暂时提供vimrc的配置
## 使用办法
### clone 项目
复制文件到相应的路径
```
git clone https://github.com/halmstad/dots_files.git
cp dots_files/_vimrc ~/.vimrc
```
### 安装相关依赖
ctags 用来预处理文件为tagbar调用做准备，flake8是检测 python 文本的
```
yum install -y ctags
pip install -i http://pypi.douban.com/simple flake8
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
### bundle 处理 vim 依赖
```
确保系统可以访问 `www.github.com`
启动 vim
输入:BundleInstall
```
