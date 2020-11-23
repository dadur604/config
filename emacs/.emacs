(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Gruvbox
(unless (package-installed-p 'gruvbox-theme)
  (package-refresh-contents)
  (package-install 'gruvbox-theme))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-safe-themes
   '("4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" default))
 '(package-selected-packages
   '(easy-kill avy expand-region guru-mode move-text gruvbox-theme))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#282828")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'gruvbox-dark-medium t)


;; Whitespace
(unless (package-installed-p 'whitespace)
  (package-refresh-contents)
  (package-install 'whitespace))

 ;; Highlight lines over 80 characters, etc
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; Move-Text
(unless (package-installed-p 'move-text)
  (package-refresh-contents)
  (package-install 'move-text))

 ;; Move lines up/down
(require 'move-text)
(move-text-default-bindings)


 ;; Add line numbers (relative)
(setq column-number-mode t)
(add-hook 'prog-mode-hook (lambda () (setq display-line-numbers 'relative)))

 ;; Add half-scroll keybindings
(autoload 'View-scroll-half-page-forward "view")
(autoload 'View-scroll-half-page-backward "view")

(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

 ;; Guru Mode
(unless (package-installed-p 'guru-mode)
  (package-refresh-contents)
  (package-install 'guru-mode))

(require 'guru-mode)

(add-hook 'prog-mode-hook 'guru-mode)

 ;; Expand-Region
(unless (package-installed-p 'expand-region)
  (package-refresh-contents)
  (package-install 'expand-region))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


 ;; Avy - jump to searches
(unless (package-installed-p 'avy)
  (package-refresh-contents)
  (package-install 'avy))

(require 'avy)
(global-set-key (kbd "C-'") 'avy-goto-char-timer)


;; easy-kill
(unless (package-installed-p 'easy-kill)
  (package-refresh-contents)
  (package-install 'easy-kill))

(require 'easy-kill)
(global-set-key [remap kill-ring-save] 'easy-kill)
