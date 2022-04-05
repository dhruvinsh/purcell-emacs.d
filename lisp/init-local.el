;;; init-local.el --- local package -*- lexical-binding: t -*-
;;; Comentary:
;;; Code:

;;; Some better fonts
(set-face-attribute 'default nil :font "Fira Code" :height 120)
(set-face-attribute 'fixed-pitch nil :font "Fira Code")
(set-face-attribute 'variable-pitch nil :font "Hack")

;;; Some nice themes
(require-package 'zenburn-theme)
(load-theme 'zenburn t)

(provide 'init-local)

;;; init-local.el ends here
