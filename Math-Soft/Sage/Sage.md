# Sage教程

[Sage](http://www.sagemath.org/) 是一个开源的数学软件系统，它建立在编程语言 Python 之上。它最初被开发用于数学研究，之后演进为一个强大的数学工具。Sage 是一个基于GPL协议的开源数学软件。它使用Python作为通用接口，将现有的许多开源软件如 NumPy, SciPy, matplotlib, Sympy, Maxima, GAP, FLINT, R 等软件包整合在一起，构建一个统一的计算平台。
 
Sage 官方有比较详尽的使用手册， 这篇Tutorial就是一个整合的教程，参考SDSU的Michael O'Sullivan[的英文教程](http://mosullivan.sdsu.edu/Teaching/sdsu-sage-tutorial/about.html)和男单618的[中文教程]( http://www.ai7.org/wp/html/682.html )（附件有上传pdf文件）。

Sage函数和Python类似需要加小括号。 函数和方法一般有两种用法，第一种常见于Mathematica等软件，比如`factor(150)`，另一种则是`150.factor()`，但后者更常用，有些函数需要左右两边都有输入。 使用后者方法，在输入点之后使用Tab键可以唤出所有可能使用的函数。 `Tab自动补全` 你只需要键入前面几个字母，然后按Tab键，就能得到你想获得的提示。函数后面直接加（不用加括号）一个或者两个问号可以打开帮助，其中两个问号的帮助 可以知道函数的 Python 源码 ，一般加一个问号即可。


# 作为计算器

计算器功能是Sage的最基础功能


## 算术与函数


加减乘除次方需要注意的是，Sage都会给出具体值（并不是近似值），只有加小数点才会输出近似值。Sage使用 `//`和`%`表示商和余数；或者使用`divmod(a,b)`表示前者被后者除后得到的商和余数。比如：`divmod(14,4)` 得到  `(3,2)`。另外我们有判定是否整除的函数`divides`，用法如`3.divides(15)`，会输出True或者False。其他相关的整除和素分解函数列在下表：

| **函数名** | **函数代码** | **示例** | **结果** |
|:---|:---|:----|:----|
| 是否整除 | divides | 3.divides(15) | True |
| 因子 | divisors | 12.divisors() | [1, 2, 3, 4, 6, 12] |
| 带余除法 | divmod | divmod(14,4) | (3,2) |
| 是否素数 | is_prime | (2^19-1).is_prime() | True |
| 素分解 | factor | 63.factor() | 3^2 * 7 |
| 素因子 | prime_divisors  prime_factors | 24.prime_divisors() 24.prime_factors() | [2, 3] |
| 最大公约数 | gcd | gcd(14,63) | 7 |
| 最小公倍数 | lcm | lcm(14,21) | 42 |

## 基本函数和常数


注意一点，在Sage中有理数(分数)是精确的，所以就没有误差。而相对应的小数表示则是浮点的。 如果需要得到精确的运算，尽可能使用分数而不是小数，小数会出现0.99999……的情况是，取floor只会得到0而非1。


在Sage中`ln(x)`与`log(x)`均是自然对数，用函数`log(x,b)`就以特定的底数 b。常用基本函数和常数以及用法如下列表：


| **函数名** | **函数代码** | **示例** | **结果** |
|:-----|:----|:----|:----|
| 极大/小值 | max min | max(1,5,8); min(1/2,1/3) | 8; 1/3 |
| 天花板和地板函数 | ceil; floor | floor(1/(2.1-2)); ceil(2.1) | 9; 3 |
| 数值化函数 | n | n(pi) | 3.14159265358979 |
| 三角函数 | sin cos | sin(1); cos(3/2.0) | sin(1); 0.0707372016677029 |
| 双曲/反三角函数 | arcsin; sinh | arctan(1); sinh(9.0) | 0.785398163397448; 4051.54190208279 |
| 圆周率 | pi | pi.n(); sin(pi/10) | 3.14159265358979;  1/4*sqrt(5) - 1/4 |
| (自然)对数(的底) | e; log; ln | log(e\^2)；ln(e\^2); log(100,10) | 2; 2; 2 |
| 指数函数 | exp | exp(2) | e^2 |

## 解方程

在Sage中的偏序关系有`<=,>=,==`三种以及不等关系`<,>`，他们可以直接用以判定式子是否正确，加入solve函数可以解方程和不等式方程，比如：


```python
sage: 9 <= 10
True
sage: solve( 2*x -5 == 1, x)
[x == 3]
sage: solve( x^2 - 6 <= 3, x )
[[x >= -3, x <= 3]]
sage:   solve( [  2*x + y == -1 , -4*x - 2*y == 2],x,y)
[[x == -1/2*r1 - 1/2, y == r1]] # r1,r2是自由变量或者称为任意常数。
```
如果需要寻找近似值，我们推荐使用函数`find_root()`，比如


```python
sage: find_root(sin(x) == x, -pi/2 , pi/2)
0.0
sage: find_root(sin(x) == cos(x), pi, 3*pi/2)
3.9269908169872414
```


### 定义变量
每个新打开的 notebook 都会自动产生一个不需要声明的变量 x 用于解方程等等，如果需要解别的方程，用到其他变量之前需要创建符号变量， 使用`var`来定义变量，比如

```python
sage: y,z,t = var("y z t")
sage: phi, theta, rho = var("phi theta rho")
sage: x1, x2 = var("x1 x2")
```

相反的，用`restore("x1")`就能解除声明。



## 微积分
Sage的函数定义很简单，直接使用等号即可，f(x) = x*exp(x)，调用函数也可以直接替换变量，比如 f(1)。函数在一点 a 的极限可以这样写: limit(f(x),x=a)，进一步地，左右极限只需要加入方向参数，比如 limit(h, x=4, dir="left")。
 
不定积分和求导直接使用 `integral(f,x)` 和 `derivative(f,x)`,进一步地，定积分用法只要在变量后面添加端点即可, integral(f,x,0,1)；一个点的导数值可以直接写为 derivative(f,x)(1)。


```python
sage: f(x) = x*exp(x)
sage: h(x) = (x^2 + x - 2)/(x-4)
sage: limit(f, x=1) #计算极限
e
sage: limit(h, x=4, dir="right") #计算右极限
+Infinity
sage: fp  =  derivative(f,x) #求导
sage: fp
x |--> x*e^x + e^x
sage: integral(f,x) #求原函数
x |--> (x - 1)*e^x
sage: integral(f, x,0,1) # 定积分
x |--> 1
```
 
## 作图

作图也和 Mathematica 类似，比如下面的例子：

```python
sage: f(x) = sin(x) #定义函数
sage: f
x |--> sin(x) #显示映射
sage: p = plot(f(x), (x, -pi/2, pi/2),axes_labels=['x','sin(x)'],  color='purple', linestyle='--', thickness=3)
sage: p.show()
```

color 颜色属性可以接受：颜色字符串 ( ‘purple’, ‘red’, ‘black’,等等), RGB三元值 如(.25,.10,1), 或者一个HTML-style，如#ff00aa。我们可以通过将两个图像直接相加（对图像赋值变量以后相加），让它们显示在一个坐标轴上。进一步，可以调整坐标系的放大缩小，比如使用 p.show(xmin=-2, xmax=4, ymin=-20, ymax=20)。


### 绘制参数曲线

Sage 绘制参数曲线，只要用 parametric_plot() 命令. 下面是一个半径为3的圆.

```python
sage: t = var('t')
sage: p = parametric_plot( [3*cos(t), 3*sin(t)], (t, 0, 2*pi) )
sage: p.show(aspect_ratio=1)
```


因为默认的坐标轴比例选择，图像看起来不太圆。我们可以手动调整 aspect_ratio。


### 同时做两个函数图
下面是一个很好的例子：

```python
sage: f(x) = sin(x)
sage: g(x) = cos(x)
sage: p = plot(f(x),(x,-pi/2,pi/2), color='black')
sage: q = plot(g(x), (x,-pi/2, pi/2), color='red')
sage: r = p + q
sage: r.show()
```

show函数还有一些参量可以调整，比如：

```python
p.show(xmin=-2, xmax=4, ymin=-20, ymax=20)
```


### 极坐标与隐函数图像
极坐标的方法如下：

```python
sage: theta = var("theta")
sage: r(theta) = sin(4*theta)
sage: p = polar_plot((r(theta)), (theta, 0, 2*pi) )
sage: p.show()
```

隐函数作图如下：

```python
sage: x,y=var('x,y')
sage: i=implicit_plot(4*x^2*y - 3*y == x^3 - 1, (x,-10,10),(y,-10,10))
sage: i.show()
```


### 3D作图
产生3D图像，只要用 plot3d() 命令。Sage 处理3D作图和之前不太一样，它使用一个程序叫jmol来生成可交互的三维图像。

```python
sage: x,y = var("x y")
sage: f(x,y) = x^2 - y^2
sage: p = plot3d(f(x,y), (x,-10,10), (y,-10,10))
sage: p.show()
```


## 列表与集合
Sage 中的列表基本继承于 Python，用 `L = [2,3,5,7,11,13,17,2]` 之类表示列表，值得注意的是一些非常好用的简单用法。一是切片，比如 `M[2:5]` 意味着从 2 开始，结束在编号为 5 的元素之前。注意，编号是从 0 开始的，实际上这就是第三个到第五个之间（包含两端）的字列表。还有一个有趣的建立列表的功能是两个点的应用。比如


```python
sage: [4..9]
[4, 5, 6, 7, 8, 9]
sage: data = [  floor(tan( pi* random() - pi/2.1 )) for i in [ 1 .. 20 ] ]
sage: data
[1, -1, -7, 0, -4, -1, -2, 1, 3, 5, -1,  25, -5, 1, 2, 0, 1, -1, -1, -1]
sage: mean(data) #平均值
3/4
sage: median(data) #中位数
-1/2
sage: mode(data) #众数
[-1]
sage: variance(data) #方差
3023/76
sage: std(data) #标准差
1/2*sqrt(3023/19)
```


第二个用法是表示一个等差数列，键入 [a,b..c] ，只要 a,b,c 满足 a< b <= c, 我们就会得到 [a,a+d,…,a+kd] 其中公差 d=b-a ，而 k 是最大的整数满足 a+kd <= c.
 
如果list的元素有计算意义，`sum()` 和 `prod()` 可以使用。Python中一个尤其有用的特性(当然Sage也继承着)就是用 列表解析(List Comprehensions, i.e. loops in lists) 创建一个列表。比如下面的一个例子：

```python
sage: [ k for k in [1..19] if gcd(k,20) == 1 ]
[1, 3, 7, 9, 11, 13, 17, 19]
```


# 利用Sage编程

## Sage 对象

Sage中的基本环有整数环ZZ, 有理数域QQ,实数域RR，复数域CC；

```python
sage: ZZ
Integer Ring
sage: QQ
Rational Field
sage: RR
Real Field with 53 bits of precision
sage: CC
Complex Field with 53 bits of precision
```


对于是否属于集合以及其他域可以用 `in` 判定，比如: `1 in ZZ`。在数域中常用的简单函数如下表：

| **函数名** | **函数代码** | **示例** | **结果** |
|:---|:----|:----|:---|
| 归属函数 | parent | parent(pi.n); parent(pi) | Real Field with 53 bits of precision; Symbolic Ring |
| 环函数 | ZZ QQ RR | QQ(0.5); RR(sqrt(2)) | 1/2; 1.41421356237310 |
| 布尔函数 | True，False | True and False; True ^^ True | False False |

上述Symbolic Ring是Sage专门储存一些特殊常数的精确形式的地方，包括π，e，sqrt(2)，i等等。`^^`为`xor`表示异或（exclusive or）。


## 集合    


集合的定义可以从列表得到（直接用`{}`定义不是集合，会显示 set[{8,1,2,3,6}]），可以从下面的例子明白如何定义（注意Set中`S`必须大写）：

```python
sage: y = [2,3,3,3,2,1,8,6,3]
sage: A = Set(y)
sage: A
{8, 1, 2, 3, 6}
sage:   B = Set([8,6,17,-4,20, -2 ])
```



所有通常的集合运算: 并（union）、 交（intersection）, 差（difference）以及对称差（symmetric_difference）都实现在集合的方法中了，用法如`A.union(B)`。用 subsets() 方法可以得到所有的子集，或者指定元素个数的子集，比如`A.subsets(2)` 表示元素为2的子集。



有关集合的函数（使用的集合A，B是上面定义的）：

| **函数名** | **函数代码** | **示例** | **结果** |
|:---|:----|:----|:---|
| 基数 | cardinality | A.cardinality() | 5 |
| 归属 | in | 8 in A | True |
| 集合运算 | union; intersection; difference; symmetric_difference | A.union(B); A.intersection(B); A.difference(B); A.symmetric_difference(B) | {1, 2, 3, 6, 8, 17, 20, -4, -2}; {8, 6}; {1, 2, 3}; {17, 2, 3, 20, 1, -4, -2} |
| 子集 | subsets; list | powA = A.subsets(); powA pairsA = A.subsets(2); pairsA pairsA.list() | Subsets of {8, 1, 2, 3, 6} Subsets of {1, 2, 3} of size 2 [{1, 2}, {1, 3}, {2, 3}] |



## IF判断语句
下面是一个简单的程序：

```python
sage: m=31
sage: if 3.divides(m): 
    print m/3
elif m%3==1: #注意elif前面不能空格，否则会报错。
    print (m-1)/3
```


## 循环语句

### While循环
在Sage中，while循环是最常用的循环，他会在条件满足的情况下一直循环。

```python
sage: i=0
sage: m=[1..5];
sage: while i<5:
    m[i]=i^2+1
    i=i+1
print m
```


得到结果`[1, 2, 5, 10, 17]`，注意这里的列表m的容量应该和所出的新列表相同。


### For 循环
For循环一般用于一个列表（可以是数字列表或者是String列表）

```python
sage: for str in ["apple","banana","coconut","dates"]:
     print str.capitalize()
```


### 列表内循环
Sage列表内可以使用循环。

```python
sage: U =  [ k for k in [1..19] if gcd(k,20) == 1]
sage: [ (a,b) for a in U for b in U ]
[(1, 1), (1, 3), (1, 7), (1, 9), (1, 11), (1, 13), (1, 17), (1, 19), (3, 1), (3, 3), (3, 7), (3, 9), (3, 11), (3, 13), (3, 17), (3, 19), (7, 1), (7, 3), (7, 7), (7, 9), (7, 11), (7, 13), (7, 17), (7, 19), (9, 1), (9, 3), (9, 7), (9, 9), (9, 11), (9, 13), (9, 17), (9, 19), (11, 1), (11, 3), (11, 7), (11, 9), (11, 11), (11, 13), (11, 17), (11, 19), (13, 1), (13, 3), (13, 7), (13, 9), (13, 11), (13, 13), (13, 17), (13, 19), (17, 1), (17, 3), (17, 7), (17, 9), (17, 11), (17, 13), (17, 17), (17, 19), (19, 1), (19, 3), (19, 7), (19, 9), (19, 11), (19, 13), (19, 17), (19, 19)]
sage: [ 'prime' if x.is_prime() else 'not prime' for x in U]
['not prime', 'prime', 'prime', 'not prime', 'prime', 'prime', 'prime', 'prime']
```


## 定义函数
这里使用的定义函数和之前的函数赋值有点类似，但是有更多的丰富的操作，比如可以定义辗转相除法等等：

```python
sage: def euclid(a,b):
   r = a%b
   while r != 0:
       a=b; b=r
       r = a%b
   return b
```


## Sage的扩展包
### GAP
GAP是群和同构的一个扩展包，使用GAP的函数或者环境我们需要用`gap()`。

```python
sage: s8 = gap('Group( (1,2), (1,2,3,4,5,6,7,8) )') #用生成元定义群S8
sage: s8
Group( [ (1,2), (1,2,3,4,5,6,7,8) ] )
sage: a8 = s8.DerivedSubgroup(); a8 #换位子群 A8
Group( [ (1,2,3), (2,3,4), (2,4)(3,5), (2,6,4), (2,4)(5,7), (2,8,6,4)(3,5) ] )
sage: a8.Size(); a8.IsAbelian(); a8.IsPerfect()
20160
false
true
sage: sy12 = a8.SylowSubgroup(2); sy12.Size() #sylow子群，Size的S要大写
64
```


### Singular

```python
sage: R = singular.ring('0','(x,y,z)','lp') #3元多项式环根据字典排序法lexicographic
sage: R
polynomial ring, over a field, global ordering
// coefficients: QQ
// number of vars : 3
//        block   1 : ordering lp
//                  : names    x y z
//        block   2 : ordering C
sage: p = singular.poly('x^2 * y^2 - 1')
sage: q = singular.poly('x^2 * y^2 - z')
sage: singular.ideal([p,q])
x^2*y^2-1,
x^2*y^2-z
```


# 数学结构


更多关于数学结构的具体内容参见：<http://mosullivan.sdsu.edu/Teaching/sdsu-sage-tutorial/mathstruct.html>