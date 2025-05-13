# 最佳 node lts 镜像
# ref → https://juejin.cn/post/7175883730140004407#heading-13
FROM node:22.11.0

# 设置工作目录
WORKDIR /app

# 复制文件到工作目录
#COPY package.json .
#COPY pnpm-lock.yaml .
# 以下是全部复制到当下文件
COPY . .

# 安装 pnpm
RUN npm install -g pnpm@latest-10
# 设置更长的网络超时时间
RUN npm config set fetch-timeout 600000
# 安装项目的依赖
RUN pnpm install
# nuxt 打包
RUN npx nuxt build --dotenv .env.production

# 暴露端口，可以根据需要修改端口号
ENV PORT=3000
EXPOSE 3000

# 运行 Nuxt 3 项目
CMD ["node", ".output/server/index.mjs"]
