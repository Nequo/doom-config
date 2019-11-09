;; doom-apprentice-theme.el --- a more Sourcerer version of doom-one
;;; Commentary:
(require 'doom-themes)
;;; Code:
;;
(defgroup doom-apprentice-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-apprentice-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-apprentice-theme
  :type 'boolean)

(defcustom doom-apprentice-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-apprentice-theme
  :type 'boolean)

(defcustom doom-apprentice-comment-bg doom-apprentice-brighter-comments
  "If non-nil, comments will have a subtle, darker background.
Enhancing their legibility."
  :group 'doom-apprentice-theme
  :type 'boolean)

(defcustom doom-apprentice-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-apprentice-theme
  :type '(choice integer boolean))


;;
(def-doom-theme doom-apprentice
  "A dark theme based off of romainl's apprentice VIM colorscheme"

  ((bg         '("#202020"))
   (bg-alt     '("#222222"))
   (base0      '("#1d2127"))
   (base1      '("#1d2127"))
   (base2      '("#272727"))
   (base3      '("#32353f"))
   (base4      '("#494952"))
   (base5      '("#62686E"))
   (base6      '("#757B80"))
   (base7      '("#9ca0a4"))
   (base8      '("#fdfdd5"))
   (fg         '("#BCBCBC"))
   (fg-alt     '("#5D656B"))

   (grey       base4)
   (red        '("#aa4450"))
   (orange     '("#dd8844"))
   (green      '("#858253"))
   (green-br   '("#99bb66"))
   (teal       '("#5b8583" "#44b9b1" ))
   (yellow     '("#FF8700"           ))
   (blue       '("#86aed5"           ))
   (dark-blue  '("#6688aa"           ))
   (magenta    '("#8686ae"           ))
   (violet     '("#8686ae"           ))
   (cyan       '("#5b8583"           ))
   (dark-cyan  '("#9aaccb"           ))
   ;; face categories
   (highlight      orange)
   (vertical-bar   base0)
   (selection      base5)
   (builtin        blue)
   (comments       (if doom-apprentice-brighter-comments dark-cyan "#5c5d56"))
   (doc-comments   (if doom-apprentice-brighter-comments (doom-lighten dark-cyan 0.15) (doom-darken "#5c5d56" 0.1)))
   (constants      teal)
   (functions      base8)
   (keywords       blue)
   (methods        magenta)
   (operators      teal)
   (type           violet)
   (strings        green)
   (variables      base8)
   (numbers        orange)
   (region         base2)
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)
   
   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (hidden-alt `(,(car bg-alt) "black" "black"))
   (-modeline-pad
    (when doom-apprentice-padded-modeline
      (if (integerp doom-apprentice-padded-modeline) doom-apprentice-padded-modeline 4)))

   (modeline-fg     "#bbc2cf")
   (modeline-fg-alt (doom-blend blue grey (if doom-apprentice-brighter-modeline 0.4 0.08)))
   
   (modeline-bg
    (if doom-apprentice-brighter-modeline
        `("#383f58" ,@(cdr base1))
      `(,(car base3) ,@(cdr base0))))
   (modeline-bg-l
    (if doom-apprentice-brighter-modeline
        modeline-bg
      `(,(doom-darken (car bg) 0.15) ,@(cdr base1))))
   (modeline-bg-inactive   (doom-darken bg 0.20))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.2) ,@(cdr base0))))
  
  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   (cursor :background blue)
   (font-lock-comment-face
    :foreground comments
    :background (if doom-apprentice-comment-bg (doom-darken bg-alt 0.095)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (mode-line-buffer-id :foreground green-br :bold bold)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground blue :bold bold)
   
   (doom-modeline-bar :background (if doom-apprentice-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-path :foreground (if doom-apprentice-brighter-modeline base8 blue) :bold bold)

   (mode-line
    :background base3 :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,base3)))
   (mode-line-inactive
    :background bg-alt :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if doom-apprentice-brighter-modeline base8 highlight))
   (fringe :background base2)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-header-face :inherit 'bold :foreground red)
      ;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground dark-cyan)
   (rainbow-delimiters-depth-2-face :foreground teal)
   (rainbow-delimiters-depth-3-face :foreground dark-blue)
   (rainbow-delimiters-depth-4-face :foreground green)
   (rainbow-delimiters-depth-5-face :foreground violet)
   (rainbow-delimiters-depth-6-face :foreground green)
   (rainbow-delimiters-depth-7-face :foreground orange)
   ;; org-mode
   (org-hide :foreground hidden)
   (org-level-1          :foreground magenta :weight 'bold :height 1.25)
   (org-level-2          :foreground green :weight 'bold :height 1.1)
   (org-level-3          :foreground green :bold bold :height 1.0)
   (org-level-4          :foreground green :bold bold :height 1.0)
   (solaire-org-hide-face :foreground hidden-alt))
   


  ;; --- extra variables --------------------
  ;; ()

  )

;;; doom-apprentice-theme.el ends here

