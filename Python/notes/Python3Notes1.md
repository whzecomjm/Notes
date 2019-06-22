
# Python 教程 (1)

这个教程根据廖雪峰的[Python3教程](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000)所写.主要是一些基础教程, 截止于模块的学习之前.

[TOC]


## Jupyter 使用

Jupyter Notebook是一个Web应用程序，允许您创建和共享包含实时代码，方程，可视化和说明文本的文档。 用途包括：数据清理和转换，数值模拟，统计建模，机器学习等等。

一些常用的 Jupyter 的魔术命令.

| 魔术命令 | 作用 |
| :--- | :---|
|%quickref|显示 IPython 快速参考|
|%debug	|从最新的异常跟踪的底部进入交互式调试器|
|%run script.py	|执行 script.py|
|%load script.py| 加载 script.py|
|%cd direcrory	|切换工作目录|

更多内容参见 [Jupyter 安装与使用](https://blog.csdn.net/gubenpeiyuan/article/details/79252402). 比如运行一个py程序. 我们可以用 `%load` 来加载一个存在的 py文件.

```python
%load baidu.py
```

## Python 基础 

### 一些注意事项
1. python 不用分号
2. \# 表示注释, 多行注释用两行 ''' 包着.
3. print 里可以用逗号分开不同的内容, 也可以用加号连接相同类型的内容, 比如都是 str.
4. py3默认支持中文, 可以不加 `#-*-coding: UTF-8 -*-`

下面是一个简单的求绝对值的例子:


```python
x = input("This is an absolute function, please enter an value:") # 输入一个数字
a = float(x)
if a > 0:
    print("|", a, "|=" ,a)
else:
    print("|",a, "|=",-a)
```

    This is an absolute function, please enter an value:1
    | 1.0 |= 1.0


python 是动态语言, 可以覆盖取值和更换变量类型, 比如:


```python
a = 123
print(a)
a = "wenchao"
print(a)
```

    123
    wenchao


python 里的 "/" 就是表示除法, 地板除法用 "//", 相应的 "%" 表示余数.

### 字符编码
#### ASCII、Unicode和UTF-8的关系

1. ASCII 是最早的编码, 使用一个字节能表示英文字母和一些符号, 但是不能表示中文等其他文字;
2. GB2312 是中国制定的中文编码, 使用2个字节.
3. Unicode 是统一所有语言的一套编码, 不会出现乱码问题.
4. UTF-8 编码是一种可变长编码, 相当于是 Unicode 的压缩, 能节省空间, 也能兼容所有的编码.
5. 在计算机内存中，统一使用Unicode编码，当需要保存到硬盘或者需要传输的时候，就转换为UTF-8编码。
6. 浏览网页的时候，服务器会把动态生成的Unicode内容转换为UTF-8再传输到浏览器.
7. Python 3 的字符串是以Unicode编码的.



对于单个字符的编码，Python提供了ord()函数获取**单个**字符的整数表示，chr()函数把编码转换为对应的字符：


```python
a= ord('A')
b= ord('超')
c=chr(100)
d=chr(25991)
print(a,b,c,d)
```

    65 36229 d 文


同样我们可以直接使用十六进制来表示一个字符: 比如文的整数表示 25991, 超是 36229, 转化为十六进制为 6587 和 8d85.于是我们可以在前面添加 `\u`


```python
'\u6587\u8d85'
```




    '文超'



#### 格式化

最后一个常见的问题是如何输出格式化的字符串。我们经常会输出类似'亲爱的xxx你好！你xx月的话费是xx，余额是xx'之类的字符串，而xxx的内容都是根据变量变化的，所以，需要一种简便的格式化字符串的方式。在Python中，采用的格式化方式和C语言是一致的，用`%`实现. 常见的占位符有有:

|占位符|	替换内容|
|:--|:--:|
|%d|	整数|
|%f|	浮点数|
|%s|	字符串|
|%x|	十六进制整数|

注意 % 前面没有逗号. 另外, 当使用`%`符号时, 用两个来转义. 


```python
print('Hello, %s' % 'world')
```

    Hello, world



```python
print('Hi, %s, you have %% $%d.' % ('Michael', 1000000))
```

    Hi, Michael, you have % $1000000.



```python
s1=72
s2=85
r=(s2-s1)/s1*100
print('小明成绩提升了百分之 %.2f%%.' %r) # 使用 `%.2f` 表示保留浮点后两位.

```

    小明成绩提升了百分之 18.06%.


### 列表和元组
python里的列表 list 用方括号括起来, 可以用`len()`函数查看元素个数, 序列是从零开始, 使用负数表示倒数第几个:


```python
classmates = ['Michael', 'Noam', 'Wenchao']
print(len(classmates),
classmates[0],
classmates[-1])
```

    3 Michael Wenchao


下面我们介绍一下list的操作. 首先可以直接对某个值进行更改赋值, 比如 `s[1]=2` 这样. 我们还能增添和删除列表, 使用 append insert pop等.


```python
classmates.append('Tamar') # 增加元素, 每次运行都会增加一个重复
print(classmates)
```

    ['Michael', 'Noam', 'Wenchao', 'Tamar']



```python
classmates.insert(1, 'Jack') # 插入到序列1的位置
print(classmates)
```

    ['Michael', 'Jack', 'Noam', 'Wenchao', 'Tamar']



```python
classmates.pop() # 删除末尾的一个元素, (i) 表示删除序列号为i的元素
print(classmates)
```

    ['Michael', 'Jack', 'Noam', 'Wenchao']



```python
L = [
    ['Apple', 'Google', 'Microsoft'],
    ['Java', 'Python', 'Ruby', 'PHP'],
    ['Adam', 'Bart', 'Lisa']
]
print(L[1][-1]) # 打印第二行最后一列的元素.
```

    PHP


进一步地, 我们可以使用tuple来表示**不能改变的列表**, 用小括号表示. 但要注意的是, 只有一个元素的时候, 要在后面加逗号, 比如 `t=(1,)` 否则回合数学括号混淆. tuple里面可以嵌套列表, 这样可以让它更灵活, 列表内的元素是可变的. tuple 是安全的列表.

### 条件判断
if, elif, else 使用需要后面接冒号作为缩进的标志. 缩进用空格, jupyter 里可以用 tab代替.
如果我们需要用到 input, 注意`input()`返回的数据类型是`str`, 我们可能需要用 int, float 等转换类型.


```python
w=input("请输入你的体重(kg):")
h=input("请输入你的身高(cm):")
W=float(w)
H=float(h)/100
bmi=W/H**2
if bmi<18.5:
    print("你太瘦了, 要多补一补!")
elif 18.5<=bmi<25:
    print("恭喜!你的BMI指数正常.")
elif 25<=bmi<28:
    print("有点重了哦,注意啦!")
elif 28<=bmi<32:
    print("你已经是个小胖子啦~")
else:
    print("再不减肥你和猪没啥区别啦 XD")
print("你的BMI指数是:%.2f."% bmi)
```

    请输入你的体重(kg):50
    请输入你的身高(cm):173
    你太瘦了, 要多补一补!
    你的BMI指数是:16.71


### 循环语句
为了让计算机能计算成千上万次的重复运算，我们就需要循环语句。

Python的循环有两种，一种是`for...in`循环; 第二种循环是while循环，只要条件满足，就不断循环，条件不满足时退出循环。

注意**使用循环的变量要先进行赋值**.


```python
sum=0
for x in range(101): # range 函数的序列也要注意.
    sum=sum+x
print(sum) # print 要删除缩进.
```

    5050



```python
sum=0
n=1
while n<101:
    sum=sum+n
    n=n+1
print(sum)
```

    5050



```python
L = ['Bart', 'Lisa', 'Adam']
n=0
    
for x in L:
    print("Hellp, %s!" %L[n])
    n=n+1    
```

    Hellp, Bart!
    Hellp, Lisa!
    Hellp, Adam!


### 使用dict和set

Dict 是 key-value存储方式, 且一个key只能对应一个value. 

和list比较，dict有以下几个特点：

1. 查找和插入的速度极快，不会随着key的增加而变慢；
2. 需要占用大量的内存，内存浪费多。

dict的key必须是不可变对象。但是value 是可变的, 本身也能用pop删除一个key:value元素组.

下面是 dict 用法:


```python
d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
d['Michael']
d.get('Tracy')
```




    85



set和dict类似，也是一组key的集合，但不存储value。不可以放入可变对象. 由于key不能重复，所以，在set中，没有重复的key。(所以集合相同的元素会被合并) 一般的tuple放入set不会出错，而特殊的tuple(带有list)的出错，因为带有可变对象.


```python
s = set([1,1,2, 2, 3])
print(s)
s.add(4) # 增加key
print(s)
s.remove(1) # 删除key
print(s)
```

    {1, 2, 3}
    {1, 2, 3, 4}
    {2, 3, 4}


集合可以做运算,使用 `&` 表示交集, `|` 表示并集.

对于其他不可变量, 比如 str 是不能直接操作的, 但是可以改变后存到重新存到新的变量:


```python
a = 'abc'
b = a.replace('a','A')
print(b)
```

    Abc


## 函数

在Python中，定义一个函数要使用def语句，依次写出函数名、括号、括号中的参数和冒号`:`，然后，在缩进块中编写函数体，函数的返回值用return语句返回。


```python
# 这是个坐标变换公式
import math
def move(x,y,t,a):
    nx=x+t*math.cos(a)
    ny=y-t*math.sin(a)
    return float("%.2f" % nx),float("%.2f"% ny)  # 或者可以使用 round 函数来保留小数点后两位, 比如 round(nx,2).
move(2,3,1,math.pi/3) # 返回值是一个tuple.
```




    (2.5, 2.13)




```python
# 这是一个二次方程求根公式
import math
def quad(a,b,c):
    delta=b**2-4*a*c
    if a==0:
        return "This is not a quadratic equation"
    elif b**2-4*a*c>0:
        x1=(-b+math.sqrt(delta))/(2*a)
        x2=(-b-math.sqrt(delta))/(2*a)
        return "The solutions of the equation are %.2f and %.2f" %(x1,x2)
    elif b**2-4*a*c==0:
        x=(-b)/(2*a)
        return "This equation have two equal solutions %.2f" %(x)
    else:
        return "There is no real solutions for this quadratic euqation."
    
quad(2,6,2)
```




    'The solutions of the equation are -0.38 and -2.62'



### 参数的使用


```python
# 这是一个n次幂的公式, 默认情况下使用一个自变量表示平方
def power(x,n=2):
    s=1
    while n>0:
        s=s*x
        n=n-1
    return s

print(power(5),power(2,3))
```

    25 8


从上面的例子可以看出，默认参数可以简化函数的调用。设置默认参数时，有几点要注意：

1. 必选参数在前，默认参数在后，否则Python的解释器会报错.
2. 有时候默认参数设置为`None`可以防止多次调用结果不一样.
3. `*nums` 可以把list元素 `nums` 变成可变参数传到函数内, 这种写法相当有用, 而且很常见. 


```python
# 关于3的例子
def pwsum(*args):
    sum=0
    for n in args:
        sum =sum+n**2
    return sum

nums=[1,5,7,8,10]
pwsum(*nums)
```




    239



关键字参数 `**kw` , kw 接受的是一个 dict.

- 可变参数既可以直接传入：`func(1, 2, 3)`，又可以先组装list或tuple，再通过`*args`传入：`func(*(1, 2, 3))`；

- 关键字参数既可以直接传入：`func(a=1, b=2)`，又可以先组装dict，再通过`**kw`传入：`func(**{'a': 1, 'b': 2})`。

使用`*args`和`**kw`是Python的习惯写法，当然也可以用其他参数名，但最好使用习惯用法。

### 递归函数
在函数内部，可以调用其他函数。如果一个函数在内部调用自身本身，这个函数就是递归函数。

递归函数关键就是把步骤分为：之前的n-1步和最后一步



```python
# 阶乘函数
def frac(n):
    if n==1:
        return 1
    else:
        return n* frac(n-1)

frac(10)
```




    3628800




```python
# 汉诺塔
def move(n, a, b, c):
    if n == 1:
        print(a, '-->', c)
    else:
        move((n-1), a, c, b) # 最上面的 n-1个 从 a 通过 c 移到 b
        print(a, '-->', c) # 最下面一个直接移到c
        move((n-1), b, a, c) #上面的 n-1 个从b通过 a 移动到c

move(3,"A","B","C")
```

    A --> C
    A --> B
    C --> B
    A --> C
    B --> A
    B --> C
    A --> C


## 高级特性
在Python中，代码不是越多越好，而是越少越好。代码不是越复杂越好，而是越简单越好。

### 切片

取一个list或tuple的部分元素是非常常见的操作.我们可以用循环:


```python
L = ['Michael', 'Sarah', 'Tracy', 'Bob', 'Jack']
r = []
n = 3
for i in range(n): # range n: 0,1,2,3,...,n-1
    r.append(L[i])
r
```




    ['Michael', 'Sarah', 'Tracy']



在Python中提供了Slice操作符, 比如前三个元素可以使用下列代码:

```python
L = ['Michael', 'Sarah', 'Tracy', 'Bob', 'Jack']
L[0:3] # 从索引0开始取，直到索引3为止，但不包括索引3。
L[:3] # 第一个索引是0可以省略
L[-2:] # 从倒数第二个开始
L[-2:-1] # 倒数第二个到倒数第一个之前, 所以只有一个元素
```

可以直接使用range创建list.


```python
L=list(range(100))
L[10:22:2] # 最后的2是等差数列的差值
```




    [10, 12, 14, 16, 18, 20]




```python
# 删除字符串头尾的空格
def trim(s):
    if s=="":
        return
    while s[0]==" ":
        s = s[1:]
        if s == "":
            return s
    while s[-1]==" ":
        s= s[:-1]
    return s

trim(" heko ")
```




    'heko'



### 迭代

如果给定一个list或tuple，我们可以通过for循环来遍历这个list或tuple，这种遍历我们称为迭代（Iteration）。在Python中，迭代是通过for ... in来完成的.

如何判断一个对象是可迭代对象呢？方法是通过collections模块的Iterable类型判断：

```python
>>> from collections import Iterable
>>> isinstance('abc', Iterable) # str是否可迭代
True
>>> isinstance([1,2,3], Iterable) # list是否可迭代
True
>>> isinstance(123, Iterable) # 整数是否可迭代
False
```


```python
def findMinAndMax(L):
    if L==[]:
        return (None, None)
    max = min = L[0]
    for x in L:
        if x > max:
            max =x
        if x < min:
            min =x
    return (min, max)

findMinAndMax([2,3,7,1,24,67])
    
```




    (1, 67)



### 列表生成式
使用 for 循环生成列表比较麻烦, 可以用简化的列表生成式:

```python
>>> [x * x for x in range(1, 11)]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

代替
```python
>>> L = []
>>> for x in range(1, 11):
...    L.append(x * x)
...
>>> L
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

运用列表生成式，可以写出非常简洁的代码。例如，列出当前目录下的所有文件和目录名，可以通过一行代码实现:


```python
import os
[d for d in os.listdir('.')]
```




    ['.ipynb_checkpoints',
     'google-picture',
     'Python3.ipynb',
     'replacetxt.ipynb',
     'ssr-address.ipynb',
     'tieba']




```python
L1=['Hello','World',18,'Apple',None]
L2=[l.lower() for l in L1 if isinstance(l,str)]
print(L2)
```

    ['hello', 'world', 'apple']


### 生成器
通过列表生成式，我们可以直接创建一个列表。但是，受到内存限制，列表容量肯定是有限的。而且，创建一个包含100万个元素的列表，不仅占用很大的存储空间，如果我们仅仅需要访问前面几个元素，那后面绝大多数元素占用的空间都白白浪费了。所以，如果列表元素可以按照某种算法推算出来，那我们是否可以在循环的过程中不断推算出后续的元素呢？这样就不必创建完整的list，从而节省大量的空间。在Python中，这种一边循环一边计算的机制，称为生成器：generator。

要创建一个generator，有很多种方法。第一种方法很简单，只要把一个列表生成式的`[]`改成`()`，就创建了一个generator. 如果要一个一个打印出来，可以通过`next()`函数获得generator的下一个返回值. 因为generator也是可迭代对象, 所以我们可以使用for循环调用.

斐波拉契数列用列表生成式写不出来，但是，用函数把它打印出来却很容易：



```python
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        print(b)
        a, b = b, a + b
        n = n + 1
    return 'done'
fib(5)
```

    1
    1
    2
    3
    5





    'done'



fib函数实际上是定义了斐波拉契数列的推算规则，可以从第一个元素开始，推算出后续任意的元素，这种逻辑其实非常类似generator。

也就是说，上面的函数和generator仅一步之遥。要把fib函数变成generator，只需要把print(b)改为yield b就可以了


```python
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1
    return 'done'
g=fib(5)
print(g)
for n in g:
    print(n)
```

    <generator object fib at 0x05659FB0>
    1
    1
    2
    3
    5


generator和函数的执行流程不一样。函数是顺序执行，遇到return语句或者最后一行函数语句就返回。而变成generator的函数，在每次调用next()的时候执行，遇到yield语句返回，再次执行时从上次返回的yield语句处继续执行。

下面是一个杨辉三角的生成器:


```python
def YHT(max):
    n=0
    L=[1]
    while n<max:
        yield L
        L = [1]+[L[n]+L[n+1] for n in range(len(L)-1)]+[1]
        n=n+1
    return None

for n in YHT(10):
    print(n)
```

    [1]
    [1, 1]
    [1, 2, 1]
    [1, 3, 3, 1]
    [1, 4, 6, 4, 1]
    [1, 5, 10, 10, 5, 1]
    [1, 6, 15, 20, 15, 6, 1]
    [1, 7, 21, 35, 35, 21, 7, 1]
    [1, 8, 28, 56, 70, 56, 28, 8, 1]
    [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]


### 迭代器
我们已经知道，可以直接作用于for循环的数据类型有以下几种：

- 一类是集合数据类型，如list、tuple、dict、set、str等；

- 一类是generator，包括生成器和带yield的generator function。

这些可以直接作用于for循环的对象统称为可迭代对象：Iterable。可以使用isinstance()判断一个对象是否是Iterable对象：


```python
from collections import Iterable
isinstance('abc', Iterable)
isinstance((x for x in range(10)), Iterable)
```




    True



而生成器不但可以作用于for循环，还可以被next()函数不断调用并返回下一个值，直到最后抛出StopIteration错误表示无法继续返回下一个值了。

可以被next()函数调用并不断返回下一个值的对象称为迭代器：Iterator。可以使用isinstance()判断一个对象是否是Iterator对象：


```python
from collections import Iterator 
isinstance((x for x in range(10)), Iterator)
```




    True



生成器都是Iterator对象，但list、dict、str虽然是Iterable，却不是Iterator。

把list、dict、str等Iterable变成Iterator可以使用iter()函数：

```py
>>> isinstance(iter('abc'), Iterator)
True
```

Iterator甚至可以表示一个无限大的数据流，例如全体自然数。而使用list是永远不可能存储全体自然数的。

凡是可作用于for循环的对象都是Iterable类型；

凡是可作用于next()函数的对象都是Iterator类型，它们表示一个惰性计算的序列；

## 函数式编程
### 高级函数
把函数作为参数传入，这样的函数称为高阶函数，函数式编程就是指这种高度抽象的编程范式。

#### map 和 reduce 函数
`map()`函数接收两个参数，一个是函数，一个是`Iterable`，map将传入的函数依次作用到序列的每个元素，并把结果作为新的`Iterator`返回。


```python
def f(x):
    return x**2

r=map(f,[x for x in range(10)])
next(r)
list(r) # Iterator是惰性序列, 用list 函数列出
```




    [1, 4, 9, 16, 25, 36, 49, 64, 81]



reduce把一个函数作用在一个序列`[x1, x2, x3, ...]`上，这个函数必须接收两个参数，reduce把结果继续和序列的下一个元素做累积计算，其效果就是：
```py
reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)
```
比方说对一个序列求和，就可以用reduce实现：(注意 reduce 函数需要从模块functools中调用)


```python
from functools import reduce
# 把数字拼在一起
def combine(x,y):
    return 10*x+y
reduce(combine, [1,2,5,7,9])

DIGITS = {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}
# char2digit
def str2int(s):
    def fn(x, y):
        return x * 10 + y
    def char2num(s):
        return DIGITS[s]
    return reduce(fn, map(char2num, s))
str2int('273243')
```




    273243




```python
# 输入的不规范的英文名字，变为首字母大写，其他小写的规范名字
from functools import reduce
def normalize(name):
    return name[0].upper() + name[1:].lower()

# prod of list
def prod(list):
    def pd(x,y):
        return x*y
    return reduce(pd, list)

prod([x for x in range(2,5)])


# str2float函数，把字符串'123.456'转换成浮点数123.456
DIGITS = {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}
def str2float(s):
    def char2num(s):
        return DIGITS[s]
    def fn(x, y):
        return x * 10 + y
    def fn2(x,y):
        return x * 0.1 + y
    s=s.split('.')       # 将 string 拆成一个两半的列表
    return reduce(fn, map(char2num, s[0]))+0.1*reduce(fn2, map(char2num, s[1][::-1])) #[::-1] 逆序
str2float('23.13')
```




    23.13



#### filter 函数
Python内建的filter()函数用于过滤序列。filter()把传入的函数依次作用于每个元素，然后根据返回值是True还是False决定保留还是丢弃该元素。


```python
def not_empty(s):
    return s and s.strip()

list(filter(not_empty, ['A', '', 'B', None, 'C', '  ']))
```




    ['A', 'B', 'C']




```python
# generate prime
def _odd_iter():
    n = 1
    while True:
        n = n + 2
        yield n
def not_divisible(n):
    return lambda x: x % n > 0
def primes():
    yield 2
    it = _odd_iter() # 初始序列
    while True:
        n = next(it) # 返回序列的第一个数
        yield n
        it = filter(not_divisible(n), it) # 构造新序列
        
# 打印100以内的素数:
for n in primes():
    if n < 5:
        print(n)
    else:
        break
```


```python
# 回文数
def is_palindrome(n):
    return str(n) == str(n)[::-1]
output=filter(is_palindrome, range(10, 100))
print('10~100:', list(output))
```

    10~100: [11, 22, 33, 44, 55, 66, 77, 88, 99]


#### sorted 函数

排序也是在程序中经常用到的算法。无论使用冒泡排序还是快速排序，排序的核心是比较两个元素的大小。如果是数字，我们可以直接比较，但如果是字符串或者两个dict呢？直接比较数学上的大小是没有意义的，因此，比较的过程必须通过函数抽象出来。

Python内置的sorted()函数就可以对list进行排序

```py
>>> sorted([36, 5, -12, 9, -21])
[-21, -12, 5, 9, 36]
```

此外，sorted()函数也是一个高阶函数，它还可以接收一个key函数来实现自定义的排序，例如按绝对值大小排序：

```py
>>> sorted([36, 5, -12, 9, -21], key=abs)
[5, 9, -12, -21, 36]
```
要进行反向排序，不必改动key函数，可以传入第三个参数reverse=True：

```py
>>> sorted(['bob', 'about', 'Zoo', 'Credit'], key=str.lower, reverse=True)
['Zoo', 'Credit', 'bob', 'about']
```



```python
# 成绩或者姓名排序
L = [('Bob', 75), ('Adam', 92), ('Bart', 66), ('Lisa', 88)]
def by_name(t):
    return t[0]
def by_credit(t):
    return t[1]
L1 = sorted(L, key=by_name)
L2 = sorted(L, key=by_credit, reverse=True)
print(L1,'\n',L2)

```

    [('Adam', 92), ('Bart', 66), ('Bob', 75), ('Lisa', 88)] 
     [('Adam', 92), ('Lisa', 88), ('Bob', 75), ('Bart', 66)]


### 返回函数

*以后再深耕*: [返回函数](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/001431835236741e42daf5af6514f1a8917b8aaadff31bf000).

### 匿名函数

关键字lambda表示匿名函数，冒号前面的x表示函数参数。匿名函数有个限制，就是只能有一个表达式，不用写return，返回值就是该表达式的结果。用匿名函数有个好处，因为函数没有名字，不必担心函数名冲突。此外，匿名函数也是一个函数对象，也可以把匿名函数赋值给一个变量，再利用变量来调用该函数：

```py
>>> f = lambda x: x * x
>>> f
<function <lambda> at 0x101c6ef28>
>>> f(5)
25
```



```python
L=list(filter(lambda n : n%2 == 1, range(1,20)))
print(L)
```

    [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]


### 装饰器
比如，在函数调用前后自动打印日志，但又不希望修改now()函数的定义，这种在代码运行期间动态增加功能的方式，称之为“[装饰器”（Decorator）](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014318435599930270c0381a3b44db991cd6d858064ac0000)。

### 偏函数
functools.partial就是帮助我们创建一个偏函数, 把一个函数的某些参数给固定住（也就是设置默认值），返回一个新的函数，调用这个新函数会更简单。

```py
int2 = functools.partial(int, base=2)
```

当函数的参数个数太多，需要简化时，使用functools.partial可以创建一个新的函数，这个新函数可以固定住原函数的部分参数，从而在调用时更简单。
