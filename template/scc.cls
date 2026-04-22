%%
%% scc.cls — Document class for essays published by
%% Strategy Critique Collective (SCC)
%%
%% Usage: \documentclass{scc}
%% Recommended engine: XeLaTeX (for exact font matching)
%% pdfLaTeX fallback supported
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scc}[2026/04/22 SCC Essay Class v2.0]

%% ---------- Options ----------
\newif\if@afourpaper\@afourpaperfalse
\DeclareOption{a4paper}{\@afourpapertrue}
\DeclareOption{letterpaper}{\@afourpaperfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[11pt]{article}

%% ---------- Engine detection ----------
\RequirePackage{iftex}

%% ---------- Geometry ----------
\RequirePackage{geometry}
\if@afourpaper
  \geometry{a4paper, top=1in, bottom=1in, left=1.3in, right=1.3in}
\else
  \geometry{letterpaper, top=1in, bottom=1in, left=1.3in, right=1.3in}
\fi

%% ---------- Colors ----------
\RequirePackage{xcolor}
\definecolor{scc-ink}{HTML}{1c1a15}
\definecolor{scc-muted}{HTML}{6e6859}
\definecolor{scc-faint}{HTML}{a6a090}
\definecolor{scc-accent}{HTML}{8a6d3b}
\definecolor{scc-rule}{HTML}{d8d2c2}

%% ---------- Fonts ----------
\ifxetex
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \setmainfont{IBM Plex Sans}[
    UprightFont    = *-Light,
    BoldFont       = *-Medium,
    ItalicFont     = *-LightItalic,
    BoldItalicFont = *-MediumItalic,
  ]
  \setsansfont{IBM Plex Sans}[
    UprightFont    = *-Light,
    BoldFont       = *-Medium,
    ItalicFont     = *-LightItalic,
    BoldItalicFont = *-MediumItalic,
  ]
  \setmonofont{IBM Plex Mono}[
    Scale = MatchLowercase,
  ]
  \newfontfamily\headingfont{Cormorant Garamond}[
    UprightFont    = *-Regular,
    BoldFont       = *-Medium,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-MediumItalic,
  ]
  \newfontfamily\labelfont{IBM Plex Mono}[
    Scale = MatchLowercase,
  ]
\else\ifluatex
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \setmainfont{IBM Plex Sans}[
    UprightFont    = *-Light,
    BoldFont       = *-Medium,
    ItalicFont     = *-LightItalic,
    BoldItalicFont = *-MediumItalic,
  ]
  \setsansfont{IBM Plex Sans}[
    UprightFont    = *-Light,
    BoldFont       = *-Medium,
    ItalicFont     = *-LightItalic,
    BoldItalicFont = *-MediumItalic,
  ]
  \setmonofont{IBM Plex Mono}[
    Scale = MatchLowercase,
  ]
  \newfontfamily\headingfont{Cormorant Garamond}[
    UprightFont    = *-Regular,
    BoldFont       = *-Medium,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-MediumItalic,
  ]
  \newfontfamily\labelfont{IBM Plex Mono}[
    Scale = MatchLowercase,
  ]
\else
  % pdfLaTeX fallback
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{ebgaramond}
  \RequirePackage[defaultsans,scale=0.95]{opensans}
  \RequirePackage{inconsolata}
  \renewcommand{\familydefault}{\sfdefault}
  \newcommand{\headingfont}{\fontfamily{EBGaramond-LF}\selectfont}
  \newcommand{\labelfont}{\ttfamily}
\fi\fi

%% ---------- Typography ----------
\RequirePackage{microtype}
\linespread{1.4}
\color{scc-ink}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.6em}

%% ---------- Core packages ----------
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{natbib}
\RequirePackage{etoolbox}

%% ---------- Hyperref (load last among content packages) ----------
\RequirePackage{hyperref}
\hypersetup{
  colorlinks  = true,
  linkcolor   = scc-accent,
  citecolor   = scc-accent,
  urlcolor    = scc-accent,
  pdfborder   = {0 0 0},
}

%% ---------- Metadata commands ----------
\newcommand{\@essaynumber}{}
\newcommand{\@paperdate}{}
\newcommand{\@shorttitle}{}
\newcommand{\@shortauthors}{}
\newcommand{\@keywords}{}

\newcommand{\essaynumber}[1]{\renewcommand{\@essaynumber}{#1}}
\newcommand{\paperdate}[1]{\renewcommand{\@paperdate}{#1}}
\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}
\newcommand{\shortauthors}[1]{\renewcommand{\@shortauthors}{#1}}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

%% ---------- Label helpers ----------
\newcommand{\scc@label}[1]{%
  {\labelfont\fontsize{8.5}{11}\selectfont\color{scc-ink}%
   \MakeUppercase{#1}}%
}

\newcommand{\scc@labelmuted}[1]{%
  {\labelfont\fontsize{8.5}{11}\selectfont\color{scc-muted}%
   \MakeUppercase{#1}}%
}

%% ---------- Header / Footer ----------
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhead[L]{{\labelfont\fontsize{8.5}{11}\selectfont\color{scc-faint}\@shortauthors}}
\fancyhead[R]{{\labelfont\fontsize{8.5}{11}\selectfont\color{scc-faint}\@shorttitle}}
\fancyfoot[C]{{\labelfont\fontsize{9}{11}\selectfont\color{scc-muted}\thepage}}

\fancypagestyle{firstpage}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[C]{{\labelfont\fontsize{9}{11}\selectfont\color{scc-muted}\thepage}}%
}

%% ---------- Title page ----------
\renewcommand{\maketitle}{%
  \thispagestyle{firstpage}%
  \begingroup
    %% Small identity label — no journal banner, no gold rule
    \noindent
    \scc@label{SCC}%
    \ifdefempty{\@essaynumber}{}{%
      \enspace\scc@labelmuted{·}\enspace
      \scc@labelmuted{Essay \@essaynumber}%
    }%
    \par\vskip 32pt
    %% Title
    {\headingfont\fontsize{24}{29}\selectfont\color{scc-ink}\@title\par}%
    \vskip 14pt
    %% Authors
    {\fontsize{11}{15}\selectfont\color{scc-ink}\@author\par}%
    %% Date
    \ifdefempty{\@paperdate}{}{%
      \vskip 4pt
      {\labelfont\fontsize{9}{12}\selectfont\color{scc-muted}%
       \@paperdate\par}%
    }%
    \vskip 22pt
    %% Thin rule
    {\color{scc-rule}\hrule height 0.4pt}%
    \vskip 22pt
  \endgroup
}

%% ---------- Abstract / summary ----------
%% We keep the standard `abstract` name but restyle it as a quiet
%% lede paragraph — no box, no "ABSTRACT" heading, no laundry list of
%% metadata. Keywords, if provided, appear as a small muted line.
\renewenvironment{abstract}{%
  \begingroup
  \fontsize{10.5}{16}\selectfont\color{scc-ink}%
  \noindent\ignorespaces
}{%
  \par
  \ifdefempty{\@keywords}{}{%
    \vskip 10pt
    {\scc@labelmuted{Keywords}\enspace\enspace
     \fontsize{9.5}{13}\selectfont\color{scc-muted}\@keywords\par}%
  }%
  \endgroup
  \vskip 22pt
  {\color{scc-rule}\hrule height 0.4pt}%
  \vskip 22pt
}

%% ---------- Section formatting ----------
%% No gold labels, no horizontal rules — just clean serif headings.
\titleformat{\section}
  {\headingfont\fontsize{15}{19}\selectfont\color{scc-ink}}
  {\thesection\enspace}
  {0pt}
  {}
\titlespacing*{\section}{0pt}{22pt}{6pt}

\titleformat{\subsection}
  {\headingfont\fontsize{12.5}{16}\selectfont\itshape\color{scc-ink}}
  {\thesubsection\enspace}
  {0pt}
  {}
\titlespacing*{\subsection}{0pt}{16pt}{4pt}

\titleformat{\subsubsection}
  {\normalfont\fontsize{10.5}{14}\selectfont\itshape\color{scc-ink}}
  {\thesubsubsection\enspace}
  {0pt}
  {}
\titlespacing*{\subsubsection}{0pt}{12pt}{3pt}

%% ---------- Captions ----------
\captionsetup{
  font       = {small},
  labelfont  = {bf},
  labelsep   = period,
  textfont   = {color=scc-ink},
  skip       = 8pt,
}

%% ---------- Lists ----------
\setlist{
  topsep    = 4pt,
  itemsep   = 2pt,
  parsep    = 0pt,
  leftmargin = 1.5em,
}

%% ---------- Bibliography ----------
\bibliographystyle{plainnat}
\setcitestyle{authoryear,round}

%% ---------- Footnotes ----------
\renewcommand{\footnoterule}{%
  \kern -3pt
  {\color{scc-rule}\hrule width 2in height 0.4pt}
  \kern 2.6pt
}

\endinput
