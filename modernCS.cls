\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modernCS}[2017/09/30 A modern cheat sheet class for LaTeX]

\LoadClass{article} % builds on standard article

% Load all packages
\RequirePackage{multicol} % multiple column layout
\RequirePackage{etoolbox} % certain hooks like AtBeginDocument
\RequirePackage{geometry} % paper size, orientation, margins, etc.
\RequirePackage[usenames, dvipsnames]{xcolor} % better color support
\RequirePackage{titlesec} % change default styling of (sub)(sub)sections
\RequirePackage{titling} % commands like \theauthor, \thetitle
\RequirePackage{enumitem} % global spacing options for itemize and enumerate
\RequirePackage{fontawesome} % cool icons for web, twitter, github below title
\RequirePackage[hidelinks]{hyperref} % make fontawesome icons into links / buttons
\RequirePackage{mdframed} % used for framed boxes like the definition box
\RequirePackage{empheq}
\RequirePackage[most]{tcolorbox}
\tcbset{highlight math style={boxsep=1mm,colback=gray!10, boxrule=0.5pt}}

% Handle Class options
% Paper orientation (lanscape vs. portrait)
\newcommand{\theorientation}{landscape}
\DeclareOption{landscape}{\renewcommand{\theorientation}{landscape}}
\DeclareOption{portrait}{\renewcommand{\theorientation}{portrait}}
% Color scheme
\newcommand{\seccolor}{RoyalPurple}
\newcommand{\subseccolor}{Cerulean}
\newcommand{\subsubseccolor}{BlueGreen}
\DeclareOption{blue}{
  \renewcommand{\seccolor}{RoyalPurple}
  \renewcommand{\subseccolor}{Cerulean}
  \renewcommand{\subsubseccolor}{BlueGreen}
  }
\DeclareOption{green}{
  \renewcommand{\seccolor}{OliveGreen}
  \renewcommand{\subseccolor}{PineGreen}
  \renewcommand{\subsubseccolor}{LimeGreen}
  }
\DeclareOption{red}{
  \renewcommand{\seccolor}{BrickRed}
  \renewcommand{\subseccolor}{Orange}
  \renewcommand{\subsubseccolor}{Dandelion}
  }
\DeclareOption{mono}{
  \renewcommand{\seccolor}{black}
  \renewcommand{\subseccolor}{black!65}
  \renewcommand{\subsubseccolor}{gray!80}
  }
\ProcessOptions\relax

% Set layout options
\geometry{a4paper, \theorientation, margin=0.25in}
\pagestyle{empty} % no page numbers
\setlength{\parindent}{0pt} % no indent after new lines

% Set global spacing option for framed boxes made with mdframed package
\mdfsetup{skipabove=5pt,skipbelow=5pt}

% Reduce spacing for itemize and enumerate
\setitemize{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\setenumerate{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

% Color box for sections, subsections, and subsubsections
\newcommand{\colorsection}[2]{
	\colorbox{#1}{\parbox{\dimexpr\columnwidth-2\fboxsep}{\centering \strut #2}}
}

% Redefine section to use fancy color box
\titleformat{name=\section}[block]
{\sffamily\large\bfseries\color{white}} % font
{}
{0pt}
{\colorsection{\seccolor}} % background color
\titlespacing*{\section}{-3pt}{\baselineskip}{-\baselineskip}

% Redefine subsection to use fancy color box
\titleformat{name=\subsection}[block]
{\sffamily\large\bfseries\color{white}} % font
{}
{0pt}
{\colorsection{\subseccolor}} % background color
\titlespacing*{\subsection}{-3pt}{\baselineskip}{-\baselineskip}

% Redefine subsubsection to use fancy color box
\titleformat{name=\subsubsection}[block]
{\sffamily\large\bfseries\color{white}} % font
{}
{0pt}
{\colorsection{\subsubseccolor}} % background color
\titlespacing*{\subsubsection}{-3pt}{\baselineskip}{-\baselineskip}

% Setup multiple columns for classic cheat sheet layout
\AtBeginDocument{\begin{multicols*}{3}}
\AtEndEnvironment{document}{\end{multicols*}}

% Custom box for text definitions
\newcommand*{\defbox}[2]{
	\begin{mdframed}[backgroundcolor=gray!10]
		\textbf{#1:} #2
	\end{mdframed}
}

% Custom box for important equations
\newcommand*{\impeq}[1]{
	\begin{empheq}[box=\tcbhighmath]{equation*}
		#1
	\end{empheq}
}

% Some custom commands for the title section
% Subtitle
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
% Institution
\newcommand*{\institution}[1]{\gdef\@institution{#1}}
% Website
\newcommand*{\website}[1]{\gdef\@website{\href{#1}{\faicon{globe}}}}
% Twiter
\newcommand*{\twitter}[1]{\gdef\@twitter{\href{#1}{\faicon{twitter}}}}
% GitHub
\newcommand*{\github}[1]{\gdef\@github{\href{#1}{\faicon{github}}}}

% Customize title section
\renewcommand{\maketitle}{
	\colorsection{gray!0}{ % white background
  		{\huge\thetitle} \\
  		% Only do something if user has defined field in his document
      \@ifundefined{@subtitle}{}{{\Large \@subtitle}}
      \par
  		\@ifundefined{@website}{}{\@website}
  		\@ifundefined{@twitter}{}{\@twitter}
  		\@ifundefined{@github}{}{\@github}
  		\par
  		\@ifundefined{@author}{}{{\footnotesize by \theauthor}} \par
  		\@ifundefined{@institution}{}{{\footnotesize \@institution}} \par
  		{\footnotesize\thedate}
  	}
}

\endinput