---
title: 如何写Midjourney的Promot
date: 2023-08-04 16:50:52
tags:
  - midjourney
categories:
  - AI
---

要想用好Midjourney，Promot绝对是非常重要的，有一定的技巧在里面。今天我们就尝试一下。

<!--more-->

## Promot

和ChatGPT不同，Midjourney没有上下文，所以需要一次说清楚你想画什么。

但是，不要用`复杂的长句子`来描述。

你可以把Promot想象成调用Midjourney API的参数。参数越多，越详细，那么就可能获得你期望的效果。

所以，Midjourney的Promot需要的是尽可能详细的一组`短词`作为入参。那么，这组短词应该如何来构成呢？如果你学过摄影，那么你应该很容易理解，其实就是从构图、颜色、光线等等方面来进行描述。如果非要公式化，可以参考下面这个：

`摄影类型 - 主体 - 主体修饰 - 背景 - 光线模式 - 全局光照 - 全局反射 - 写实/科幻/卡通/幻想`。

不过，很不幸，Midjourney不接受中文，所以每个部分你都需要英文来描述。很多同学就取巧先用中文描述后，让ChatGPT去翻译为英文，不过其实效果也不大好。我找到了一个表格，希望有帮助吧

{% img /images/mj-promot-p1.jpg %}

{% img /images/mj-promot-p2.jpg %}

{% img /images/mj-promot-p3.jpg %}

## 参数

接下来看参数，其实常用的不多，如下：

- `--niji`：这个参数可以让用户生成动漫和插画风格的图像，这个模型是Midjourney和Spellbrush合作开发的，对动漫、动漫风格和动漫美学有着更深入的了解。
- `--aspect`或`--ar`：这个参数可以让用户改变生成图像的宽高比，例如，`--aspect 16:9`可以获得16:9的纵横比。
- `--seed`：这个参数可以让用户设置随机种子，这可以帮助在几代图像之间保持更稳定/可重复性。也就是能够基于已经生成好的图片做微调，保持更好的一致性。
- `--no`：这个参数可以让用户给某些内容添加负面权重，让AI尝试移除或避免它们。例如，`--no plants`会尝试移除植物。
- `--c`：[0-100] Chaos，混乱程度，随机性。
- `--s`：[0-1000] Stylize，风格化越高艺术性越强。

## 示例

来看看我画的一个示例，Promot如下

`a full body shot of a 10yo little boy, cute, rectangle glasses, black shot hair, standing under big tree, looking to sky, add background of starry sky, nature noon light, realistic photograph, global illumination, depth of view, side-angle view`

图片如下：

{% img /images/mj-sample-1.png %}