1. 首先连接服务器
2. cd进入服务器放置的相对应项目的web文件夹
```
cd 相对应的项目代码
```
3. 拉去最新代码
```
git pull
```
4. 停止并删除volumn数据卷
```
docker-compose down -v
```
5. 用docker-compose构建打包，每次本地更新提交之后，在服务器要重新构建一下，服务器才能获取最新的代码
```
docker-compose build
```
6. 启动
```
docker-compose up
```
7. 另开一个终端，进入服务器的相对应项目的文件夹下，查看所有镜像，并找到且复制对应web文件夹的容器ID
```
docker ps
```
8. 拷贝文件，将本地项目的.output文件夹拷贝到服务器根目录下，手动获取静态资源文件
```
docker cp 容器ID:/服务器放置打包的目录文件 ./
```
9. 重启服务器
```
docker-compose restart
```
10. 进入nginx容器
```
docker exec -it 对应的镜像名称 /bin/sh
```
11. 退出正在当前查看的容器
```
exit
```
12. 查看日志
```
docker-compose logs -f
```
13. 打开并查看相对应的文件，使用vim命令
14. 退出并保存vim => :!wq
15. 撤销和恢复撤销快捷键，u是撤销你刚才的动作，ctrl+r是恢复你刚才撤销的动作
