% Title:		    modernCS
% Author: 		  	Jan Guggenbuehler
% Description:		A modern cheat sheet class
%               	for beautiful cheat sheets made with LaTeX
% Date:			    2017-9-30

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modernCS}[2017/09/30 A modern cheat sheet class for LaTeX]

\LoadClass{article} % builds on standard article

% Load all packages
\RequirePackage{multicol} % multiple column layout
\RequirePackage{etoolbox} % certain hooks like AtBeginDocument
\RequirePackage{geometry} % paper size, orientation, margins, etc.
\RequirePackage[dvipsnames]{xcolor} % better color support
\RequirePackage{titlesec} % change default styling of (sub)(sub)sections
\RequirePackage{titling} % commands like \theauthor, \thetitle
\RequirePackage{enumitem} % global spacing options for itemize and enumerate
\RequirePackage{fontawesome} % cool icons for web, twitter, github below title
\RequirePackage[hidelinks]{hyperref} % make fontawesome icons into links / buttons
\RequirePackage{mdframed} % used for framed boxes like the definition box
\RequirePackage{empheq}
\RequirePackage[most]{tcolorbox}
\tcbset{highlight math style={boxsep=1mm,colback=blue!10, boxrule=0.5pt}}

% Set layout options
\geometry{a4paper, landscape, margin=0.25in}
\pagestyle{empty} % no page numbers
\setlength{\parindent}{0pt} % no indent after new lines

% Set global spacing option for framed boxes made with mdframed package
\mdfsetup{skipabove=5pt,skipbelow=5pt}

% Reduce spacing for itemize and enumerate
\setitemize{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\setenumerate{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

% % Customize various spacing options
% % Reduce spacing for tabular
% \AtBeginEnvironment{tabular}{\vspace*{-0.1cm}}
% \AtEndEnvironment{tabular}{\vspace*{-0.4cm}}
% % Reduce spacing for listing
% \AtBeginEnvironment{lstlisting}{\vspace*{-0.1cm}}
% \AtEndEnvironment{lstlisting}{\vspace*{-0.1cm}}
% % Reduce spacing for align
% \AtBeginEnvironment{align}{\vspace*{-0.1cm}}
% \AtEndEnvironment{align}{\vspace*{-0.4cm}}
% % Reduce spacing for align*
% \AtBeginEnvironment{align*}{\vspace*{-0.1cm}}
% \AtEndEnvironment{align*}{\vspace*{-0.4cm}}
% % Reduce spacing for equation
% \AtBeginEnvironment{equation}{\vspace*{-0.1cm}}
% \AtEndEnvironment{equation}{\vspace*{-0.4cm}}
% % Reduce spacing for equation*
% \AtBeginEnvironment{equation*}{\vspace*{-0.1cm}}
% \AtEndEnvironment{equation*}{\vspace*{-0.4cm}}

% Color box for sections, subsections, and subsubsections
\newcommand{\colorsection}[2]{
	\colorbox{#1}{\parbox{\dimexpr\columnwidth-2\fboxsep}{\centering \strut #2}}
}

% Redefine section to use fancy color box
\titleformat{name=\section}[block]
{\sffamily\large\bfseries\color{white}} % font
{}
{0pt}
{\colorsection{RoyalPurple}} % background color
\titlespacing*{\section}{-3pt}{\baselineskip}{-\baselineskip}

% Redefine subsection to use fancy color box
\titleformat{name=\subsection}[block]
{\sffamily\large\bfseries\color{white}} % font
{}
{0pt}
{\colorsection{Cerulean}} % background color
\titlespacing*{\subsection}{-3pt}{\baselineskip}{-\baselineskip}

% Redefine subsubsection to use fancy color box
\titleformat{name=\subsubsection}[block]
{\sffamily\large\bfseries\color{white}} % font
{}
{0pt}
{\colorsection{BlueGreen}} % background color
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
% Email
\newcommand*{\email}[1]{\gdef\@email{\href{mailto:#1}{\faicon{envelope}}}}
% Donate to author of cheat sheet
\newcommand*{\donate}[1]{\gdef\@donate{\href{#1}{\faicon{cc-paypal}}}}
% Edit Cheat Sheet Link
\newcommand*{\editsheet}[1]{\gdef\@editsheet{\href{#1}{\faicon{pencil}}}}



% Customize title section
\renewcommand{\maketitle}{
	\colorsection{gray!0}{ % white background
  		{\huge\thetitle} \\
  		% Only do something if user has defined field in his document
      \@ifundefined{@subtitle}{}{{\Large \@subtitle}} \par
  		\@ifundefined{@website}{}{\@website}
  		\@ifundefined{@twitter}{}{\@twitter}
  		\@ifundefined{@github}{}{\@github}
  		\@ifundefined{@email}{}{\@email}
  		\@ifundefined{@donate}{}{\@donate}
  		\@ifundefined{@editsheet}{}{\@editsheet} \par
  		\@ifundefined{@author}{}{{\footnotesize by \theauthor}} \par
  		\@ifundefined{@institution}{}{{\footnotesize \@institution}} \par
  		{\footnotesize\thedate}
  	}
}

\endinput