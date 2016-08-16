# Add a blog to your website in minutes

This is a template (and tutorial) for creating your blog with R Markdown in minutes.

This template is mostly based on [Jekyll Now](https://github.com/barryclark/jekyll-now). It adds some adjustments to properly render your posts based on R Markdown files.

## Procedure

### Prerequisites

- Make sure that you have the latest versions of R, RStudio and package knitr. 
- Install package gsubfn with `install.packages("gsubfn")`.
- Make sure that you have enabled Git in RStudio. More information can be found [there](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN).
- You need a GitHub account. 
- You need your own GitHub page. You can find a template (and tutorial) for creating it in minutes [there](https://github.com/privefl/rmarkdown-website-template).

### Get a first post on your blog

- Fork this repo and rename it to be 'blog' (in Settings of your brand new repo).
- Get the link from cloning the repo. Then, go to RStudio, create a New Project > Version Control > Git and copy this link. You have cloned your new repo as an R project.
- Modify `_config.yml`.
- Go knit the R Markdown file in directory `_knitr`. Then source `FormatPost.R` and use `FormatPost("_knitr/knitr-minimal.Rmd")` (or with any other extension) in the console.
- Commit and push everything from RStudio.
- Go see this post at https://YOURGITHUB.github.io/blog.

### Requirements and features of FormatPost

- You should place your (knitted) R Markdown files in the directory `_knitr`.
- The yaml header (delimited by '---') of you Rmd file needs to contain a title, date and to specity `keep_md: true`. 
- An md file will be created in directory `_posts`. Its name is created from the current date and the title but you may not mind.
- Some adjustments are made so that MathJax can handle mathematical equations.
- Some change in figures' and images' paths to be recognized in the site. You should keep the default path to figures rendered by knitr.
- When using the syntax ``![]()`` for an image, it should be centered in your future post after using ``FormatPost``. It should also have a proper caption.

![](https://cdn2.iconfinder.com/data/icons/freecns-cumulus/32/519791-101_Warning-128.png) Between the figures, images and equations to be handled properly, I couldn't test every case. So if it is possible that in some cases, your post won't render as you wish. Please open an issue with the reprodicible error.


## An example

You can see for example the blog part of [my own website](https://privefl.github.io/).

## Conclusion

As a reminder, most credit goes to the contributors of [Jekyll Now](https://github.com/barryclark/jekyll-now) and its author Barry Clark. 

If anything is false or not clear enough, feel free to contact me or open an issue.
If it is an issue only related with Jekyll, you'll find a better answer posting [there](https://github.com/barryclark/jekyll-now).
