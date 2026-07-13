;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Scott Bailey"
      user-mail-address "csbailey5t@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font (font-spec :family "Dank Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile")
      doom-serif-font (font-spec :family "Monaspace Xenon")
      doom-symbol-font (font-spec :family "Iosevka"))


;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)
                                        ; (load-theme `night-owl t)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")


;; Set states for ORG todos
(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAITING(w@/!)" "|" "DONE(d)")
                            (sequence "EMAIL(e)" "|" "SENT(s)")
                            (sequence "|" "CANCELLED(c@/!)")
                            (sequence "|" "MOVED(m)")))

  (setq org-enforce-todo-dependencies t) ;; Enforce handling all child tasks before you can mark a parent done in org
  (setq org-enforce-todo-checkbox-dependencies t))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;;;; Automatic line wrapping
(global-visual-line-mode t)

;; settings from https://github.com/sunnyhasija/Academic-Doom-Emacs-Config
(setq-default
 window-combination-resize t ;; take window space from all windows
 x-stretch-cursor t ;; stretch cursor to glyph width
 delete-trailing-lines t)


(setq undo-limit 80000000 ;; raise undo limit to 80mb
      evil-want-fine-undo t ;; more fine-grained undo in insert mode
      auto-save-default t
      inhibit-compacting-font-caches t ;; cache glyphs
      truncate-string-ellipsis "…")


;; Define where to find projects files
(setq projectile-project-search-path '("~/projects/"))

;; Set of options for org-modern

;; (set-face-attribute 'org-modern-symbol nil :family "Iosevka")

;; Add frame borders and window dividers
(modify-all-frames-parameters
 '((right-divider-width . 20)
   (internal-border-width . 20)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"
 org-modern-hide-stars `leading

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "◀── now ─────────────────────────────────────────────────")

(global-org-modern-mode)

(setq mindre-use-more-bold t
      mindre-use-faded-lisp-parens t)


(use-package markdown-mode
  :hook (markdown-mode . lsp)
  :config
  (require 'lsp-marksman))

;; Give markdown headers real visual hierarchy. Every header level otherwise
;; looks like bold body text: nano makes H1-H6 all inherit `nano-strong', and
;; markdown-ts-mode tags every heading with a single `font-lock-keyword-face'.
;; We define six per-level faces (colors inherit nano-salient/nano-strong so
;; light and dark nano variants adapt automatically) and wire them into BOTH
;; markdown modes.

(defface sb-md-h1 '((t :inherit (nano-salient nano-strong) :height 1.5))
  "Markdown level-1 heading.")
(defface sb-md-h2 '((t :inherit (nano-salient nano-strong) :height 1.3))
  "Markdown level-2 heading.")
(defface sb-md-h3 '((t :inherit nano-strong :height 1.15))
  "Markdown level-3 heading.")
(defface sb-md-h4 '((t :inherit nano-strong :height 1.05))
  "Markdown level-4 heading.")
(defface sb-md-h5 '((t :inherit nano-strong))
  "Markdown level-5 heading.")
(defface sb-md-h6 '((t :inherit nano-faded))
  "Markdown level-6 heading.")

;; Classic markdown-mode (used when the +tree-sitter flag is off).
(custom-set-faces!
  '(markdown-header-face-1 :inherit sb-md-h1)
  '(markdown-header-face-2 :inherit sb-md-h2)
  '(markdown-header-face-3 :inherit sb-md-h3)
  '(markdown-header-face-4 :inherit sb-md-h4)
  '(markdown-header-face-5 :inherit sb-md-h5)
  '(markdown-header-face-6 :inherit sb-md-h6))

;; markdown-ts-mode (tree-sitter) ships no per-level heading faces, so add a
;; `heading' font-lock feature that fontifies each ATX level from the grammar's
;; atx_hN_marker nodes. NB: tree-sitter capture names disallow "/", so the face
;; symbols use hyphens only.
(after! markdown-ts-mode
  (defun sb/markdown-ts-heading-fontify ()
    "Add per-level ATX heading fontification to `markdown-ts-mode'."
    (setq-local treesit-font-lock-settings
                (append treesit-font-lock-settings
                        (treesit-font-lock-rules
                         :language 'markdown
                         :feature 'heading
                         :override t
                         '([((atx_heading (atx_h1_marker)) @sb-md-h1)
                            ((atx_heading (atx_h2_marker)) @sb-md-h2)
                            ((atx_heading (atx_h3_marker)) @sb-md-h3)
                            ((atx_heading (atx_h4_marker)) @sb-md-h4)
                            ((atx_heading (atx_h5_marker)) @sb-md-h5)
                            ((atx_heading (atx_h6_marker)) @sb-md-h6)]))))
    (setq-local treesit-font-lock-feature-list
                (append treesit-font-lock-feature-list '((heading))))
    (treesit-font-lock-recompute-features)
    (when font-lock-mode (font-lock-flush)))
  (add-hook 'markdown-ts-mode-hook #'sb/markdown-ts-heading-fontify))

;; config for jinx spell checker
(use-package! jinx
  :hook (emacs-startup . global-jinx-mode)
  :config
  (map! :map evil-normal-state-map
        "z g" #'jinx-correct))
