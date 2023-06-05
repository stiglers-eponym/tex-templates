% This class is a patch work from many different sources with code copied from different sources, which are not always adequately mentioned

% This document contains code licensed under the conditions of the
% LaTeX Project Public License version 1.3c, available at
% http://www.latex-project.org/lppl/ (see line 176f.)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[2023/06/05 v0.2 My custom CV class]
\LoadClass[11pt, a4paper]{scrartcl}

\RequirePackage{%
  titlesec,%
  hyperref,%
  xcolor,%
  %graphicx,%
  enumitem,%
  %tabularx,%
  longtable,%
  calc,%
  array,%
  setspace,%
  lastpage,%
  geometry,%
  amssymb%
}
\setstretch{1.0110294} % = 13.75/13.6 This sets the line spacing to 1.25 times the font size


%% KOMA script header and footer definition
\RequirePackage{scrlayer-scrpage}
\ifoot{}\cfoot{\thepage\,/\,\pageref*{LastPage}}\ofoot{}
\geometry{top=2.5cm, left=2.8cm, right=2.8cm, bottom=2.5cm}

% Configure hyphenation: increase penalty
\tolerance=1000
\hyphenpenalty=2000

\hypersetup{%
  %bookmarks=false,%
  unicode=false,%
  pdftoolbar=false,%
  pdfmenubar=true,%
  pdffitwindow=true,%
  pdfstartview={Fit},%
  pdftitle={Curriculum Vitae},%
  pdfsubject={},%
  pdfcreator={},%
  pdfproducer={},%
  pdfkeywords={CV},%
  pdfnewwindow=false,
  colorlinks=true,%
  allcolors=.%
}

\definecolor{maintitle}{rgb}{0,0.12,.3}
\definecolor{sectiontitle}{rgb}{0,0.15,.42}
\definecolor{leftcolumncolor}{rgb}{0,0.1,0.2}
\definecolor{textgray}{rgb}{0.2,0.25,.38}
\definecolor{textcolor}{rgb}{0,0,0}

%\definecolor{linecolor}{rgb}{.65,.8,1}
\definecolor{linecolor}{rgb}{.85,.85,.9}

% colors for itemize labels
\colorlet{color1}{leftcolumncolor}
\colorlet{color2}{textcolor}
\setlist[itemize,1]{label={\color{color1}\small$\blacktriangleright$}}

\titleformat{\section}
  {\color{sectiontitle}\fontsize{15.8pt}{19pt}\selectfont\scshape\raggedright}
  {}{0em}                       % prefix for all sections
  {}                            % insert code before the heading
  [{\color{linecolor}\titlerule[.5pt]}] % Inserts a horizontal line after the heading
\titleformat{\subsection}
  {\color{leftcolumncolor}\fontsize{14pt}{16pt}\selectfont\scshape\raggedright}
  {}{0em}
  {}

\titlespacing*{\section}
{0pt}{3.5ex plus 1.5ex minus 1ex}{1.5ex plus .5ex}
\titlespacing*{\subsection}
{0pt}{2ex plus .5ex minus .25ex}{1ex plus .2ex}

\setlength{\parindent}{0pt}
\setlength{\tabcolsep}{5pt}

\newlength{\cvcolumnwidth}
\setlength{\cvcolumnwidth}{.2\textwidth-.5\tabcolsep}
\renewcommand{\arraystretch}{1.25}


\newenvironment{cvcolumns}%
{%
  \vspace{-\baselineskip}%
  \begin{longtable}[ t ]{ @{}>{\raggedleft\arraybackslash}p{\cvcolumnwidth} p{\linewidth-\cvcolumnwidth-2\tabcolsep} }%
}{%
  \end{longtable}%
}

\newenvironment{cvtwocolumns}%
{%
  \vspace{-\baselineskip}%
  \newlength\availablewidth%
  \setlength\availablewidth{\linewidth-2\cvcolumnwidth-3\tabcolsep}%
  \begin{longtable}[ t ]{ @{}>{\raggedleft\arraybackslash}p{\cvcolumnwidth} p{.5\availablewidth} >{\raggedleft\arraybackslash} p{\cvcolumnwidth} p{.5\availablewidth} }%
}{%
  \end{longtable}%
}

\newcommand{\cvitem}[2]{%
  {\color{leftcolumncolor}\bfseries#1} & #2 \\
}

\newcommand{\cvtwocolitem}[4]{%
  {\color{leftcolumncolor}#1} & #2 &
  {\color{leftcolumncolor}#3} & #4 \\
}

\newsavebox\itembox%
\newcommand\descritem[1]{%
  \savebox\itembox{\parbox[t]{\cvcolumnwidth}{\strut\color{leftcolumncolor}\bfseries#1\strut}}%
  \item[\smash{\usebox\itembox}]%
}

\newenvironment{cvsection}[1]%
{%
  \section{#1}
  \begin{cvcolumns}%
}{%
  \end{cvcolumns}%
}

\newcommand{\cvsubsection}[1]{%
  \end{cvcolumns}%
  \subsection{#1}%
  \begin{cvcolumns}%
}

\newcommand{\cventry}[5]{%
  {\color{leftcolumncolor}#1}&%
  \ifx#2\empty\else%
    {\bfseries#2}%
  \fi%
  \ifx#3\empty\else%
    {\bfseries~(#3)}%
  \fi%
  \ifx#4\empty\else%
    \newline{\itshape#4}%
  \fi%
  \ifx#5\empty\else%
    \newline#5%
  \fi%
  \\
}

\newcommand{\cvitemitemized}[3]{%
  {\color{leftcolumncolor}#1} &%
  \begin{minipage}[t]{\linewidth}%
    #2%
    {%\small%
      \begin{itemize}[nolistsep]%
        #3
      \end{itemize}%
    }%
  \end{minipage}\\
}

\newcommand{\cvlongitem}[2]{%
  {\color{leftcolumncolor}#1} &%
  \begin{minipage}[t]{\linewidth}%
    #2%
  \end{minipage}\\%
}


% This is partially copied and modified from moderncv.cls:
%% Copyright 2006-2015 Xavier Danaux (xdanaux@gmail.com), 2020-2022 moderncv maintainers (github.com/moderncv).
%
% moderncv may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.

\newcommand\cvfirstname\empty
\newcommand\cvfamilyname\empty
\newcommand\cvnametitle\empty
\newcommand\nametitle[1]{%
  \renewcommand\cvnametitle{#1}
}
\newcommand{\name}[2]{%
  \renewcommand\cvfamilyname{#1}
  \renewcommand\cvfirstname{#2}
  \title{{\cvfirstname} {\cvfamilyname}}
  \hypersetup{%
    pdfauthor={\cvfirstname{} \cvfamilyname},%
    pdfkeywords={CV, \cvfamilyname},%
    pdftitle={CV \cvfirstname{} \cvfamilyname},%
  }
}
\newcommand*{\addresssymbol}            {}
\newcommand*{\bornsymbol}               {}
\newcommand*{\mobilephonesymbol}        {}
\newcommand*{\fixedphonesymbol}         {}
\newcommand*{\faxphonesymbol}           {}
\newcommand*{\emailsymbol}              {}
\newcommand*{\homepagesymbol}           {}
\newcommand*{\linkedinsocialsymbol}     {}
\newcommand*{\xingsocialsymbol}         {}
\newcommand*{\twittersocialsymbol}      {}
\newcommand*{\githubsocialsymbol}       {}
\newcommand*{\gitlabsocialsymbol}       {}
\newcommand*{\stackoverflowsocialsymbol}{}
\newcommand*{\bitbucketsocialsymbol}    {}
\newcommand*{\skypesocialsymbol}        {}
\newcommand*{\orcidsocialsymbol}        {}
\newcommand*{\researchgatesocialsymbol} {}
\newcommand*{\researcheridsocialsymbol} {}
\newcommand*{\googlescholarsocialsymbol}{}
\newcommand*{\telegramsocialsymbol}     {}
\newcommand*{\whatsappsocialsymbol}     {}
\newcommand*{\matrixsocialsymbol}       {}
\newcommand*{\signalsocialsymbol}       {}
%\RequirePackage{moderncviconsacademic}
\RequirePackage{moderncviconsawesome}

\providecommand\cvemail\empty
\newcommand{\email}[1]{%
  \renewcommand\cvemail{{\color{textgray}\emailsymbol \href{mailto:#1}{#1}}}
}
\providecommand\cvphone\empty
\newcommand{\phone}[2][\empty]{%
  \ifx#1\empty%
    \renewcommand\cvphone{{\color{textgray}\fixedphonesymbol~\href{tel:#2}{#2}}}
  \else%
    \renewcommand\cvphone{{\color{textgray}\fixedphonesymbol~\href{tel:#1}{#2}}}
  \fi%
}
\providecommand\cvmobile\empty
\newcommand{\mobile}[2][\empty]{%
  \ifx#1\empty%
    \renewcommand\cvmobile{{\color{textgray}\mobilephonesymbol~\href{tel:#2}{#2}}}%
  \else%
    \renewcommand\cvmobile{{\color{textgray}\mobilephonesymbol~\href{tel:#1}{#2}}}%
  \fi%
}
\providecommand\cvhomepage\empty
\newcommand{\homepage}[2][\empty]{%
  \ifx#1\empty%
    \renewcommand\cvhomepage{{\color{textgray}\homepagesymbol~\href{#2}{#2}}}
  \else%
    \renewcommand\cvhomepage{{\color{textgray}\homepagesymbol~\href{#1}{#2}}}
  \fi%
}
\providecommand\cvgithub\empty
\newcommand{\github}[2][\empty]{%
  \ifx#1\empty%
    \renewcommand\cvgithub{{\color{textgray}\githubsocialsymbol~\href{#2}{#2}}}
  \else%
    \renewcommand\cvgithub{{\color{textgray}\githubsocialsymbol~\href{#1}{#2}}}
  \fi%
}
\providecommand\cvlinkedin\empty
\newcommand{\linkedin}[2][\empty]{%
  \ifx#1\empty%
    \renewcommand\cvlinkedin{{\color{textgray}\linkedinsocialsymbol~\href{#2}{#2}}}
  \else%
    \renewcommand\cvlinkedin{{\color{textgray}\linkedinsocialsymbol~\href{#1}{#2}}}
  \fi%
}
\providecommand\cvorcid\empty
\newcommand{\orcid}[2][\empty]{%
  \ifx#1\empty%
    \renewcommand\cvorcid{{\color{textgray}\orcidsocialsymbol~\href{https://orcid.org/#2}{#2}}}
  \else%
    \renewcommand\cvorcid{{\color{textgray}\orcidsocialsymbol~\href{#1}{#2}}}
  \fi%
}
\providecommand\cvaddress\empty
\newcommand{\address}[4]{%
  \renewcommand\cvaddress{%
    {\color{textgray}%
      \ifx\addresssymbol\empty\else\addresssymbol\fi%
      \ifx#1\empty\else%
        #1%
      \fi%
      \ifx#2\empty\else%
        \\ #2%
      \fi%
      \ifx#3\empty\else%
        \\ #3%
      \fi%
      \ifx#4\empty\else%
        \\ #4%
      \fi%
    }%
  }
}

\newsavebox\setasidebox
\newlength\setasidelength
\newcommand\setaside[2]{%
  \savebox\setasidebox{\strut#1\ \strut}%
  \settowidth\setasidelength{\usebox\setasidebox}%
  \parbox[b]{\linewidth}{%
    \hangindent=\setasidelength%
    \strut\usebox\setasidebox#2\strut%
  }%
}

%\newsavebox\setasideleftbox
%\newsavebox\setasiderightbox
%\newlength\setasidelength
%\newlength\setasideheight
%\newcommand\setaside[2]{%
%  \savebox\setasideleftbox{\strut#1 }%
%  \settowidth\setasidelength{\usebox\setasideleftbox}%
%  \savebox\setasiderightbox{\parbox[b]{\dimexpr\linewidth-\setasidelength}{\strut#2\strut}}%
%  \settoheight\setasideheight{\usebox\setasiderightbox}%
%  \parbox[b][\setasideheight][t]{\setasidelength}{\usebox\setasideleftbox}\usebox\setasiderightbox\strut%
%}

\newif\ifneedsnewline\needsnewlinefalse
\newcommand\newlineif{\ifneedsnewline\\\fi\strut\needsnewlinetrue}
\newcommand\addressfont{%
  \fontsize{10.5pt}{12.8pt}\selectfont\slshape%
  \color[rgb]{.2,.2,.2}%
}
\newlength\addressheight
\renewcommand\maketitle{{%
  \addressfont%
  \newsavebox\addressbox%
  \savebox\addressbox{%
    \parbox[b]{.4\textwidth}{%
      \raggedleft%
      \needsnewlinefalse%
      \if\cvaddress\empty\else\newlineif\cvaddress\fi%
      \if\cvphone\empty\else\newlineif\cvphone\fi%
      \if\cvmobile\empty\else\newlineif\cvmobile\fi%
      \if\cvemail\empty\else\newlineif\cvemail\fi%
    }%
  }%
  \settoheight\addressheight{\usebox\addressbox}%
  \parbox[b][\addressheight]{.6\textwidth}{%
    \color{maintitle}\normalfont%
    \if\cvnametitle\empty\else{ }{\fontsize{21.3pt}{24pt}\selectfont\cvnametitle}\par\vfill\fi%
    \smash{\fontsize{32pt}{36pt}\selectfont\cvfirstname{ }\cvfamilyname}%
  }%
  \usebox\addressbox%
  \vskip-1pt%
  \parbox[b]{.6\textwidth}{%
    \makeatletter%
    \if\@subtitle\empty~\else\itshape\color{maintitle}\fontsize{21.3pt}{24pt}\selectfont\smash{\@subtitle}\fi%
    \makeatother%
  }%
  \parbox[b]{.4\textwidth}{%
    \addressfont%
    \raggedleft%
    \needsnewlinefalse%
    \if\cvgithub\empty\else\newlineif\cvgithub\fi%
    \if\cvlinkedin\empty\else\newlineif\cvlinkedin\fi%
    \if\cvorcid\empty\else\newlineif\cvorcid\fi%
    \if\cvhomepage\empty\else\newlineif\cvhomepage\fi%
  }%
  \vspace{10pt plus 10pt minus 4pt}%
}}


% Show skill level as a slider with 5 possible integer levels (0-4)
% (non-integer levels are also possible).
\definecolor{levelfill}{rgb}{0.2,0.35,.62}
\RequirePackage{tikz}
\newcommand\level[1]{\begin{tikzpicture}
  \fill[color=levelfill] (0,0) rectangle (#1*0.75em,1ex);
  \draw[color=textgray] (0,0) rectangle (3em,1ex);
\end{tikzpicture}}
% Use \litem to indicate you level in a list: e.g. \litem{3}
\newcommand\litem[1]{\item[\level{#1}]}
% Use litemize environment instead of itemize for correct spacing when using \litem.
\newlist{litemize}{itemize}{1}
\setlist[litemize]{labelwidth=3em, labelindent=0.75em, labelsep=0.75em, leftmargin=4.5em, itemsep=.1ex}
