;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;;install org-super-agenda
;; (package! org-super-agenda)

;;install reason mode
;; (package! reason-mode)

;;install svelte major mode
;; (package! svelte-mode)

;; install lsp-ui
(package! lsp-ui)

;; install ox-ipynb to export org files to ipynb
;; (package! ox-ipynb :recipe
;;   (:host github :repo "jkitchin/ox-ipynb"))

;; install night owl theme
(package! night-owl-theme)

;; install julia lsp
;; (package! eglot-jl)

;; Add ripgrep for use with projectile
(package! ripgrep)

;; add vue mode
;; (package! vue-mode)

;; Add Rougier's nano-theme from nano-emacs
(package! nano-theme :recipe
  (:host github :repo "rougier/nano-theme"))

(package! org-modern)

(package! mindre-theme)

;; (package! lsp-grammarly :recipe
;;   (:host github :repo "emacs-grammarly/lsp-grammarly"))

(package! prism)

(package! imenu-list)
(package! org-imenu :recipe
  (:host github :repo "rougier/org-imenu"))

(package! pdf-drop-mode :recipe
  (:host github :repo "rougier/pdf-drop-mode"))

(package! org-bib-mode :recipe
  (:host github :repo "rougier/org-bib-mode" :files ("org-bib.el")))