@echo off
xelatex Slides.article
biber Slides.article
xelatex Slides.article
xelatex Slides.article

del Slides.article.aux
del Slides.article.bbl
del Slides.article.bcf
del Slides.article.blg
del Slides.article.log
del Slides.article.nav
del Slides.article.out
del Slides.article.run.xml
del Slides.article.snm
del Slides.article.toc