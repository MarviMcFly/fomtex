## Zitieren

 - Allgemein
  - \footcite[<Erster Text>][<Zweiter Text>]{<Quelle>}
  - BEISPIEL: \footcite[Vgl.][S. 10]{<Quelle>}
 - Wörtliches Zitat
  -  \enquote{<Text>}\footcite[<Erster Text>][<Zweiter Text>]{<Quelle>}
  - BEISPIEL: \enquote{<Text>}\footcite[][S. 700]{<Quelle>}
 - Mehrere Quellen
  - \footnote{\footcite<1>...\footcite<N>}
  - BEISPIEL: \footnote{\footcite{<Quelle>}\footcite[Vgl.][5]{<Quelle>}}
  
## Bilder
see `.\content\examples`
\usepackage{graphicx}

\begin{figure}[h]																	% h is here, t or b is top or bottom. ! overrides internal LaTeX parameters
	\centering																		% center the figure within the box
	\includegraphics[width=0.7\linewidth]{<Path>}									% relativ path to graphic from \graphicspath. width is followed by a unit
	\caption[<Caption in \listoffigures>]{<Caption below the figure>\footnotemark} 	% define caption. \footnotemark enabled citation with following \footnotetext definition
	\label{fig:<Lable name>}														% label for refferencing the figure within the written text 
\end{figure}
\footnotetext{<cite>}																% definition of the cite / footnote

## Tabellen 
see `.\content\examples`
\usepackage{graphicx}
\input{./environment/commands.tex}

\begin{table}[!ht] 						% begin of table definition. h place the table approximately at this position and t at the top of the page.! overrides internal LATEX parameters.
	\begin{center}						% center table within this box
		\tableAppearance				% common table appearance definition defined as command within ./environment/commands.tex
		\caption{<Caption>}				% caption of the table
		\label{tbl:<label name>}		% label for refferencing the table within the written text 
		\begin{tabular}{cc}				% begin of actual table content. l = lef; c = center; r = rigth. p{} Top-aligned cells, m{} middle- and b{} Bottom-aligned cells width fixed width
			<Header 1> & <Header 2> \\ 	% header content (normal LATEX definition) with new line. Column separation is done by &. \rotatebox{<degrees>} to rotate text.
			\hline						% horizontal line
			<1.0> & <2.0> \\			% content of first row
			<1.1> & <2.1> \\			% content of second row	
			<1.n> & <2.n> \\			% content of nth row
			\hline						% horizontal line
		\end{tabular}					% end of table definition
	\end{center}	
\end{table}
