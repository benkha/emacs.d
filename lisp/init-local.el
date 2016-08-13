;;; package --- Summary

;;; Commentary:

;;; Code:

(toggle-frame-maximized)

(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-view-program-list
      '(("Sumatra PDF" ("\"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
                        (mode-io-correlate " -forward-search %b %n ") " %o"))))

(eval-after-load 'tex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))

(global-set-key (kbd "M-2") 'delete-window) ; close current pane
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-5") 'split-window-horizontally) ; split pane top/bottom
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-r") 'helm-recentf)

(global-linum-mode 1)

(global-set-key "\C-c\c" 'comment-region)
(global-set-key (kbd "C-c g") 'uncomment-region) ;;g is like C-g quit

(require 'yasnippet)
(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<tab>") nil)

(global-auto-complete-mode t)
(add-to-list 'ac-modes 'latex-mode)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(setq ac-source-yasnippet nil)

(set-buffer-file-coding-system 'unix)

(defun save-current-kbd-macro-to-dot-emacs (name)
  "Save the current macro as named function definition inside your initialization file so you can reuse it anytime in the future, as NAME."
  (interactive "Save Macro as: ")
  (name-last-kbd-macro name)
  (save-excursion
    (find-file-literally user-init-file)
    (goto-char (point-max))
    (insert "\n\n;; Saved macro\n")
    (insert-kbd-macro name)
    (insert "\n")))

(global-set-key (kbd "C-c k") 'kill-this-buffer)

(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)

(setq shell-file-name "cmdproxy") ;; or sh if you rename your bash executable to sh.
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name "cmdproxy")
(setq shell-command-switch "-c")
(setq w32-quote-process-args t)

(defun set-bash-shell ()
  "Set shell to bash."
  (interactive)
  (setq explicit-shell-file-name "bash")
  )

(defun set-cmd-shell ()
  "Set shell to cmd."
  (interactive)
  (setq explicit-shell-file-name "cmdproxy")
  )

(require 'tramp)
(set-default 'tramp-auto-save-directory "C:/Users/benkh/AppData/Local/Temp")
(set-default 'tramp-default-method "sshx")

(setq default-directory "C:/Users/benkh/Documents/")

;; chktex not working on windows, use lacheck instead
(setq flycheck-disabled-checkers '(tex-chktex))

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

(require 'smartparens-config)

(electric-pair-mode)
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)))

;; disable blinking cursor
(blink-cursor-mode -1)

(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

;; (setq helm-grep-default-command
;;       "ack -Hn --color --smart-case --no-group %e %p %f"
;;       helm-grep-default-recurse-command
;;       "ack -H --color --smart-case --no-group %e %p %f")

(setq helm-grep-default-command
      "grep --color=always -a -d recurse %e -n%cH -e %p %f")
(provide 'init-local)
;;; init-local ends here
