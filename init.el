;; Use CTRL + TAB to switch buffers in GUI mode
(when window-system
  (global-set-key (kbd "<C-S-tab>") 'previous-buffer)
  (global-set-key (kbd "<C-tab>")   'next-buffer))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
    (package-initialize))

(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; Key bindings
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-r") 'query-replace-regexp)
(global-set-key (kbd "C-f") 'next-multiframe-window)
;; (global-set-key (kbd "C-x C-g") 'magit-status)

;; Add file types associated with ruby
(add-to-list 'auto-mode-alist '("Rakefile"    . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile"   . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;;enabling puppet-mode
(add-to-list 'load-path "~/.emacs.d/modes")

;;
;; Setup puppet-mode for autoloading
;;
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; Enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)



;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/auto-save-list/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(custom-enabled-themes (quote (wombat)))
'(term-bind-key-alist
  (quote
   (("C-c C-c" . term-interrupt-subjob)
    ("C-c C-e" . term-send-esc)
    ("C-j" . term-toggle-mode)
    ("C-p" . previous-line)
    ("C-n" . next-line)
    ("C-s" . isearch-forward)
    ;; ("C-r" . isearch-backward)    
    ("C-r" . term-send-reverse-search-history)
    ("C-m" . term-send-return)
    ("C-y" . term-paste)
    ("C-z" . term-stop-subjob)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("M-o" . term-send-backspace)
    ("M-p" . term-send-up)
    ("M-n" . term-send-down)
    ("M-M" . term-send-forward-kill-word)
    ("M-N" . term-send-backward-kill-word)
    ("<C-backspace>" . term-send-backward-kill-word)
    ("<M-backspace>" . term-send-backward-kill-word)
    ("<M-DEL>" . term-send-backward-kill-word)
    ("M-r" . term-send-reverse-search-history)
    ("M-," . term-send-raw)
    ("M-." . comint-dynamic-complete)))))



;; Add file types associated with ruby
(add-to-list 'auto-mode-alist '("Rakefile"    . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile"   . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;;add ability to comment and uncomment blocks of marked code in emacs
(add-hook 'ruby-mode-hook
	      (lambda ()
		          (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)
			        )
	            )

(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	         (line-beginning-position 2)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load-file "~/.emacs.d/modes/csharp-mode.el")

;; Indentation 2 spaces everywhere                                                                                                                                           
;;(setq-default c-basic-offset 2)
;;(setq-default tab-width 2)

(defun term-toggle-mode ()
  (interactive)
  (if (term-in-line-mode)
    (term-char-mode)
      (term-line-mode)))

(define-key term-mode-map (kbd "C-j") 'term-toggle-mode)
