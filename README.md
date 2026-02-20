# GL.iNet MT6000 (Flint 2) ImmortalWrt 自动编译构建

本项目专为 **GL.iNet GL-MT6000 (Flint 2)** 路由器设计，利用 GitHub Actions 在线云编译基于 6.6 内核的 ImmortalWrt 固件。

源码采用 [padavanonly/immortalwrt-mt798x-6.6](https://github.com/padavanonly/immortalwrt-mt798x-6.6) (237大佬维护分支)。通过完全自动化的云端工作流，剥离了高风险的 SSH 交互调试（防止 GitHub 封号），并加入了深度的环境清理与容错机制，确保每次编译都能稳定出包。

## ✨ 核心特性

* **🛡️ 绝对安全**：零 SSH 交互介入，纯净自动化流程，彻底杜绝 GitHub Actions 滥用引发的封号风险。
* **🚀 求稳降级编译**：默认开启满载多线程编译，遭遇线程竞态错误时，自动平滑降级为单线程排错编译 (`make -j1 V=s`) 并继续跑完，最大程度避免因偶发错误导致重复漫长的 CI 流程。
* **🧹 深度清理与防坏包**：编译前极限释放 Ubuntu 运行器的磁盘空间；在依赖下载阶段后，自动扫描并剔除 `<1KB` 的损坏源码包，扫清编译暗坑。
* **🛠️ 极简定制**：支持便捷的 DIY 脚本预处理与局域网静态文件直接注入。

## 📂 项目结构说明

```text
当前仓库目录/
├── .github/workflows/
│   └── mt6000-build.yml       # 核心：GitHub Actions 自动化编译流程配置
├── files/                     # （可选）自定义文件注入目录（编译时会自动覆盖到路由器的根目录，如 /etc/config/network）
├── .config                    # （核心）由本地 make menuconfig 生成的编译配置文件
├── diy-part1.sh               # （可选）Update feeds 前执行的脚本（常用于添加第三方插件源）
├── diy-part2.sh               # （可选）Update feeds 后执行的脚本（常用于修改默认 IP、主机名等系统设置）
└── README.md                  # 项目说明文档