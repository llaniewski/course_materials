\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{instrukcja}[2011/12/23 Instrukcja dla C-CFD]

%% Article options
\DeclareOption{10pt}{
   \PassOptionsToClass{\CurrentOption}{article}
}


%% Custom package options
\DeclareOption{sansserif}{
   \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
   \PassOptionsToPackage{\CurrentOption}{paxcommands}
}

%% Fallback
\DeclareOption*{
   \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{10pt}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass[a4paper,landscape]{article}


\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{multirow}
\RequirePackage{color}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{ulem}
\RequirePackage{xinttools}
\RequirePackage{amsmath}

\setlength{\parindent}{0pt}
\topmargin  -15mm
\oddsidemargin  -10mm
\textwidth  250mm
\textheight 167mm
\columnwidth 100mm
\frenchspacing
\sloppy
\setlength{\columnsep}{10mm}



\global\let\@author\@empty
\global\let\@authorSep\@empty
\newcommand{\setauthor}[1]{\edef\@author{\@author\@authorSep#1}\def\@authorSep{,}}
\let\author\setauthor %
\newcommand{\show@author}{\@author}
\newcommand{\show@authors}{%
  \begin{tabular}{rl}Autor:%
   \xintFor ##1 in {\@author} \do{ & ##1 \\ }%
  \end{tabular}%
}

\global\let\@course\@empty
\global\let\@courseShort\@empty
\newcommand{\setcourse}[2][aaa]{\def\@courseShort{#1}\def\@course{#2}}
\let\course\setcourse %
\newcommand{\show@course}{\@course}
\newcommand{\show@courseShort}{\@courseShort}

\global\let\@material\@empty
\global\let\@materialShort\@empty
\newcommand{\setmaterial}[2][aaa]{\def\@materialShort{#1}\def\@material{#2}}
\let\material\setmaterial %
\newcommand{\show@material}{\@material}
\newcommand{\show@materialShort}{\@materialShort}

\global\let\@materialnumber\@empty
\newcommand{\setmaterialnumber}[1]{\def\@materialnumber{#1}}
\let\materialnumber\setmaterialnumber %
\newcommand{\show@materialnumber}{\@materialnumber}

\fancyhead{}
\rhead{\begin{tabular}{r} Creative Commons License:\\ Attribution Share Alike\end{tabular}\raisebox{-0.3\height}{\includegraphics[height=0.7cm]{cc_cc_30}\includegraphics[height=0.7cm]{cc_by_30}\includegraphics[height=0.7cm]{cc_sa_30}}}
\chead{\LARGE\sc \@courseShort: \@materialShort}
\lhead{\show@authors}
\rfoot{\thepage}
\cfoot{}
\lfoot{\it Wydzia\l{} Mechaniczny Energetyki i Lotnictwa, Politechnika Warszawska}
\twocolumn
\pagestyle{fancy}
\newcommand{\red}{\color{Red}}
\newcommand{\green}{\color{Green}}
\newcommand{\blue}{\color{Blue}}

\newcommand{\materialtitle}{{\huge\begin{center}{\sc \@course: \@material}\\{\it\mytitle}\end{center}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\autorone}{M. Dzikowski}
\newcommand{\autortwo}{}
\newcommand{\mytitle}{}
\newcommand{\labnumber}{1}

\newtheorem{zad}{Zadanie}
\newcommand{\gray}{\color{Gray}}

\newcommand{\R}{\mathds{R}}
\newcommand{\pr}[1]{\frac{\partial}{\partial #1}}
\newcommand{\rr}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\ppr}[1]{\frac{\partial^2}{\partial #1^2}}
\newcommand{\prr}[2]{\frac{\partial^2}{\partial #1\partial #2}}
\newcommand{\rpr}[2]{\frac{\partial^2 #1}{\partial #2^2}}
\newcommand{\rrr}[3]{\frac{\partial^2 #1}{\partial #2\partial #3}}


\endinput
