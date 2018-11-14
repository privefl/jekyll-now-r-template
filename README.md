# Add a blog to your website in minutes

This is a template (and tutorial) for creating your blog with R Markdown in minutes.

## Implementation

This template is mostly based on [Jekyll Now](https://github.com/barryclark/jekyll-now). It adds some adjustments to properly render your posts based on R Markdown files.
I'm no expert in HTML so some lines of code may be useless.


## Procedure

### Prerequisites

- Make sure that you have the latest versions of R and RStudio.
- Install package prettyjekyll with `devtools::install_github("privefl/prettyjekyll")`.
- Make sure that you have enabled Git in RStudio. More information can be found [there](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN).
- You need a GitHub account. 
- You need your own GitHub page. You can find a template (and tutorial) for creating it in minutes [there](https://github.com/privefl/rmarkdown-website-template).

### Get a first post on your blog

- Fork this repo (top-right).
- In the settings of your brand new repo, rename it to be "blog" and make sure that the "GitHub Pages" are activated.
- Get the link from cloning the repo. Then, go to RStudio, create a New Project > Version Control > Git and copy this link. You have cloned your new repo as an R project.
- Modify `_config.yml`.
- Go knit the R Markdown file in directory `_knitr` if you want to see its HTML preview in RStudio. Then use `prettyjekyll::FormatPost("_knitr/knitr-minimal.Rmd")` in the console.
- Commit and push everything from RStudio.
- Go see this post at https://YOURGITHUB.github.io/blog.

### Get your own post on your blog

- Create an Rmd document with the template from package prettyjekyll.
- Fill it, previewing the result with the Knit button. The main content should be the same in your future post.
- When you have finished, use `prettyjekyll::FormatPost` on your R Markdown file and commit/push the changes from RStudio.
- Go verify that it renders well on your blog. 

### Requirements and features of FormatPost

More information can be found [there](https://github.com/privefl/prettyjekyll#requirements-and-features-of-formatpost).

## An example

You can see for example the blog part of [my own website](https://privefl.github.io/).

For example, 

- see [this post](https://privefl.github.io/blog/R-package-primefactr/) and what was [its html preview in RStudio](https://htmlpreview.github.io/?https://github.com/privefl/blog/blob/gh-pages/_knitr/post-primefactr.html). 
Pretty close, no?

## Why should you care?

I wanted something for creating my website, blogging and posting on it, that 

- was very simple to use,
- didn't need any further installation (no Jekyll, Ruby or whatever),
- could be __previewed directly from RStudio__ at any moment.

## Conclusion

As a reminder, most credit goes to the contributors of [Jekyll Now](https://github.com/barryclark/jekyll-now) and its author Barry Clark. I also used parts of the css files and templates in [package prettydoc](https://github.com/yixuan/prettydoc).

If anything is false or not clear enough, feel free to contact me or open an issue. 

- If it is an issue only related with `FormatPost`, please open an issue [there](https://github.com/privefl/prettyjekyll/issues).
- If it is an issue only related with Jekyll, you'll find a better answer posting [there](https://github.com/barryclark/jekyll-now).
