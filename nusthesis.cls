% LaTeX format for theses at NUS
% Based on General Guidelines on Format of Research Thesis Submitted For Examination, April 2013
% https://share.nus.edu.sg/registrar/student/info/General-Guidelines-on-Format-of-Research-Thesis-Submitted-For-Examination.pdf

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nusthesis}[2013/06/07 Thesis Format for National University of Singapore by Li Bowen]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class and Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load Base Class -- Book
\PassOptionsToClass{a4paper}{book}
\PassOptionsToClass{12pt}{book}
\PassOptionsToClass{twoside}{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}
%Packages
\RequirePackage{color,graphicx}
\PassOptionsToPackage{hyphens}{url} % Force line break in url, url is loaded internally by hyperref
\RequirePackage[colorlinks=true,linkcolor=black,plainpages=false,hyperfootnotes=false,hypertexnames=false]{hyperref}
\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage{acronym}
\RequirePackage[top=1in, bottom=1in, left=1.5in, right=1.5in]{geometry}
\RequirePackage{setspace}
\RequirePackage{appendix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Double Line Spacing
\onehalfspacing
%Plain Page Style
\pagestyle{plain}
%Labels Declaration
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Define Inputs
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\submityear#1{\gdef\@submityear{\number\year}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}
\def\keywords#1{\gdef\@keywords{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Renewed Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Title Page
\renewcommand{\titlepage}{
\thispagestyle{empty}
\begin{center}\hyphenpenalty=10000
\Large\bfseries\uppercase\expandafter{\@title}\\
\normalsize\mdseries\uppercase\expandafter{\@subtitle}
\end{center}\vfill
\titlepagebody
\vfill
\begin{center}\hyphenpenalty=10000
  \normalsize \titlepagefooter
\end{center}\newpage}

% Title (Cover and Title)
\renewcommand{\maketitle}{
  \coverpage
  \titlepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% New Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Coverpage
\newcommand{\coverpage}{
  \thispagestyle{empty}\vspace*{0.4in}
  \begin{center}\hyphenpenalty=10000
    \Large\bfseries\uppercase\expandafter{\@title}\\
    % \large\mdseries\uppercase\expandafter{\@subtitle}
  \end{center}\vfill
  \begin{center}\hyphenpenalty=10000
    \Large\bfseries\uppercase\expandafter{\@author}
  \end{center}\vfill
  \begin{center}\hyphenpenalty=10000
    \Large\bfseries
    \uppercase\expandafter{\@university}\vspace*{0.5cm} \\
    \Large\uppercase\expandafter{\@submityear}
  \end{center}\newpage}

% Chapfont
\newcommand{\chapfont}[1]{
  \noindent\textbf{\nohang\begin{Huge}#1\end{Huge}}\vspace*{1cm}\\}

% Declaration
\newcommand{\declaration}[1]{
  \begin{center}\chapfont{Declaration}\end{center}
  \begin{large}#1 \vspace{1cm} \\
  \begin{center}
    \line(1,0){250} \\
    \@author \\
    \today
  \end{center}\end{large}\newpage}


%Acknowledgment
\newcommand{\acknowledgment}[1]{
\chapfont{Acknowledgment}#1\vfill
\begin{flushright}\today\end{flushright}\newpage}

%Title Page Body
\@ifundefined{titlepagebody}{
\newcommand{\titlepagebody}{
\begin{center}\hyphenpenalty=10000
\Large\uppercase\expandafter{\@author}\\ \textit{\expandafter{\@prevdegrees}}
\end{center}}}{}

%Title Page Footer
\@ifundefined{titlepagefooter}{
  \newcommand{\titlepagefooter}{
      \Large\uppercase{A Thesis submitted \vspace*{0.5cm}\\ for the Degree of \uppercase\expandafter{\@degree}\vspace*{0.5cm} \\\uppercase\expandafter{\@department}\vspace*{0.5cm}\\ \uppercase\expandafter{\@university}\vspace*{0.5cm} \\\number\year}}}{}

%Abstract
\@ifundefined{abstract}{
\newcommand{\abstract}[1]{
\noindent \hspace*{-0.3cm}
\begin{tabular}{lcp{9cm}}
Name & : & \expandafter{\@author} \\
Degree & : & \expandafter{\@degree} \\
\@ifundefined{@nusstrict}{Supervisor(s) & : & \expandafter{\@supervisor} \\}{}
Department & : & \expandafter{\@department} \\
Thesis Title & : & \expandafter{\@title} \\
& & \begin{minipage}{8cm}
\expandafter{\@subtitle}
\end{minipage}\end{tabular}\vspace*{2cm}\\
\noindent
\chapfont{Abstract}#1\vfill
\noindent \@ifundefined{@nusstrict}{\hspace*{-0.3cm}}{\hspace*{0.2cm}}
\begin{tabular}{lcp{9cm}}
Keywords \hspace*{0.3cm} & : & \expandafter{\@keywords}
\end{tabular}\vfill
\newpage}}{}

%Strict Compliant
\@ifundefined{@nusstrict}{}{
\chapternumberfont{\centering\mdseries\uppercase}
\chaptertitlefont{\centering\mdseries\uppercase}
\sectionfont{\raggedright}
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}
\renewcommand{\chapfont}[1]{{\nohang\centering\mdseries\begin{Huge}#1\end{Huge}\vspace*{1cm}\\}}
}