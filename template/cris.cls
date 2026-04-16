%%
%% cris.cls — Document class for
%% Critical Review of Investment Strategies (CRIS)
%% Published by Strategy Critique Collective (SCC)
%%
%% Usage: \documentclass{cris}
%% Recommended engine: XeLaTeX (for exact font matching)
%% pdfLaTeX fallback supported
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cris}[2025/01/01 CRIS Journal Class v1.0]

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
  \geometry{a4paper, top=1in, bottom=1in, left=1.25in, right=1.25in}
\else
  \geometry{letterpaper, top=1in, bottom=1in, left=1.25in, right=1.25in}
\fi

%% ---------- Colors ----------
\RequirePackage{xcolor}
\definecolor{cris-black}{HTML}{0e0e0c}
\definecolor{cris-body}{HTML}{1a1a18}
\definecolor{cris-gold}{HTML}{c8a96e}
\definecolor{cris-gold-muted}{HTML}{7a6540}
\definecolor{cris-rule}{HTML}{d9ccb0}

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
    UprightFont    = *-Light,
    BoldFont       = *-SemiBold,
    ItalicFont     = *-LightItalic,
    BoldItalicFont = *-SemiBoldItalic,
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
    UprightFont    = *-Light,
    BoldFont       = *-SemiBold,
    ItalicFont     = *-LightItalic,
    BoldItalicFont = *-SemiBoldItalic,
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
\color{cris-body}
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
\RequirePackage{soul}

%% ---------- Hyperref (load last among content packages) ----------
\RequirePackage{hyperref}
\hypersetup{
  colorlinks  = true,
  linkcolor   = cris-gold-muted,
  citecolor   = cris-gold-muted,
  urlcolor    = cris-gold,
  pdfborder   = {0 0 0},
}

%% ---------- Metadata commands ----------
\newcommand{\@volume}{}
\newcommand{\@papernumber}{}
\newcommand{\@paperyear}{}
\newcommand{\@papermonth}{}
\newcommand{\@shorttitle}{}
\newcommand{\@shortauthors}{}
\newcommand{\@keywords}{}
\newcommand{\@jelcodes}{}
\newcommand{\@correspondence}{}

\newcommand{\volume}[1]{\renewcommand{\@volume}{#1}}
\newcommand{\papernumber}[1]{\renewcommand{\@papernumber}{#1}}
\newcommand{\paperyear}[1]{\renewcommand{\@paperyear}{#1}}
\newcommand{\papermonth}[1]{\renewcommand{\@papermonth}{#1}}
\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}
\newcommand{\shortauthors}[1]{\renewcommand{\@shortauthors}{#1}}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\jelcodes}[1]{\renewcommand{\@jelcodes}{#1}}
\newcommand{\correspondence}[1]{\renewcommand{\@correspondence}{#1}}

%% ---------- Label helper ----------
\newcommand{\cris@label}[1]{%
  {\labelfont\fontsize{8}{10}\selectfont\color{cris-gold}%
   \MakeUppercase{#1}}%
}

\newcommand{\cris@labelmuted}[1]{%
  {\labelfont\fontsize{8}{10}\selectfont\color{cris-gold-muted}%
   \MakeUppercase{#1}}%
}

%% ---------- Header / Footer ----------
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhead[L]{\cris@labelmuted{\@shortauthors}}
\fancyhead[R]{\cris@labelmuted{\@shorttitle}}
\fancyfoot[C]{{\labelfont\fontsize{9}{11}\selectfont\color{cris-gold-muted}\thepage}}

\fancypagestyle{firstpage}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[C]{{\labelfont\fontsize{9}{11}\selectfont\color{cris-gold-muted}\thepage}}%
}

%% ---------- Title page ----------
\renewcommand{\maketitle}{%
  \thispagestyle{firstpage}%
  \begingroup
    %% Top gold rule
    {\color{cris-gold}\hrule height 0.5pt}%
    \vskip 8pt
    %% Journal identity bar
    \noindent
    \cris@label{SCC}\hfill
    \cris@labelmuted{Critical Review of Investment Strategies}%
    \par\vskip 4pt
    \noindent
    \cris@labelmuted{Vol.~\@volume\enspace·\enspace No.~\@papernumber\enspace·\enspace\@papermonth~\@paperyear}%
    \par\vskip 8pt
    {\color{cris-rule}\hrule height 0.4pt}%
    \vskip 36pt
    %% Title
    {\headingfont\fontsize{26}{31}\selectfont\color{cris-black}\@title\par}%
    \vskip 18pt
    %% Authors
    {\fontsize{12}{16}\selectfont\color{cris-body}\@author\par}%
    \vskip 6pt
    %% Date
    {\labelfont\fontsize{9}{12}\selectfont\color{cris-gold-muted}%
     \@papermonth~\@paperyear\par}%
    \vskip 30pt
  \endgroup
}

%% ---------- Abstract ----------
\renewenvironment{abstract}{%
  \cris@sectionrule{Abstract}%
  \vskip 6pt
  \begingroup\fontsize{10.5}{15}\selectfont\color{cris-body}%
}{%
  \par
  %% Keywords
  \ifdefempty{\@keywords}{}{%
    \vskip 12pt
    {\cris@labelmuted{Keywords}\enspace\enspace
     \fontsize{10}{14}\selectfont\color{cris-body}\@keywords\par}%
  }%
  %% JEL codes
  \ifdefempty{\@jelcodes}{}{%
    \vskip 4pt
    {\cris@labelmuted{JEL}\enspace\enspace
     \fontsize{10}{14}\selectfont\color{cris-body}\@jelcodes\par}%
  }%
  %% Correspondence
  \ifdefempty{\@correspondence}{}{%
    \vskip 4pt
    {\cris@labelmuted{Correspondence}\enspace\enspace
     \fontsize{10}{14}\selectfont\color{cris-body}\@correspondence\par}%
  }%
  \endgroup
  \vskip 24pt
  {\color{cris-rule}\hrule height 0.4pt}%
  \vskip 24pt
}

%% ---------- Section rule helper ----------
\newcommand{\cris@sectionrule}[1]{%
  \noindent
  \cris@label{#1}%
  \enspace
  {\color{cris-rule}\leaders\hrule height 0.4pt\hfill\kern0pt}%
  \par\vskip 2pt
}

%% ---------- Section formatting ----------
\titleformat{\section}
  {\normalfont}
  {}
  {0pt}
  {\cris@sectionrule}
\titlespacing*{\section}{0pt}{28pt}{8pt}

\titleformat{\subsection}
  {\headingfont\fontsize{16}{20}\selectfont\color{cris-black}}
  {\thesubsection\enspace}
  {0pt}
  {}
\titlespacing*{\subsection}{0pt}{20pt}{6pt}

\titleformat{\subsubsection}
  {\normalfont\itshape\fontsize{11}{15}\selectfont\color{cris-body}}
  {\thesubsubsection\enspace}
  {0pt}
  {}
\titlespacing*{\subsubsection}{0pt}{14pt}{4pt}

%% ---------- Captions ----------
\captionsetup{
  font       = {small},
  labelfont  = {bf},
  labelsep   = period,
  textfont   = {color=cris-body},
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
  {\color{cris-rule}\hrule width 2in height 0.4pt}
  \kern 2.6pt
}

\endinput
