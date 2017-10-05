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
\RequirePackage{empheq} % used for colored equation box command
\RequirePackage[most]{tcolorbox} % used for colored equation box command
\tcbset{highlight math style={boxsep=1mm,colback=gray!10, boxrule=0.5pt}}

% Define color schemes
% Red
\definecolor{red1}{HTML}{B71C1C}
\definecolor{red2}{HTML}{E53935}
\definecolor{red3}{HTML}{E57373}
% Green
\definecolor{green1}{HTML}{1B5E20}
\definecolor{green2}{HTML}{43A047}
\definecolor{green3}{HTML}{81C784}
% Blue
\definecolor{blue1}{HTML}{0D47A1}
\definecolor{blue2}{HTML}{1E88E5}
\definecolor{blue3}{HTML}{64B5F6}
% Purple
\definecolor{purple1}{HTML}{4A148C}
\definecolor{purple2}{HTML}{8E24AA}
\definecolor{purple3}{HTML}{BA68C8}
% Autumn
\definecolor{autumn1}{HTML}{8C4646}
\definecolor{autumn2}{HTML}{D96459}
\definecolor{autumn3}{HTML}{F2AE72}
% Maritime
\definecolor{maritime1}{HTML}{00293C}
\definecolor{maritime2}{HTML}{1E656D}
\definecolor{maritime3}{HTML}{4D648D}
% Cosmopolitan
\definecolor{cosmopolitan1}{HTML}{8593AE}
\definecolor{cosmopolitan2}{HTML}{7E675E}
\definecolor{cosmopolitan3}{HTML}{DDA288}
% Nature
\definecolor{nature1}{HTML}{688B8A}
\definecolor{nature2}{HTML}{A0B084}
\definecolor{nature3}{HTML}{A57C65}
% Urban
\definecolor{urban1}{HTML}{232122}
\definecolor{urban2}{HTML}{A5C05B}
\definecolor{urban3}{HTML}{7BA4A8}
% Classy
\definecolor{classy1}{HTML}{36454F}
\definecolor{classy2}{HTML}{488A99}
\definecolor{classy3}{HTML}{DBAE58}

% Handle class options
% Pick page orientation (lanscape vs. portrait)
\newcommand{\theorientation}{landscape}
\DeclareOption{landscape}{\renewcommand{\theorientation}{landscape}}
\DeclareOption{portrait}{\renewcommand{\theorientation}{portrait}}
% Pick a color scheme
\newcommand{\seccolor}{maritime1}
\newcommand{\subseccolor}{maritime2}
\newcommand{\subsubseccolor}{maritime3}
\DeclareOption{blue}{
  \renewcommand{\seccolor}{RoyalPurple}
  \renewcommand{\subseccolor}{Cerulean}
  \renewcommand{\subsubseccolor}{BlueGreen}
  }
\DeclareOption{red}{
	\renewcommand{\seccolor}{red1}
	\renewcommand{\subseccolor}{red2}
	\renewcommand{\subsubseccolor}{red3}
}
\DeclareOption{green}{
	\renewcommand{\seccolor}{green1}
	\renewcommand{\subseccolor}{green2}
	\renewcommand{\subsubseccolor}{green3}
}
\DeclareOption{blue}{
	\renewcommand{\seccolor}{blue1}
	\renewcommand{\subseccolor}{blue2}
	\renewcommand{\subsubseccolor}{blue3}
}
\DeclareOption{purple}{
	\renewcommand{\seccolor}{purple1}
	\renewcommand{\subseccolor}{purple2}
	\renewcommand{\subsubseccolor}{purple3}
}
\DeclareOption{autumn}{
	\renewcommand{\seccolor}{autumn1}
	\renewcommand{\subseccolor}{autumn2}
	\renewcommand{\subsubseccolor}{autumn3}
}
\DeclareOption{vibrant}{
	\renewcommand{\seccolor}{vibrant1}
	\renewcommand{\subseccolor}{vibrant2}
	\renewcommand{\subsubseccolor}{vibrant3}
}
\DeclareOption{maritime}{
	\renewcommand{\seccolor}{maritime1}
	\renewcommand{\subseccolor}{maritime2}
	\renewcommand{\subsubseccolor}{maritime3}
}
\DeclareOption{cosmopolitan}{
	\renewcommand{\seccolor}{cosmopolitan1}
	\renewcommand{\subseccolor}{cosmopolitan2}
	\renewcommand{\subsubseccolor}{cosmopolitan3}
}
\DeclareOption{nature}{
	\renewcommand{\seccolor}{nature1}
	\renewcommand{\subseccolor}{nature2}
	\renewcommand{\subsubseccolor}{nature3}
}
\DeclareOption{urban}{
	\renewcommand{\seccolor}{urban1}
	\renewcommand{\subseccolor}{urban2}
	\renewcommand{\subsubseccolor}{urban3}
}
\DeclareOption{classy}{
	\renewcommand{\seccolor}{classy1}
	\renewcommand{\subseccolor}{classy2}
	\renewcommand{\subsubseccolor}{classy3}
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