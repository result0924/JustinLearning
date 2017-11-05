# PythonLearning Note
---

- [Tiny-Python-3.6-Notebook](https://github.com/mattharrison/Tiny-Python-3.6-Notebook/blob/master/python.rst)

- [learning-python-from-zero-to-hero](https://medium.freecodecamp.org/learning-python-from-zero-to-hero-120ea540b567)

- Python 不錯的中文網站
	- http://dokelung-blog.logdown.com/
	- https://eastlakeside.gitbooks.io/interpy-zh/content/

## python environment
- python install refer： (https://www.python.org/downloads/)

- 安裝python的第三方管理工具pip[refer](https://pip.pypa.io/en/latest/)

- pip查version
``` 
pip —version 
```

- pip 安裝說明： (https://www.openfoundry.org/tw/tech-column/8536-introduction-of-python-extension-management-tools)

## Note
### 編碼
- 檔案前加上
```
	# -*- coding: utf-8 -*-
```
Unicode refer: (http://python.ez2learn.com/basic/unicode.html)

### Top-level script environment
- 防止modules被import的話會執行到該程式、通常會放在modules的最後面。
```
if __name__ == '__main__':
 doSomething()
```
- 如果module是直接執行的話`__name__`會等於`__main__`
- 如果module是被import的話`__name__`會等於module name

### modules
- modules是副檔名為`.py`的檔案。
- 根據PEP 8、module的名稱為
    - 全部小寫
    - 不要有底線在二個英文單字的中間
- 任何module在`PYTHONPATH`的環境或`sys.path`列表才可以被import

### packages
- 資料夾內有`__init__.py`的檔案為package。
- 任何package在`PYTHONPATH`的環境或`sys.path`列表才可以被import
- packeages的範例
```
packagename/
  __init__.py
  module1.py
  module2.py
  subpackage/
    __init__.py
```
- `__init__.py`可以為空檔案、主要是執行packages初始化的變量和方法！

### 註解
- 註解前面加#
- 使用三個雙引號"""，可以跨行註解。
- """也可以用在字串上可以保留縮排、空格。

### 運算
num1 // num2 整數除法
num1 / num2 浮點數除法

```
 5 // 3 = 1
 5.0 // 3 = 1.0
 5 / 3 = 1
 5.0 / 3 = 1.6666666666666667
```
### 字串
| Type | Example |
| :--: |   :--:  |
| String | "hello world!" |
| String | 'hello world!' |
| String | '''hello world!''' |
| Raw string | r'hello world!' |
| Byte string | b'hello worlod!' |

### 逗號
1. print variable
```
name = "justin"
print ("my name is", name)
print ("my name is %s" %name)

show: my name is justin
```

2. print後面加逗號、這樣的話print就不會換行
```
name = 'justin'; age = 15
print ("my name is %s" %name),
print ("I'm %d years of age" %age)

show : my name is justin I'm 15 years of age
```
### python format
Refer: (https://pyformat.info/)

### Loop

```
names = ['Alice', 'Bob', 'Cindy']
for index, element in enumerate(names):
    print '%d %s' % (index, element)
```

### 裝飾器(decorator)

### *args and **kwargs用法

- `*args`和`**kwargs`可以將不確定數量的參數、傳送給函數
- 如果要處理帶key的參數則用`**kwargs`

```
def test_var_args(f_arg, *argv):
    print("first normal arg:", f_arg)
    for arg in argv:
        print("another arg through *argv:", arg)

test_var_args('yasoob', 'python', 'eggs', 'test')

輸出：
first normal arg: yasoob
another arg through *argv: python
another arg through *argv: eggs
another arg through *argv: test
```
```
def greet_me(**kwargs):
    for key, value in kwargs.items():
        print("{0} == {1}".format(key, value))

greet_me(name="yasoob")

輸出：
name == yasoob
```


