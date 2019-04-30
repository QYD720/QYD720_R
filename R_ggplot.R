# diamonds
# 没有导入

library(ggplot2)


#导入ggplot2
diamonds
#无法完全显示全部数据

options(max.print=5000) # 更改最大读取数�?
getOption("max.print")  # 查看最大数据行�?
diamonds

qplot(carat,price,data =  diamonds)
# draw carat-price 

qplot(log(carat),log(price),data = diamonds)
# 取对数xy
 
qplot(price,x*y*z,data = diamonds)
# 评估 价格体积关系

qplot(log(price),log(x*y*z),data = diamonds)

qplot(carat,x*y*z,data = diamonds)
# 评估 克拉 xyz

# 数据过大 采取抽样展示


set.seed(1) # 种子
dsmall = diamonds[sample(nrow(diamonds),100),] # 随机抽样用法
dsmall
qplot(carat,price,data =dsmall,colour=color)
qplot(carat,price,data =dsmall,colour=cut)
qplot(carat,price,data =dsmall,shape=color,colour=color)
qplot(carat,price,data =dsmall,shape=color,colour=color,alpha=I(1/2))
# 可以针对数据集增加各种属�? 点集�? 增加shape形状 colour颜色 alpha颜色深浅等属性，

qplot(carat,price,data =dsmall,geom = c("point","smooth"))
# 对xy做散点图 并且圆滑处理 可以另外添加 GAM span等高级属性参�?

# 箱子�? 探索颜色-克拉单价的关�?
library(ggplot2)
qplot(color,price / carat,data = diamonds, geom = "boxplot",colour=color,alpha=I(1/2),shape=color)

# 火山�? 显示 颜色-克拉

qplot(color,price / carat,data = diamonds, geom = "jitter",colour=color,alpha=I(1/2))
qplot(color,price / carat, data = dsmall, geom = "jitter",colour=color)

# 直方图表�? 
qplot(carat, data = diamonds, geom = "histogram",colour=color)
# 调整参数 binwidth宽度=0.1,xlim区间限制=c(0,3)
qplot(carat, data = diamonds, geom = "histogram",colour=color,binwidth=0.1,xlim=c(0,3))
#  调整参数 fill的属�? 用颜色分�?
qplot(carat, data = diamonds, geom = "histogram",fill=color,colour=color,binwidth=0.1,xlim=c(0,3))

# 密度曲线  
qplot(carat, data = diamonds, geom = "density",fill=color,alpha=I(1/10),colour=color,binwidth=0.1,xlim=c(0,3))

qplot(carat, data = diamonds, geom = "density",colour=color,binwidth=0.1,xlim=c(0,3))

# 直方�? 用数量和总重量衡�? 颜色
qplot(color, data = diamonds, geom = "bar",weight=carat,fill=color)+scale_y_continuous("carat")
qplot(color, data = diamonds, geom = "bar",fill=color)
qplot(color, data = diamonds, geom = "bar")
# GG01c 