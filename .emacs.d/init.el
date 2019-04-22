(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (indium git-gutter exec-path-from-shell prettier-js yasnippet-snippets yasnippet tern auto-complete use-package adafruit-wisdom elisp-format tagedit sublime-themes solarized-theme smex smartparens smart-mode-line-powerline-theme rjsx-mode projectile paredit nyan-mode magit js2-refactor helm graphql-mode flx-ido expand-region editorconfig darktooth-theme clojure-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Update package list
(when (not package-archive-contents)
  (package-refresh-contents))

;; Define required packages and install them as needed
(defvar my-packages
  '(auto-complete clojure-mode darktooth-theme editorconfig elisp-format epl expand-region
		  exec-path-from-shell flx flx-ido git-gutter graphql-mode helm js2-mode
		  js2-refactor magit multiple-cursors nyan-mode page-break-lines paredit powerline
		  prettier-js projectile rjsx-mode smart-mode-line smartparens smex tern use-package
		  yasnippet yasnippet-snippets))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; BEHAVIORS
(fset 'yes-or-no-p 'y-or-n-p)

(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(desktop-save-mode 1)

(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-c d") 'kill-whole-line)

;; LOOK & FEELS
(load-theme 'darktooth t)
(darktooth-modeline-one)

(defun fullscreen()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(fullscreen)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(blink-cursor-mode 0)

(setq-default frame-title-format "%b (%f)")

(set-frame-font "Input Mono 13" nil t)

(global-prettify-symbols-mode 1)
(global-git-gutter-mode 1)

;; NAVIGATION
(ido-mode t)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(defun prev-window()
  (interactive)
  (other-window -1))
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(windmove-default-keybindings)

;; PLUGINS

(require 'editorconfig)
(editorconfig-mode 1)

(require 'helm-config)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'projectile)
(projectile-global-mode)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'yasnippet)
(yas-global-mode 1)

(smartparens-global-mode t)

(use-package js2-mode
  :ensure t
  :init
  (setq js-basic-indent 2)
  (setq-default js2-basic-indent 2
                js2-basic-offset 2
                js2-auto-indent-p t
                js2-strict-missing-semi-warning nil
                js2-missing-semi-one-line-override nil
                js2-cleanup-whitespace t
                js2-enter-indents-newline t
                js2-indent-on-enter-key t
                js2-global-externs (list "window" "module" "require" "buster" "sinon" "assert"
                                         "refute" "setTimeout" "clearTimeout" "setInterval"
                                         "clearInterval" "location" "__dirname" "console" "JSON"))

  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

(defun my-pretty-symbols ()
  (setq prettify-symbols-alist '(("lambda" . 955)
                                 ("function" . ?ƒ))))

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
(add-hook 'js2-mode-hook 'my-pretty-symbols)
(add-hook 'rjsx-mode-hook 'my-pretty-symbols)

;; Auto-complete
(global-auto-complete-mode t)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; Prettier
(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
