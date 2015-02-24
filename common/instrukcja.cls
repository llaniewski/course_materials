\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myclass}[2011/12/23 My Class]

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

\setlength{\parindent}{0pt}
\topmargin  -15mm
\oddsidemargin  -10mm
\textwidth  250mm
\textheight 167mm
\columnwidth 100mm
\frenchspacing
\sloppy
\setlength{\columnsep}{10mm}



%\global\let\@author\@empty
%\newcommand{\setauthor}[1]{\def\@author{#1}}
%\let\author\setauthor %
%\newcommand{\show@author}{\@author}

\fancyhead{}
\rhead{\begin{tabular}{r} Creative Commons License:\\ Attribution Share Alike\end{tabular}\raisebox{-0.3\height}{\includegraphics[height=0.7cm]{cc_cc_30}\includegraphics[height=0.7cm]{cc_by_30}\includegraphics[height=0.7cm]{cc_sa_30}}}
\chead{\LARGE\sc Info III: Lab \labnumber}
\lhead{\begin{tabular}{rl}Autor:&{\it\@author}\\{\it\autortwo}&\end{tabular}}
\rfoot{\thepage}
\cfoot{}
\lfoot{\it Wydział Mechaniczny Energetyki i Lotnictwa, Politechnika Warszawska}
\twocolumn
\pagestyle{fancy}
\newcommand{\red}{\color{Red}}
\newcommand{\green}{\color{Green}}
\newcommand{\blue}{\color{Blue}}
\newcommand{\newtitle}{{\huge\begin{center}{\sc Informatyka III: Instrukcja \labnumber}\\{\it\mytitle}\end{center}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\autorone}{M. Dzikowski}
\newcommand{\autortwo}{}
\newcommand{\mytitle}{}
\newcommand{\labnumber}{1}

\endinput
