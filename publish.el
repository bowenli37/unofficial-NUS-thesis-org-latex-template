;;(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(require 'org-latex)
(require 'ox)

;; Document structure * for chapter, ** for section and so on
(add-to-list 'org-latex-classes
             '("nusthesis"
               "\\documentclass{nusthesis}
\\usepackage{color}
\\usepackage[usenames,dvipsnames]{xcolor}
\\usepackage{listings}
\\usepackage{caption}
\\usepackage[section]{placeins}
\\usepackage{paralist}
\\usepackage{epstopdf}                 
"
	       ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(setq org-latex-pdf-process 
      '("xelatex -shell-escape -interaction=nonstopmode %f"
        "xelatex -shell-escape -interaction=nonstopmode %f")) ;; for multiple passes

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate t)
(setq org-export-babel-evaluate nil)

(setq org-latex-listings 'listings)
(setq org-latex-custom-lang-environments
      '(
        (emacs-lisp "common-lispcode")
        ))

(setq org-latex-listings-options
      '(("frame" "none")
        ("basicstyle" "\\scriptsize")
        ("numbers" "left")
        ("breaklines" "true")
        ("numberstyle" "\\tiny")
        ("identifierstyle" "\\color{PineGreen}")
        ("keywordstyle" "\\color{Blue}\\bfseries")
        ("commentstyle" "\\color{OliveGreen}\\textit")
        ("stringstyle" "\\color{Maroon}")
        ("rulecolor" "\\color{Black}")
        ))

; To run this from bash: emacs -l publish.el --batch
; --visit=master.org --execute='(publish)'
; or emacs -l publish.el --batch --visit=master.org
; --funcall=org-export-as-latex-batch
(defun publish()
  (interactive)
  (org-latex-export-to-latex))

