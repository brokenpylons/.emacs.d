(setq inhibit-splash-screen t)
(setq initial-scratch-message "")
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
  (indent-according-to-mode))
(global-set-key (kbd "S-C-o") 'command-open-above)

(defun command-open-bellow (arg)
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line)
  (indent-according-to-mode))
(global-set-key (kbd "C-o") 'command-open-bellow)

(defun command-join ()
  (interactive)
  (save-excursion
    (next-line)
    (join-line)))
(global-set-key (kbd "C-j") 'command-join)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package undo-tree
  :config
  (global-undo-tree-mode 1))
