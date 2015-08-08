# StyleSheet

[![CI Status](http://img.shields.io/travis/dongzhao/StyleSheet.svg?style=flat)](https://travis-ci.org/dongzhao/StyleSheet)
[![Version](https://img.shields.io/cocoapods/v/StyleSheet.svg?style=flat)](http://cocoapods.org/pods/StyleSheet)
[![License](https://img.shields.io/cocoapods/l/StyleSheet.svg?style=flat)](http://cocoapods.org/pods/StyleSheet)
[![Platform](https://img.shields.io/cocoapods/p/StyleSheet.svg?style=flat)](http://cocoapods.org/pods/StyleSheet)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

1. UIKit

## Installation

StyleSheet is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StyleSheet"
```


##What's wrong with origin method?
如果要实现下面这个效果，两个label，一个button，一个view
![image](http://ww1.sinaimg.cn/large/7df22103jw1euv1c5pbvdj20k00zkq3f.jpg)
基于原有的配置大概要写

```
    self.label.layer.cornerRadius = 3;
    self.label.textColor = [UIColor darkTextColor];
    self.label.font = [UIFont systemFontOfSize:13];
    self.label.backgroundColor = [UIColor greenColor];
    self.label.layer.borderWidth = 2;
    self.label.layer.borderColor = [UIColor redColor].CGColor;
    
    
    self.label2.layer.cornerRadius = 3;
    self.label2.textColor = [UIColor darkTextColor];
    self.label2.font = [UIFont systemFontOfSize:13];
    self.label2.backgroundColor = [UIColor greenColor];
    self.label2.layer.borderWidth = 2;
    self.label2.layer.borderColor = [UIColor redColor].CGColor;
    
    
    self.button.layer.cornerRadius = 3;
    self.button.backgroundColor = [UIColor greenColor];
    self.button.layer.borderWidth = 2;
    self.button.layer.borderColor = [UIColor redColor].CGColor;
    
    self.aView.layer.cornerRadius = 3;
    self.aView.backgroundColor = [UIColor greenColor];
    self.aView.layer.borderWidth = 2;
    self.aView.layer.borderColor = [UIColor redColor].CGColor;
```

所暴漏的问题：

1. 繁琐的代码，大量重复性的工作
2. 样式无法共享，每一个View都需要重新进行样式赋值。

因而StyleSheet所要解决的问题就是：

1. 样式配置轻便化，能够使用更加少的代码来描述View的样式
2. 样式在View之间的共享


目前阶段使用StyleSheet完成上述样式：

```
self.label.style = DZLabelStyleMake(
                                        style.backgroundColor = [UIColor greenColor];
                                        style.cornerRedius = 3;
                                        style.borderColor = [UIColor redColor];
                                        style.borderWidth = 2;
                                        style.textStyle.textColor = [UIColor darkTextColor];
                                        style.textStyle.font = [UIFont systemFontOfSize:13];
    );
    self.label2.style = self.label.style;
    self.aView.style = self.label.style;
    [self.button.style copyAttributesWithStyle:self.label.style];
```



###How to use?
在设计StyleSheet的时候故意淡化了被渲染的View的类型的概念，任何一种类型的Style可以对任何类型的View进行渲染，但是必须是这种类型的View支持Style所指称的属性。比如你可以使用真对Button设计的DZButtonStateStyle来渲染一个UILabel，但由于UILabel不支持DZButtonStateStyle中的渲染属性，所以渲染结果是无效的。  

但是当使用DZButtonStyle(继承自DZViewStyle)来渲染UILabel的时候，会使用DZButtonStyle中其父类的某些渲染属性，来渲染UILabel的父类UIView所支持的那些属性。
####直接使用Style对View进行渲染：

```
DZLabelStyle* style = DZLabelStyleMake(
                                        style.backgroundColor = [UIColor greenColor];
                                        style.cornerRedius = 3;
                                        style.borderColor = [UIColor redColor];
                                        style.borderWidth = 2;
                                        style.textStyle.textColor = [UIColor darkTextColor];
                                        style.textStyle.font = [UIFont systemFontOfSize:13];
    );

[style decorateView:self.label];
```
直接渲染的好处是，不用再次生成Style对象，更加方便样式在多个View之间渲染。


####赋值渲染

```
self.label.style = style;
```

或者

```
self.label.style = DZLabelStyleMake(
                                        style.backgroundColor = [UIColor greenColor];
                                        style.cornerRedius = 3;
                                        style.borderColor = [UIColor redColor];
                                        style.borderWidth = 2;
                                        style.textStyle.textColor = [UIColor darkTextColor];
                                        style.textStyle.font = [UIFont systemFontOfSize:13];
    );
```

当进行赋值渲染的时候，会将Style的Copy后的实例与当前View绑定，当更改Style的属性的时候，对应View的样式会立刻改变。

###通用样式的共享
使用原有的配置，进行通用样式的共享是个非常困难的事情，基本上都是体力活，靠人力来维护。我们的代码中会掺杂大量的用于配置样式的代码，而且是独立且散在。

现在你可以通过StyleSheet解决：
####定义共享的样式：

```
EXTERN_SHARE_LABEL_STYLE(Content)

IMP_SHARE_LABEL_STYLE(Content,
                      style.backgroundColor = [UIColor clearColor];
                      style.cornerRedius = 2;
                      style.textStyle.textColor = [UIColor redColor];
                      )
```


####使用共享样式,方式一

```
self.label.style =  DZStyleContent();
```
####使用共享样式，方式二（推荐）
很多时候, 如果不需要进一步更改样式,可以不采复制赋值的方式来进行渲染，可以直接使用：

```
[DZStyleContent() decorateView:self.label];

```
只进行渲染，而不进行复制

##支持的类型

1. UIView
2. UILabel
3. UITextView
4. UITextField
5. UIButton

##计划中支持的类型

1. UISearchBar
2. UINavigationBar
3. .....

## Author

yishuiliunian@gmail.com

## License

StyleSheet is available under the MIT license. See the LICENSE file for more info.
