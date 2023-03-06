
# 磨皮效果——OpenGL实现
## 一、背景
人脸磨皮算法的本质是模糊算法，但是与模糊算法最大的区别是，磨皮算法需要考虑保边效果，需要达到“磨皮了但又保留了脸部的各种纹理细节和边缘信息”的效果。保边的思路甚至与模糊的思路看似矛盾和冲突，因此目前主流磨皮算法都在模糊和保边两头发力，尤其是保边。

**关于磨皮算法以及保边算法的原理可以去看我的另一篇博文介绍：**
[美颜的奥秘——磨皮底层原理](https://blog.csdn.net/q345911572/article/details/119901671)

## 二、基于边缘检测的磨皮算法实现
本文探讨一种比较常见且比较易实现的带保边(边缘检测)的磨皮算法的具体实现

#### 1.磨皮算法流程：
![在这里插入图片描述](https://img-blog.csdnimg.cn/9d93a6845f814970aa38625ef061fafd.png)
#### 2.选择单独检测边缘的原因
很多模糊算法自带边缘检测，例如双边滤波、导向滤波[(导向滤波介绍)](https://blog.csdn.net/q345911572/article/details/128799773)等，但是他们的缺陷也很明显，例如性能不佳，计算量大，且需要处理比较大尺寸的图，且单单一个模糊效果在人脸上最终的磨皮效果也一般般。

因此这里把边缘检测和模糊分别单独实现，这样有几个优点：
* 性能比较友好，模糊和边缘检测都可以用小图进行渲染
* 效果更佳灵活，模糊算法可以灵活选择不同的模糊算法，例如高斯滤波、均值滤波，用于人脸效果的模糊和用于边缘检测的模糊可以选择不一样的算法

#### 3.边缘检测图模糊
原始的边缘检测结果，虽然边缘比较精细和准确，但是过度往往都比较生硬，不适合直接作用在人脸上，会导致人脸细节局部区域比较突兀，因此这里对边缘检测的结果再做一次模糊，使得边缘过度更加自然和平整

#### 4.效果展示
<br>![在这里插入图片描述](https://img-blog.csdnimg.cn/de425593578c46dfbeb23be7d6e0a10f.png)

<br>![在这里插入图片描述](https://img-blog.csdnimg.cn/d114964a05d443b69df58553d6b273a0.png)
<br>![在这里插入图片描述](https://img-blog.csdnimg.cn/844fba91ae2c41e79d13b9b352a00064.png)


<br>![在这里插入图片描述](https://img-blog.csdnimg.cn/f6bdb73117eb46ac85b22d2b3a5b0f6b.gif)
<br>![在这里插入图片描述](https://img-blog.csdnimg.cn/66db7a5301ec466fa9c6bd60e26a3d3b.gif)
<br>![在这里插入图片描述](https://img-blog.csdnimg.cn/b87376e25b9b44b3b02cab9259471a43.gif)

## Git地址：[https://github.com/sysu-huangwei/Smooth](https://github.com/sysu-huangwei/Smooth)
## 博客地址：[https://blog.csdn.net/q345911572/article/details/129362387](https://blog.csdn.net/q345911572/article/details/129362387)
