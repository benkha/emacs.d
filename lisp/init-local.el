;; (toggle-frame-maximized)

;; (global-set-key (kbd "M-o") 'other-window) ; cursor to other pane
(global-set-key (kbd "M-o") 'ace-window) ; cursor to other pane

(global-set-key (kbd "C-x /") 'counsel-recentf)

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

(require 'avy)

;; (require 'iedit)

(global-set-key (kbd "M-i") 'imenu)
(add-hook 'tex-mode-hook
          #'(lambda () (setq ispell-parser 'tex)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
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

(require 'key-chord)

(key-chord-define-global "jj" 'avy-goto-word-1)
(key-chord-define-global "jl" 'avy-goto-line)
(key-chord-define-global "jk" 'avy-goto-char)
(key-chord-define-global "JJ" 'crux-switch-to-previous-buffer)
(key-chord-define-global "uu" 'undo-tree-visualize)
(key-chord-define-global "xx" 'execute-extended-command)
(key-chord-define-global "yy" 'counsel-yank-pop)
(key-chord-define-global "II" 'iedit-mode)
(key-chord-define-global "GG" 'goto-line)
(key-chord-define-global "qq" 'sanityinc/toggle-delete-other-windows)
(key-chord-define-global "SS" 'counsel-ag)

(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-x C-r") 'ivy-resume)

(key-chord-mode +1)
(global-set-key [remap kill-ring-save] 'easy-kill)

(setq-default TeX-engine 'xetex)

(require 'crux)
(require 'rect)
(crux-with-region-or-line kill-region)

(setq magit-completing-read-function 'ivy-completing-read)

(global-set-key "\C-s" 'counsel-grep-or-swiper)
(global-set-key "\C-r" 'counsel-grep-or-swiper)
(global-set-key (kbd "C-c u") 'swiper-all)

(setq markdown-command "marked")

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-select-next)
     (define-key company-active-map [tab] 'company-select-next)))

(setq company-selection-wrap-around t)
(setq company-idle-delay 0.1)

(defun ivy-dired-mark (arg)
  (interactive "p")
  (dotimes (_i arg)
    (with-ivy-window
      (dired-mark 1))
    (ivy-next-line 1)
    (ivy--exhibit)))

(defun ivy-dired-unmark (arg)
  (interactive "p")
  (dotimes (_i arg)
    (with-ivy-window
      (dired-unmark 1))
    (ivy-next-line 1)
    (ivy--exhibit)))

(defun ivy-replace ()
  (interactive)
  (let ((from (with-ivy-window
                (move-beginning-of-line nil)
                (when (re-search-forward
                       (ivy--regex ivy-text) (line-end-position) t)
                  (match-string 0)))))
    (if (null from)
        (user-error "No match")
      (let ((rep (read-string (format "Replace [%s] with: " from))))
        (with-selected-window swiper--window
          (undo-boundary)
          (replace-match rep t t))))))

(defun ivy-undo ()
  (interactive)
  (with-ivy-window
    (undo)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'sanityinc-solarized-dark t)

;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)
;; (setq TeX-PDF-mode t)

;; ;; Use Skim as viewer, enable source <-> PDF sync
;; ;; make latexmk available via C-c C-c
;; ;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
;; ;; (add-hook 'LaTeX-mode-hook (lambda ()
;; ;;                              (push
;; ;;                               '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;; ;;                                 :help "Run latexmk on file")
;; ;;                               TeX-command-list)))
;; ;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


(provide 'init-local)
;;; init-local ends here
