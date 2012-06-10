(load-file "/Users/acrognale/code/emacs-for-python/epy-init.el")
(epy-setup-checker "pyflakes %f")
(epy-django-snippets)

(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-identation)

(add-to-list 'load-path "/Users/acrognale/.emacs.d/color-theme/")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))
(add-to-list 'load-path "/Users/acrognale/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized-light)

