;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Scott Bailey"
      user-mail-address "csb5t@virginia.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Dank Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Libre Baskerville")
      doom-serif-font (font-spec :family "Libre Baskerville"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-nord)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-horizon)
(load-theme 'night-owl t)
;; (load-theme 'mindre t)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")
(setq org-directory "~/Dropbox/org")
(setq org-roam-directory "~/Dropbox/org/pages")
(setq org-roam-dailies-directory "~/Dropbox/org/journals")

;; Set org agenda dir path to try to include all files in the directory
(setq org-agenda-files `("~/Dropbox/org"))


;; Set states for ORG todos
(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAITING(w@/!)" "|" "DONE(d)")
                            (sequence "EMAIL(e)" "|" "SENT(s)")
                            (sequence "|" "CANCELLED(c@/!)")
                            (sequence "|" "MOVED(m)")))

  (setq org-enforce-todo-dependencies t) ;; Enforce handling all child tasks before you can mark a parent done in org
  (setq org-enforce-todo-checkbox-dependencies t))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Automatic line wrapping
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

;; (use-package  org-super-agenda
;;   :config
;;   (setq org-super-agenda-groups `((:name "Today"
;;                                    :time-grid t
;;                                    :scheduled today)
;;                                   (:name "Due today"
;;                                    :deadline today)
;;                                   (:name "Important"
;;                                    :priority "A")
;;                                   (:name "Overdue"
;;                                    :deadline past)))
;;   (org-super-agenda-mode))

;; (require 'svelte-mode)

(use-package lsp-ui)

;; (use-package lsp-haskell
;;   :config
;;   (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
;;   ;; comment/uncomment below to see lsp client/server interactions
;;   (setq lsp-log-io t)
;;   )

(org-babel-do-load-languages
 `org-babel-load-languages
 `((emacs-lisp . t)
   (julia . t)
   (python . t)
   (jupyter . t)))


;; (require 'ox-ipynb)

;; (add-hook 'vue-mode-hook #'lsp!)

(setq org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…")

;; ;; Agenda styling
;; org-agenda-tags-column 0
;; org-agenda-block-separator ?─
;; org-agenda-time-grid
;; '((daily today require-timed)
;;    (800 1000 1200 1400 1600 1800 2000)
;; " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄"
;; org-agenda-current-time-string
;; "⭠ now ─────────────────────────────────────────────────")

(global-org-modern-mode)

(setq mindre-use-more-bold t
 mindre-use-faded-lisp-parens t)

;; (setq! lsp-rust-server 'rust-analyzer)

(setq citar-bibliography '("~/Dropbox/bibliography.bib"))
(setq citar-symbols
      `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
        (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
        (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
(setq citar-symbol-separator "  ")
