(TeX-add-style-hook
 "group_meeting"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ctexbeamer" "UTF8" "aspectratio=169" "9pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("algorithm2e" "ruled")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
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
    "optim"
    "hjb"))
 :latex)

