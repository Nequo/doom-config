;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-theme 'doom-nord)
(setq doom-font (font-spec :family "FuraCode Nerd Font Mono" :size 18 :weight 'light))
(setq package-check-signature nil)
(setq bibtex-completion-bibliography '("~/intertokens/references.bib")
      bibtex-completion-library-path '("~/intertokens/papers/")
      bibtex-completion-pdf-field "File"
      )
(setq org-ref-default-bibliography '("~/intertokens/references.bib")
      org-ref-pdf-directory "~/intertokens/papers/")
(setq org-latex-pdf-process (list
   "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))
(after! org
  (setq
   org-bullets-bullet-list '("⁖")))
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/orgblog/"
         :base-extension "org"
         :publishing-directory "~/orgblog/output"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :section-numbers nil
         :auto-preamble nil
         :auto-postamble nil
         )
        ("org-static"
         :base-directory "~/orgblog/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/orgblog/output"
         :recursive t
         :publishing-function org-publish-attachment)
        ("org" :components ("org-notes" "org-static"))
        ))
(setq org-html-postamble nil)
(setq org-html-htmlize-output-type 'css)

;; Include the latex-exporter
(require 'ox-latex)
;; Add minted to the defaults packages to include when exporting.
(add-to-list 'org-latex-packages-alist '("" "minted"))
;; Tell the latex export to use the minted package for source
;; code coloration.
(setq org-latex-listings 'minted)

(setq org-latex-minted-options
  '(("framesep" "2mm") ("frame" "lines")("linenos")))
;; Let the exporter use the -shell-escape option to let latex
;; execute external programs.
;; This obviously and can be dangerous to activate!
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
