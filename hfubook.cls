% Licence:  Creative Commons Attribution (CC BY 4.0)
% Author: Tim Träris (2022)
% Author: Valentin Weber (2023)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hfubook}

\LoadClass[
    fontsize=12pt,          % default font size 12pt
    numbers=noenddot,       % remove dots behind chapter numbers (e.g. 1.5 not 1.5.)
    listof=totoc,           % add list of figures, tables, etc. to ToC
    listof=entryprefix,     % add entry name to figures, tables, etc.
    listof=nochaptergap,    % no chapter gap for figures, tables, etc.
    bibliography=totoc,     % add bibliography to ToC but without a chapter number
    parskip=half            % half line spacing between paragraphs
]{scrbook}


% ##################################################
% MULTILANGUAGESUPPORT
% ##################################################
\DeclareOption{english}{\def\english}
\ProcessOptions\relax
\ifx\english\undefined
    \RequirePackage[ngerman]{babel}
\fi

% ##################################################
% ENCODING
% ##################################################
\RequirePackage{cmap}               % PDF character encoding
\RequirePackage[T1]{fontenc}        % 8-bit font encoding
\RequirePackage[utf8]{inputenc}     % UTF-8 input encoding


% ##################################################
% GENERAL
% ##################################################
\RequirePackage{scrhack}            % better KOMA adaptions
\RequirePackage[table]{xcolor}      % color support
\RequirePackage{chngcntr}           % for renumbering stuff

\def\@matriculationnumber{}
\newcommand{\matriculationnumber}[1]{\def\@matriculationnumber{#1}}
\def\@studyprogram{}
\newcommand{\studyprogram}[1]{\def\@studyprogram{#1}}
\def\@streetname{}
\newcommand{\streetname}[1]{\def\@streetname{#1}}
\def\@postalcode{}
\newcommand{\postalcode}[1]{\def\@postalcode{#1}}
\def\@city{}
\newcommand{\city}[1]{\def\@city{#1}}
\def\@email{}
\newcommand{\email}[1]{\def\@email{#1}}
\def\@type{}
\newcommand{\type}[1]{\def\@type{#1}}
\def\@supervisor{}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\def\@cosupervisor{}
\newcommand{\cosupervisor}[1]{\def\@cosupervisor{#1}}
\def\@deadline{}
\newcommand{\deadline}[1]{\def\@deadline{#1}}


% ##################################################
% PDF SETTINGS
% ##################################################
\RequirePackage[
    colorlinks=false,
   	linkcolor=black,
   	citecolor=black,
  	filecolor=black,
	urlcolor=black,
    bookmarks=true,
    bookmarksopen=true,
    bookmarksopenlevel=3,
    bookmarksnumbered,
    plainpages=false,
    pdfpagelabels=true,
    hyperfootnotes
]{hyperref}


% ##################################################
% FONTS AND SPACING
% ##################################################
\renewcommand{\familydefault}{\sfdefault}   % default font
\RequirePackage[onehalfspacing]{setspace}       % default 1.5 spacing
\raggedbottom   % don't stretch spacing to fit page length

% font sizes and styles
\addtokomafont{chapter}{\sffamily\large\bfseries} 
\addtokomafont{section}{\sffamily\normalsize\bfseries} 
\addtokomafont{subsection}{\sffamily\normalsize\mdseries}
\addtokomafont{caption}{\sffamily\normalsize\mdseries}

% url font style
\RequirePackage{relsize}
\renewcommand*{\UrlFont}{\ttfamily\smaller\relax}


% ##################################################
% PAGE FORMATTING
% ##################################################
% Page layout
\RequirePackage[
	bindingoffset=1.5cm,
	inner=2.5cm,
	outer=2.5cm,
	top=3cm,
	bottom=2cm
]{geometry}

% Page header
\RequirePackage[
    headsepline,        % seperator line beneath page header on normal pages
    plainheadsepline    % seperator line beneath page header on pages like ToC
]{scrlayer-scrpage}
\clearpairofpagestyles                  % clear default settings
\addtokomafont{pagehead}{\normalfont}   % use normal font for page header
\ohead*{\thepage}                       % page number
\ihead*{\leftmark}                      % chapter name


% ##################################################
% TITLEPAGE
% ##################################################
\renewcommand{\HyOrg@maketitle}{
\pagestyle{empty}

% HFU Logo
\begin{flushright}
    \begin{figure}[ht]
        \flushright
        \includegraphics[height=2cm]{pictures/hfu_logo_vector_4C.eps}
    \end{figure}
\end{flushright}

\begin{center}
    {\fontsize{18}{22} \selectfont \@type}\\[5mm]
    \ifx\english\undefined
        {\fontsize{18}{22} \selectfont in} \\[5mm]
    \else
        {\fontsize{18}{22} \selectfont in the field of} \\[5mm]
    \fi
    {\fontsize{18}{22} \selectfont \@studyprogram}\\
    
    \vspace{1cm}
    
    {\fontsize{22}{26} \selectfont \textbf{\@title}}\\[5mm]
    {\fontsize{18}{22} \selectfont \@subtitle}

    \vspace{6cm}
        
    \ifx\english\undefined
        \begin{tabular}{ll}
            Referent:           & \@supervisor    \\\\
            Koreferent:         & \@cosupervisor  \\\\	
            Vorgelegt~am:       & \@date          \\\\
            Vorgelegt~von:      & \@author        \\
            Matrikelnummer:     & \@matriculationnumber\\
    		            		& \@streetname,~\@postalcode~\@city\\
    			            	& \@email
        \end{tabular}
    \else
        \begin{tabular}{ll}
            supervised~by:        & \@supervisor    \\\\
            cosupervised~by:      & \@cosupervisor  \\\\	
            submitted~on:         & \@date          \\\\
            submitted~by:         & \@author        \\
            matriculation~number: & \@matriculationnumber\\
    		            		  & \@streetname,~\@postalcode~\@city\\
    			            	  & \@email
        \end{tabular}
    \fi
\end{center}
}



% ##################################################
% IMAGES AND FIGURES
% ##################################################
\RequirePackage{graphicx}       % support for including images
\graphicspath{{pictures/}}  % default path

% simple numbering without chapter
\renewcommand{\thefigure}{\arabic{figure}}
\counterwithout{figure}{chapter}


% ##################################################
% TABLES
% ##################################################
\RequirePackage{booktabs}   % beautiful table style
\RequirePackage{multirow}   % multi row and multi column table functionality

% simple numbering without chapter
\renewcommand{\thetable}{\arabic{table}}
\counterwithout{table}{chapter}

% ##################################################
% SOURCE CODE LISTINGS
% ##################################################
\RequirePackage{listings}
\RequirePackage{beramono}   % use a typewriter font which supports bold characters

\ifx\english\undefined
    \renewcommand{\lstlistlistingname}{Verzeichnis der Code Listings}   % 
\else
    \renewcommand{\lstlistlistingname}{List of Code Listings}   % 
\fi
\renewcommand{\lstlistingname}{Code Listing}
\newcommand{\listoflolentryname}{\lstlistingname}   % prefix for List of Code Listings

% define colors for source code highlighting
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.5,0,0.33}
\definecolor{codepurblue}{rgb}{0.16,0.0,1.0}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% set source code style
\lstdefinestyle{codestyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\bfseries\color{codepurple},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurblue},
    basicstyle=\scriptsize\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    escapeinside={(*@}{@*)}
}
\lstset{style=codestyle, numberbychapter=false}


% ##################################################
% TABLE OF CONTENTS
% ##################################################
\KOMAoptions{toc=chapterentrydotfill}       % dotted lines for chapters
\addtokomafont{chapterentry}{\normalfont}   % use normal font for chapter entries
\setuptoc{toc}{totoc}                       % add ToC to ToC

% spacing
\DeclareTOCStyleEntry[beforeskip=0cm]{chapter}{chapter}
\DeclareTOCStyleEntry[beforeskip=0cm]{section}{section}
\DeclareTOCStyleEntry[beforeskip=0cm]{default}{subsection}

% colons after entry names
\BeforeStartingTOC[lof]{\def\autodot{:}}
\BeforeStartingTOC[lot]{\def\autodot{:}}
\BeforeStartingTOC[lol]{\def\autodot{:}}


% ##################################################
% BIBLIOGRAPHY
% ##################################################
\RequirePackage{csquotes}
\RequirePackage[backend=biber,citestyle=ieee]{biblatex}
\addbibresource{bibtex.bib}
\setlength\bibitemsep{.5\baselineskip}
\setcounter{biburlnumpenalty}{9000} % break URLs on numbers
\setcounter{biburllcpenalty}{9000}  % break URLs on lower case letters
\setcounter{biburlucpenalty}{9000}  % break URLs on upper case letters


% ##################################################
% ABBREVIATIONS
% ##################################################
\RequirePackage[printonlyused]{acronym}


% ##################################################
% APPENDIX
% ##################################################
\RequirePackage[title,titletoc]{appendix}

% appendix chapter
\newcommand{\appendixchapter}[1]{
    \cleardoublepage
    \pagenumbering{arabic}
    \renewcommand{\thepage}{\thechapter-\arabic{page}}
    \chapter{#1}
}

% insert monthly report pdf as picture in order to keep page header
\newcommand{\monthlyreport}[2]{
    \section{#1}
    \centering
    \includegraphics[trim=55 35 55 35,clip,width=1\textwidth]{#2}
    \clearpage
}


% ##################################################
% Eidesstattliche Erklärung
% ##################################################
\newcommand{\eidesstattlicheerkaerung}{%
\chapter*{Eidesstattliche Erklärung\markboth{Eidesstattliche Erklärung}{}}
\addcontentsline{toc}{chapter}{Eidesstattliche Erklärung}

\makeatletter

Ich versichere, dass ich die vorstehende Arbeit selbstständig verfasst und hierzu keine anderen als die angegebenen Hilfsmittel verwendet habe. Alle Stellen der Arbeit die wörtlich oder sinngemäß aus fremden Quellen entnommen wurden, sind als solche kenntlich gemacht.\par
\vspace{.5cm}
Die Arbeit wurde bisher in gleicher oder ähnlicher Form in keinem anderen Studiengang als Prüfungsleistung vorgelegt oder an anderer Stelle veröffentlicht.\par
\vspace{.5cm}
Ich bin mir bewusst, dass eine falsche Erklärung rechtliche Folgen haben kann.

\vspace*{1.5cm} \par
\line(1,0){200} \par
\@city, \@date ~~\@author
\makeatother
}

\newcommand{\abbrtitle}{%
\ifx\english\undefined
    \chapter*{Abkürzungsverzeichnis\markboth{Abkürzungsverzeichnis}}%
    \addcontentsline{toc}{chapter}{Abkürzungsverzeichnis}%
\else
    \chapter*{List of Abbreviations\markboth{List of Abbreviations}}%
    \addcontentsline{toc}{chapter}{List of Abbreviations}%
\fi
}

% ##################################################
% MISC
% ##################################################
% better referencing of images, tables, etc.
\RequirePackage[nameinlink, noabbrev]{cleveref} 
