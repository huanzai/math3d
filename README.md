## 用途

现在3d游戏开发已经很普遍，如果服务端涉及到3d数学方面的计算就需要一个开源的3d数学库，而我们所使用的客户端大部分都是unity，众所周知unity是左手坐标系的数学库。所以服务器开发需要的也应该是左手坐标系。本库是基于云风大神的开源项目ejoy3d所修改。包含左手库和右手库，在libmath.c的首行进行切换。