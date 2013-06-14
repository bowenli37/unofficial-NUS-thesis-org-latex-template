thesis-org-latex-template
=========================

Unofficial orgmode latex template for NUS thesis

# Requirements

-   Tested in emacs 24.2, 24.3

-   Orgmode > 8.0 (new exporter)

-   make

# Usage

For emacs orgmode users, running "make" will export the orgmode document to pdf. Figures in org file will not be generated during export, so you need to generate them before export.
Multilpe rounds of "make" may be necessary to generate the list of tables, list of figures and bibliography successfully.
For LaTeX user, nusthesis.cls and thesis.tex can be used as templates.
