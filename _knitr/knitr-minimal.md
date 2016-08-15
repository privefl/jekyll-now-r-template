# A minimal R Markdown example
August 15, 2016  

## Quotes

> I love R and I like writing articles with R Markdown.

# Lists

This is a bullet list:

- item 1,
- item 2.

This is an ordered list:

1. item 3,
2. item 4.

## Equations

This is an inline equation with an inline R code chunk: $\pi = 3.1415927$.

This is the Gaussian integral equation: $$\int_{-\infty}^{+\infty} e^{-x^2}~dx = \sqrt{\pi}.$$

## Plots


```r
knitr::opts_chunk$set(fig.width=7, fig.height=5, fig.path = "../knitr_files/")
```



```r
curve(exp(-x^2), -2.5, 2.5)
```

![](../knitr_files/unnamed-chunk-2-1.png)<!-- -->

## Images

<div style="text-align:center">    
  ![Thanks GitHub for hosting my website!](http://moduslaborandi.net/wp-content/uploads/2015/05/github.pages.jpg)
</div>

