;;; init-local.el --- local package -*- lexical-binding: t -*-
;;; Comentary:
;;; Code:

;;; remember last cursor place in a file
(save-place-mode 1)

;;; disabling some annoying keybindings in graphical mode
(when (display-graphic-p) (lambda ()
                            (global-unset-key (kbd "C-z"))
                            (global-unset-key (kbd "C-x C-z"))))

;;; Some better fonts
(set-face-attribute 'default nil :font "Fira Code" :height 120)
(set-face-attribute 'fixed-pitch nil :font "Fira Code")
(set-face-attribute 'variable-pitch nil :font "Hack")

;;; Some nice themes
;;; (require-package 'zenburn-theme)
(load-theme 'modus-vivendi)

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

;;; Python development
(require-package 'py-isort)
(eval-after-load 'python-mode
  (when (executable-find "isort")
    (add-hook 'before-save-hook 'py-isort-before-save)))
;;; Autoformat python with black
;;; black-on-save-mode is available via reformatter package in init-python.el
(eval-after-load 'python-mode
  (when (executable-find "black")
    (add-hook 'python-mode-hook 'black-on-save-mode)))

(provide 'init-local)

;;; init-local.el ends here
