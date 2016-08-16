FormatPost <- function(convert_file, githubrepo = NULL) {
  # convert_file: name/path to specific file (any extension) to convert
  # githubrepo: string giving your repository name (ex: "privefl") 
  #             in order to have a link to the pure html document
  
  # without extension
  prefix <- tools::file_path_sans_ext(convert_file)
  # all 3 extensions
  rmd <- paste0(prefix, ".Rmd")
  md <- paste0(prefix, ".md")
  html <- paste0(prefix, ".html")
  
  # write ref to html from github
  if (is.null(githubrepo)) {
    ref.to.html <- "\n\n***\n\n"
  } else {
    ref.to.html <-  paste0("\n\n***\n\n", 
                           "<div style=\"text-align:center\">\n",
                           "<a target=\"_blank\" ",
                           "href=\"https://htmlpreview.github.io/?",
                           "https://github.com/",
                           githubrepo,
                           "/blog/blob/gh-pages/",
                           html,
                           "\">View this as a standalone HTML page</a>\n",
                           "</div>",
                           "\n\n***\n\n")
  }
  
  # read files
  lines.rmd <- readLines(rmd, encoding = "UTF-8")
  lines.md <- readLines(md, encoding = "UTF-8")
  
  # get yaml header (delimited by the first '---')
  header.rmd <- grep("---", x = lines.rmd, fixed = TRUE)[2]
  first.line <- header.rmd + 1
  while (lines.rmd[first.line] == "") first.line <- first.line + 1
  first.line.md <- grep(lines.rmd[first.line], lines.md, fixed = TRUE)
  lines.md[1:(first.line.md - 1)] <- ""
  
  # get 'title', 'date' and 'layout' headers
  title <- grep("title:", lines.rmd, fixed = TRUE)
  date <- grep("date:", lines.rmd, fixed = TRUE)
  lines.md[1] <- paste0(paste("---", lines.rmd[title], lines.rmd[date], 
                              "layout: post", "---", "", sep = "\n"),
                        ref.to.html)
  
  # get the right name output format
  line.title <- sub("title:", "", lines.rmd[title])
  line.title <- gsub('\"', "", line.title, fixed = TRUE)
  suffix <- gsub("[ ]{1,}", "-", line.title)
  md.path <- file.path("_posts", paste0(Sys.Date(), suffix, ".md"))
  
  # form MathJax syntax
  lines.md <- gsub(pattern = "$", replacement = "$$", lines.md, fixed = TRUE)
  lines.md <- gsub(pattern = "$$$$", replacement = "\n\n$$\n\n", 
                   lines.md, fixed = TRUE)
  
  # Change path to figures
  base.prefix <- basename(prefix)
  base.dir <- dirname(prefix)
  pattern <-  paste0(base.prefix, "_files")
  tmp <- gsubfn::strapply(lines.md, pattern)
  ind <- which(!sapply(tmp, is.null))
  for (i in ind) {
    lines.md[i] <-
      gsubfn::gsubfn(pattern, file.path("{{ site.baseurl }}", "knitr_files",
                                        tmp[[i]][1]), lines.md[i])
  }
  dir.source <- file.path(base.dir, pattern)
  dir.target <- "knitr_files"
  if (!dir.exists(dir.target)) dir.create(dir.target)
  file.copy(from = dir.source, to = dir.target, 
            overwrite = TRUE, recursive = TRUE)
  
  # Change path to images
  pattern <- file.path("\\.\\.", "images")
  tmp <- gsubfn::strapply(lines.md, pattern)
  ind <- which(!sapply(tmp, is.null))
  for (i in ind) {
    lines.md[i] <-
      gsubfn::gsubfn(pattern, file.path("{{ site.baseurl }}", "images"), lines.md[i])
  }
  
  # Center images and add proper caption
  tmp <- gsubfn::strapply(lines.md, "!\\[[^]]*\\]\\([^)]+\\)")
  ind <- which(!sapply(tmp, is.null))
  for (i in ind) {
    for (k in 1:length(tmp[[i]])) {
      img.text <- gsubfn::strapply(tmp[[i]][k], "!\\[(.*)\\]\\(.+\\)")[[1]]
      img.url <- gsubfn::strapply(tmp[[i]][k], "!\\[.*\\]\\((.+)\\)")[[1]]
      caption <- ifelse(img.text == "", "", 
                        paste0("<p class=\"caption\">", img.text, "</p>"))
      lines.md[i] <- 
        gsubfn::gsubfn(sprintf("!\\[%s\\]\\(%s\\)", img.text, img.url), 
                       paste("<div class=\"figure\" style=\"text-align: center\">",
                             paste0("<img src=\"", img.url, 
                                    "\" alt=\"", img.text, "\"  />"),
                             caption,
                             "</div>", sep = "\n"), lines.md[i])
    }
  }
  
  # replace file with new lines
  writeLines(lines.md, md.path, useBytes = TRUE)
  
  return(md.path)
}

