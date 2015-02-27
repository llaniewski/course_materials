\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{instrukcja}[2011/12/23 My Class]

%%%%% INSTRUKCJA %%%%%%%%%%%%%%%%%%%%%%

%% Article options
\DeclareOption{10pt}{
   \PassOptionsToClass{\CurrentOption}{article}
}

%% Language definitions

\global\let\@textauthor\@empty
\def\@textauthor{Autor}
\global\let\@textinstruction\@empty
\def\@textinstruction{Instrukcja}
\global\let\@faculty\@empty
\def\@faculty{Wydzia\l{} Mechaniczny Energetyki i Lotnictwa, Politechnika Warszawska}

%% Babel options and language definitions

\DeclareOption{polish}{
   \PassOptionsToPackage{\CurrentOption}{babel}
}

\DeclareOption{english}{
   \PassOptionsToPackage{\CurrentOption}{babel}
   \def\@textauthor{Author}
   \def\@textinstruction{Instruction}
   \def\@faculty{Faculty of Power and Aeronautical Engineering}
}

%% Fallback

\DeclareOption*{
   \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Process given options
\ProcessOptions\relax

%% Load base class
\LoadClass[landscape]{article}

%% Load packages
\RequirePackage{babel}
\RequirePackage{amsmath}
%\RequirePackage{dsfont}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{multirow}
\RequirePackage{color}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{ulem}

%% Geometry and polish spacing
\setlength{\parindent}{0pt}
\topmargin  -15mm
\oddsidemargin  -10mm
\textwidth  250mm
\textheight 167mm
\columnwidth 100mm
\frenchspacing
\sloppy
\setlength{\columnsep}{10mm}

%% Second author
\global\let\@secondauthor\@empty
\newcommand{\secondauthor}[1]{\def\@secondauthor{#1}}

%% Course name and acronim
\global\let\@course\@empty
\global\let\@shortcourse\@empty
\newcommand{\course}[2][]{\def\@course{#2}\def\@shortcourse{#1}}

%% Order number of the laboratory instruction
\global\let\@labnumber\@empty
\newcommand{\lab}[1]{\def\@labnumber{#1}}

%% Secondary title
\global\let\@title\@empty

%% Header and footer
\fancyhead{}
\rhead{\begin{tabular}{r} Creative Commons License:\\ Attribution Share Alike\end{tabular}\raisebox{-0.3\height}{\includegraphics[height=0.7cm]{cc_cc_30}\includegraphics[height=0.7cm]{cc_by_30}\includegraphics[height=0.7cm]{cc_sa_30}}}
\chead{\LARGE\sc \@shortcourse: Lab \@labnumber}
\lhead{\raisebox{-0.3\height}{\includegraphics[height=0.7cm]{ccfd3}}\begin{tabular}{rl}\@textauthor{}:&{\it\@author}\\&{\it\@secondauthor}\end{tabular}}
\rfoot{\thepage}
\cfoot{}
\lfoot{\it \@faculty{}}
\twocolumn
\pagestyle{fancy}

%% Additional shortcuts
\newcommand{\red}{\color{Red}}
\newcommand{\green}{\color{Green}}
\newcommand{\blue}{\color{Blue}}

\newcommand{\R}{\mathds{R}}
\newcommand{\pr}[1]{\frac{\partial}{\partial #1}}
\newcommand{\rr}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\ppr}[1]{\frac{\partial^2}{\partial #1^2}}
\newcommand{\prr}[2]{\frac{\partial^2}{\partial #1\partial #2}}
\newcommand{\rpr}[2]{\frac{\partial^2 #1}{\partial #2^2}}
\newcommand{\rrr}[3]{\frac{\partial^2 #1}{\partial #2\partial #3}}


%% Title header
\renewcommand{\maketitle}{{\huge\begin{center}{\sc \@course: \@textinstruction{} \@labnumber}\\{\it\@title}\end{center}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
