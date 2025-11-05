# XrayR + WireGuard (Docker)

一个将 **XrayR** 与 **WireGuard** 集成在同一个容器中的镜像。
WireGuard 只在容器内生效，不影响宿主机 SSH。

## 构建镜像
```bash
docker build -t yourname/xrayr-wireguard .
```

## 运行容器
```bash
docker run -d   --cap-add=NET_ADMIN   --device /dev/net/tun   -p 443:443   yourname/xrayr-wireguard
```

## 多节点部署
```bash
docker run -d   --name xrayr-hk   -p 443:443   --cap-add=NET_ADMIN   --device /dev/net/tun   -v ./hk/config.yml:/opt/config.yml   -v ./hk/wg.conf:/etc/wireguard/wg.conf   yourname/xrayr-wireguard

docker run -d   --name xrayr-tw   -p 444:443   --cap-add=NET_ADMIN   --device /dev/net/tun   -v ./tw/config.yml:/opt/config.yml   -v ./tw/wg.conf:/etc/wireguard/wg.conf   yourname/xrayr-wireguard
```

## 注意事项
- 宿主机 SSH 不受 WireGuard 影响
- 需要 `--cap-add=NET_ADMIN` 和 `/dev/net/tun`
- 建议使用外部卷挂载配置文件，便于调整节点
