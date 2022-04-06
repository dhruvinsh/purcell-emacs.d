;;; init-local.el --- local package -*- lexical-binding: t -*-
;;; Comentary:
;;; Code:

;;; remember last cursor place in a file
(save-place-mode 1)

;;; Some better fonts
(set-face-attribute 'default nil :font "Fira Code" :height 120)
(set-face-attribute 'fixed-pitch nil :font "Fira Code")
(set-face-attribute 'variable-pitch nil :font "Hack")

;;; Some nice themes
(require-package 'zenburn-theme)
(load-theme 'zenburn t)

;;; most of my system right now are windows wsl system
;;; windows 11 with native weston display or windows 10
;;; with VcXsrv for wsl2 or wsl1. Few hack to such system
;;; from
;;; https://emacsredux.com/blog/2021/12/19/wsl-specific-emacs-configuration/
(when (and (eq system-type 'gnu/linux)
           (getenv "WSLENV"))

  ;; Teach Emacs how to open links in your default Windows browser
  (let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe")
        (cmd-args '("/c" "start")))
    (when (file-exists-p cmd-exe)
      (setq browse-url-generic-program  cmd-exe
            browse-url-generic-args     cmd-args
            browse-url-browser-function 'browse-url-generic
            search-web-default-browser 'browse-url-generic))))

(provide 'init-local)

;;; init-local.el ends here
