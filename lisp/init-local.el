(toggle-frame-maximized)

(global-set-key (kbd "M-o") 'other-window) ; cursor to other pane

(require 'helm-config)
(helm-mode 1)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x /") 'helm-recentf)

(global-linum-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

;; (global-set-key (kbd "C-c k") 'kill-this-buffer)

(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)

(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                'prelude-move-beginning-of-line)


(defun prelude-smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun prelude-smart-open-line (arg)
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode.
With a prefix ARG open line above the current line."
  (interactive "P")
  (if arg
      (prelude-smart-open-line-above)
    (progn
      (move-end-of-line nil)
      (newline-and-indent))))

(global-set-key [(shift return)] 'prelude-smart-open-line)
(global-set-key [(control shift return)] 'prelude-smart-open-line-above)

;; (require 'smartparens-config)
;; (electric-pair-mode)

(require 'avy)

(require 'iedit)


(global-set-key (kbd "C-:") 'avy-goto-char-2)
(global-set-key (kbd "C-;") 'avy-goto-word-1)
(global-set-key (kbd "M-i") 'imenu)
(require 'wgrep-helm)
(add-hook 'tex-mode-hook
          #'(lambda () (setq ispell-parser 'tex)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
;; (setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(electric-pair-mode)
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)))

(add-hook 'yas-minor-mode-hook
          '(lambda ()
             (define-key yas-minor-mode-map (kbd "TAB") nil)
             (define-key yas-minor-mode-map (kbd "<tab>") nil)
             (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)))

(beacon-mode 1)
(provide 'init-local)
;;; init-local ends here
