% Author: Alberto Santini <a.santini@unibo.it>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{orbotech}[2015/05/08 Techincal Report Class for the OR Group at the University of Bologna]
\ProvidesFile{figures/bologna_strip.png}[2015/05/08 GNU FDL picture of Bologna]
\ProvidesFile{figures/twitter_logo.png}[2015/05/08 Twitter Logo]
\ProvidesFile{figures/unibo_logo.png}[2015/05/08 Logo of the university of Bologna]
\ProvidesFile{figures/or_logo.tex}[2015/05/08 TiKz Logo of the OR Group at the University of Bologna]

% Our class is based on the Standard LaTeX class "report"
\LoadClassWithOptions{report}

% We need titlesec for custom secion titles
\RequirePackage[medium]{titlesec}

% We need background to set the front page's background
\RequirePackage[all]{background}

% We need esopic to be able to place the background at the right place
\RequirePackage{eso-pic}

% We need parskip as we want to have 0-indent in paragraphs by default
\RequirePackage{parskip}

% We need tikz for some graphics, e.g. the OR Group logo
\RequirePackage{tikz}

% We use geometry to specify our pages' layout
\usepackage[top=3cm,bottom=3cm,left=3cm,right=3cm]{geometry}

% Use lmodern for all-caps fonts
\usepackage{lmodern}

% Use hyperref and color for links
\usepackage{color}
\usepackage[bookmarks=false,colorlinks=false]{hyperref}

% Check that all provided files actually exist:
\IfFileExists{figures/bologna_strip.png}{}{\ClassError{orbotech}{The picture of Bologna is missing!}{It should always be in figures/bologna\_strip.png}}
\IfFileExists{figures/twitter_logo.png}{}{\ClassError{orbotech}{The picture of Twitter's logo is missing!}{It should always be in figures/twitter\_logo.png}}
\IfFileExists{figures/unibo_logo.png}{}{\ClassError{orbotech}{The picture of DEI/Unibo's logo is missing!}{It should always be in figures/unibo\_logo.png}}

% Provides a command to set the tech report number (which is stored in \@reportnumber)
\newcommand{\@reportnumber}{000/0000}
\newcommand{\reportnumber}[1]{%
  \renewcommand{\@reportnumber}{#1}
}

% Sets the group name. It defaults to the wrong spelling "Operations Research" for consistency reasons.
% The correct spelling can be enabled with \usecorrectspelling
\newcommand{\@orgroupname}{Operations Research Group}
\newcommand{\usecorrectspelling}{%
  \renewcommand{\@orgroupname}{Operational Research Group}
}

% Clear the background
\SetBgContents{}

% Format chapter and section headers
\titleformat{\chapter}{\scshape\Huge}{\thechapter}{0.5em}{}
\titleformat{\section}{\scshape\Large\vspace{-0.3em}}{\thesection}{0.3em}{}[\titlerule]

% Things to do at the beginning of the document
\AtBeginDocument{%
  % ------------------------------------------------------------------------------------------------
  % 1. Set the command to draw the OR Group logo for page headers
  % ------------------------------------------------------------------------------------------------
  \definecolor{orblue}{rgb}{0.173,0.243,0.314}
  \newcommand{\ORlogo}{%
    \begin{tikzpicture}[overlay, remember picture, yshift=-6cm]
      \draw[thick, orblue] (0,0) -- (2,0) -- (1.479,2.954) -- (2.464,3.128) -- (3.015,0) -- (4,0) -- (4,5) -- (5,5) -- (5,0) -- (60,0);
      \node[orblue] at (15,1.5) {\Huge OR-Unibo - Technical Report \@reportnumber};
    \end{tikzpicture}
  }
  
  % ------------------------------------------------------------------------------------------------
  % 2. Set the command for the background picture
  % ------------------------------------------------------------------------------------------------
  \newcommand{\BolognaBackgroundPic}{%
    \put(0,0){%
      \parbox[b][\paperheight]{\paperwidth}{%
        % Original picture:
        % https://commons.wikimedia.org/wiki/File:Bologna-SanPetronioPiazzaMaggiore1.jpg
        % Distributed by the author under the GNU FDL v1.2 and Creative Commons Attribution-Share Alike 3.0
        \vfill\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{./figures/bologna_strip.png}
      }
    }
  }
  
  % ------------------------------------------------------------------------------------------------
  % 3. Make the title page
  % ------------------------------------------------------------------------------------------------
  \newgeometry{top=2.4cm,bottom=2.4cm,left=2.4cm,right=2.4cm}
  \makeatletter

  \begin{titlepage}
    \AddToShipoutPicture*{\BolognaBackgroundPic}
  
    \begin{center}
        \vspace*{1em}
        \includegraphics[height=12em,keepaspectratio]{./figures/unibo_logo.png}\\
        \vspace{4em}
        {\sffamily\Huge \@title}\\[2em]
        {\sffamily Technical Report \@reportnumber}\\[4em]
        {\sffamily\Large \@author}\\[2em]
        {\sffamily \@date}
        \vfill
        \begin{tikzpicture}[overlay, remember picture]
          \fill[black,opacity=0.5] (-12,-0.4) rectangle (12,-2.4);
          \node[color=white] at (-5,-1.4) {\sffamily {\Huge OR-Unibo}~~~\orgroupname};
          % Twitter logo obtained from http://about.twitter.com/
          \node at (7,-1.4) {\includegraphics[height=1.5em,keepaspectratio]{./figures/twitter_logo.png}};
          \node[color=white] at (8.75,-1.5) {\sffamily @OR\_Unibo};
        \end{tikzpicture}
    \end{center}
  \end{titlepage}

  \makeatother
  \restoregeometry
  
  % ------------------------------------------------------------------------------------------------
  % 4. Set the page header
  % ------------------------------------------------------------------------------------------------
  \SetBgContents{\ORlogo}
  \SetBgPosition{current page.north west}
  \SetBgScale{0.4}
  \SetBgAngle{0.0}
  
  % ------------------------------------------------------------------------------------------------
  % 5. Print the table of contents
  % ------------------------------------------------------------------------------------------------
  \tableofcontents
}