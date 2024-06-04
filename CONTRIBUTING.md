How to contribute
=================

To submit new documents for review or propose changes to existing ones you can
create create a Pull Request or Issue on GitHub. If you do not have a
GitHub account you can the send documents or changes to hisparc@utah.edu.


File Format
-----------

For the initial submit a document in a format other than .tex (LaTeX)
will be accepted, we will convert it to the proper format (.tex). After
this aditional changes will have to be made to that .tex file.


Route
-----

Clearly state where the document fits in the RouteNet. Name the
documents that lead to and which follow after the new document.


Repository structure
====================

Work in progress
----------------

It is best to keep a work in progress (a new document not yet ready to
be 'published') in a separate branch from `master`. This ensures that it
is not accidentally published. Once you believe it is ready, create a
pull request to ask someone to review it. Once reviewed and corrected it
can be merged to `master`.


Completed documents
-------------------

Once a document is completed (version 1.0) it should appear in the
`master` branch and be added to the `routenet.html`.


Directory structure
===================

The main directory contains two main directories containing the Dutch
and English RouteNet.

Each of these contains the RouteNet documents and the overall style.
Each document is inside a directory with a recognisable name in Title
Case (e.g. `Data Verwerken`). Inside each of those is the .tex file and
a directory called `Figures` which contains all figures used in the
document.


Document structure
==================

These are guidelines, not strict rules.


Preamble
--------

Start with importing the general style, then defining the document title
and author. Then begin the document by creating the title page.

```latex
\input{../style}

\begin{document}

\title{Kosmische Straling}
\author{N.G. Schultheiss}
\date{}

\maketitle
\thispagestyle{firststyle}
```


Sections
--------

Start each new section with a `\section{}`. For common terms use the
shortcuts to ensure proper capitalisation and emphasis, supported terms
can be found in the `style.tex`. When writing values with units use the
`\SI{}{}` command, where the first argument is the value and the second
the units. Here are some examples:

```latex
\section{Begin}

Namen als \hisparc en \jsparc zien er anders uit de de rest van de tekst.
Ook getallen met eenheden, zoals \SI{120.3}{\micro\meter} hebben speciale
commando's, zo kan later eenvoudig de weergave aangepast worden. En dit
is allemaal terug te lezen in \cite{tekst}.
```


Bibliography
------------

Add all reference to the bibliography at the end of the document

```latex
\begin{thebibliography}{9}
    \bibitem{tekst}
        Door N.G. Schultheiss, \emph{Botsen en Lenzen}, CC-BY-SA-3.0, via \hisparc
\end{thebibliography}

\end{document}
```


Text width
----------

Try to keep lines shorter than 72 characters, this makes it easier to
track changes and works better for some text editors.
