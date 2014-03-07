;; Anthony Crognale's .emacs file.
;; Customized to make life a easier.

;; Package stuff
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;; Pretty theme
(load-theme 'zenburn t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;; Make the GUI cleaner
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-set-key [f9] 'nav-toggle)


;; Python mode stuff
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; C & C++ Stuff
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(add-hook 'c-mode-common-hook
		  (lambda()
			(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)))

(autopair-global-mode 1)
(setq autopair-autowrap t)

(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq fci-rule-color "red")
(add-hook 'c-mode-hook 
		  (lambda()
			(setq-default fill-column 103)))

;; org mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; Need to be able to see column related stuff for class
(global-linum-mode 1)
(column-number-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
		  '(lambda() (set-fill-column 103)))

;; Setup ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Use a nicer font
(set-default-font "DejaVu Sans Mono-10" t)
(set-face-attribute 'default nil :height 100)

(set-default 'cursor-type '(bar . 1))

;; Make emacs do LaTeX nicely
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(setq make-backup-files nil)

;; Haskell mode stuff
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("d070fa185078bf753dcfd873ec63be19fa36a55a0c97dc66848a6d20c5fffdad" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
