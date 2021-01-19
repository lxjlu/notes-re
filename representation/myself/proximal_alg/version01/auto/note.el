(TeX-add-style-hook
 "note"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ctexbeamer" "UTF8" "aspectratio=169" "9pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("algorithm2e" "ruled")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "latex2e"
    "ctexbeamer"
    "ctexbeamer10"
    "graphicx"
    "booktabs"
    "color"
    "multirow"
    "fontspec"
    "amsmath"
    "amssymb"
    "tikz"
    "subfigure"
    "amsthm"
    "amsfonts"
    "mathtools"
    "algorithm2e"
    "textpos"
    "url"
    "algorithmic")
   (LaTeX-add-labels
    "eq:01"
    "eq:02")
   (LaTeX-add-amsthm-newtheorems
    "property"))
 :latex)

