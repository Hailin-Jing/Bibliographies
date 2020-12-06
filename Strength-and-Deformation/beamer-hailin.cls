\ProvidesClass{beamer-hailin}[2020/10/28]
\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\RequirePackage{silence}
\WarningFilter{hyperref}{Token not allowed}
\WarningFilter{biblatex}{No driver for entry type}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=beamerhailin, prefix=beamerhailin@, setkeys=\kvsetkeys}
\DeclareStringOption[default]{theme}
\DeclareStringOption[default]{colortheme}
\DeclareStringOption[english]{language}
\DeclareStringOption[SpringGreen4]{color}
\ProcessKeyvalOptions*\relax

\RequirePackage{ifthen}

\DeclareOption*{
    \ifthenelse{\equal{\beamerhailin@language}{chinese}}{
        \PassOptionsToClass{\CurrentOption}{ctexbeamer}
    }{
        \PassOptionsToClass{\CurrentOption}{beamer}
    }
}
\ProcessOptions\relax

\ifthenelse{\equal{\beamerhailin@language}{english}}{
    \LoadClass[compress,xcolor=x11names,UTF8]{beamer}}{
        \ifthenelse{\equal{\beamerhailin@language}{chinese}}{
            \LoadClass[compress,xcolor=x11names,UTF8]{ctexbeamer}
            \setbeamerfont*{title}{family=\sffamily, shape=\scshape, series=\bfseries, size=\LARGE}
            \setbeamerfont{frametitle}{family=\rmfamily, shape=\upshape, series=\bfseries}
            \setbeamerfont{normal text}{family=\rmfamily, shape=\upshape, series=\mdseries}
            \AtBeginDocument{\usebeamerfont{normal text}}}
}

\RequirePackage[
    backend=biber,
    style=gb7714-2015ay,
    gblanorder=chineseahead,
    sortlocale=zh__pinyin,
    block=nbpar
]{biblatex}
\hypersetup{colorlinks,allcolors=.,urlcolor=maincolor}

\def\footcite#1{\authornumcite{#1}\footfullcite{#1}}

\colorlet{maincolor}{\beamerhailin@color}

\RequirePackage{tikz}
\usetheme{Boadilla}
\usecolortheme{seahorse}
\useinnertheme[shadow]{rounded}
\useoutertheme[subsection=false]{smoothbars}
%\usecolortheme{spruce}
\usecolortheme[named=maincolor]{structure}
%\usefonttheme{structurebold}
\usefonttheme[stillsansseriflarge,onlymath]{serif}
\useinnertheme{circles}
%\usecolortheme{rose}
\RequirePackage{pifont}
\RequirePackage{academicons}
\RequirePackage{fontawesome}
\RequirePackage{iitem}
\setbeamertemplate{itemize item}{\ding{108}}
\setbeamertemplate{itemize subitem}{\ding{109}}
\setbeamertemplate{navigation symbols}{}
\setbeamercolor{section in head/foot}{fg=white}
\setbeamercovered{transparent}  
\renewcommand\appendixname{附录}
\renewcommand\abstractname{摘要}
\graphicspath{{figure/}} % 图片路径
\RequirePackage{calligra} % Thank you
\RequirePackage{ctex} % 加入中文
%\setCJKsansfont{Noto Sans CJK SC}
%\setsansfont{Lato} % Lato Roboto Fira Sans

%\RequirePackage{mathptmx}
%\RequirePackage{helvet}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage[para]{threeparttable}
\RequirePackage{float}
\RequirePackage{verbatim}
\RequirePackage[justification=centering]{caption}

% Add support for \subsubsectionpage
\setbeamertemplate{section page} 
{
    \begin{center}
        \usebeamerfont{section name}
        \usebeamercolor[fg]{section name}
        \ifthenelse{\equal{\beamerhailin@language}{english}}{\sectionname~\insertsectionnumber}{}
        \ifthenelse{\equal{\beamerhailin@language}{chinese}}{第\insertsectionnumber 部分}{}
        \vskip1em\par\hspace{-.6em}
        \begin{beamercolorbox}[sep=4pt,center]{part title} 
            \usebeamerfont{section title}
            \insertsection\par 
        \end{beamercolorbox}
    \end{center}
}
\def\sectionpage{\usebeamertemplate*{section page}}

\setbeamertemplate{subsection page} 
{ 
    \begin{center}
        \usebeamerfont{subsection name}
        \usebeamercolor[fg]{subsection name}
        \vskip1em\par\hspace{-.6em}
        \begin{beamercolorbox}[sep=4pt,center]{part title} 
            \usebeamerfont{section title}
            \insertsection
        \end{beamercolorbox}
        \vskip1em\par
        \ifthenelse{\equal{\beamerhailin@language}{english}}{\insertsubsection}{}
        \ifthenelse{\equal{\beamerhailin@language}{chinese}}{\insertsubsection}{}\par 
    \end{center}
}
\def\subsectionpage{\usebeamertemplate*{subsection page}}

\setbeamercolor{MainColor}{fg=black,bg=maincolor!40!white}
\def\thanksinfo{
    \ifthenelse{\equal{\beamerhailin@language}{english}}{Thanks for Listening!}{}
    \ifthenelse{\equal{\beamerhailin@language}{chinese}}{感谢聆听！}{}}

\newcommand{\thankspage}[1][\thanksinfo]{
    \begin{beamercolorbox}[wd=.95\paperwidth, ht=1.4cm,rounded=true,shadow=true]{MainColor}
        \begin{center}
      {\huge #1}
        \end{center}
   \end{beamercolorbox}
}

\RequirePackage{multicol}
