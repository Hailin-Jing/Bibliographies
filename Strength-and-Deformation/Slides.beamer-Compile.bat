@echo off
xelatex Slides.beamer
biber Slides.beamer
xelatex Slides.beamer
xelatex Slides.beamer

del Slides.beamer.aux
del Slides.beamer.bbl
del Slides.beamer.bcf
del Slides.beamer.blg
del Slides.beamer.log
del Slides.beamer.nav
del Slides.beamer.out
del Slides.beamer.run.xml
del Slides.beamer.snm
del Slides.beamer.toc