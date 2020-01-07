; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(setq packages '(ivy-bibtex pdf-tools))
(print packages)

(dolist (package packages)
  (unless (package-installed-p package)
    (package-install package)))

(ivy-mode 1)
(require 'ivy)

; General settings
(setq inhibit-splash-screen t)
;(setq initial-scratch-message "")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(tooltip-mode nil)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

(defun command-open-above (arg)
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "S-C-o") 'command-open-above)

(defun command-open-bellow (arg)
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "C-o") 'command-open-bellow)

(defun command-join ()
  (interactive)
  (next-line)
  (join-line))
(global-set-key (kbd "C-j") 'command-join)

(add-hook 'minibuffer-setup-hook
          (lambda ()
            (local-set-key [escape] 'minibuffer-keyboard-quit)))
(define-key query-replace-map [escape] 'quit)
(global-set-key [escape] 'keyboard-quit)

(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

(setq-default indent-tabs-mode nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))

(setq bibliography-path "~/Mind/bibliography/")
(setq bibtex-completion-library-path (list (concat bibliography-path "files/"))
      bibtex-completion-bibliography (list (concat bibliography-path "references.bib")))

(setq org-ellipsis "…")

;; (require 'openwith)
;; (openwith-mode t)
;; (setq openwith-associations '(("\\.pdf\\'" "evince" (file))))

(setq-default cursor-type 'bar)

(defalias 'doc-view-mode 'fundamental-mode)

(require 'bibtex)
(add-hook 'bibtex-mode-hook
          (lambda () (setq fill-column 100)))

(setq bibtex-autokey-edit-before-use nil)
(setq bibtex-autokey-year-title-separator ":")
(setq bibtex-autokey-titlewords 1)
(setq bibtex-autokey-titleword-length nil)

(setq js-indent-level 2)
