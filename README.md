# 适用于树莓派的 clash 容器。

## 安装

```bash
git clone https://github.com/LJason77/docker-clash.git
cd docker-clash
docker build -t clash .
```

## 运行

clash.yaml 配置文件中，`socks5` 端口为 1080，`http` 端口为 8123，与 [docker-ssr-polipo](https://github.com/LJason77/docker-ssr-polipo) 的端口相同，以减少工作量和冲突。

```bash
docker run -d --restart always --name clash -v /<your>/clash.yaml:/root/.config/clash/config.yaml --network host clash
```