(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(package-selected-packages
   (quote
    (crux yasnippet yari yaml-mode yagist whitespace-cleanup-mode wgrep-helm virtualenvwrapper vc-darcs unfill undo-tree tidy textile-mode tagedit switch-window sql-indent smex smarty-mode smartparens slime-company skewer-less session scss-mode scratch sass-mode ruby-hash-syntax rspec-mode robe rinari regex-tool redshank rainbow-mode rainbow-delimiters projectile-rails project-local-variables pip-requirements php-mode paredit-everywhere page-break-lines origami org-pomodoro org-fstree org-cliplink nlinum mwe-log-commands multiple-cursors move-dup mmm-mode markdown-mode magit-gh-pulls lua-mode lively less-css-mode ledger-mode key-chord json-mode js-comint ipretty intero indent-guide immortal-scratch iedit ibuffer-vc htmlize hl-sexp hippie-expand-slime hindent highlight-symbol highlight-quoted highlight-escape-sequences helm-swoop hayoo guide-key goto-gem gnuplot gitignore-mode github-issues github-clone gitconfig-mode git-timemachine git-messenger git-blamed fullframe flycheck-package flycheck-ledger flycheck-elm flycheck-clojure fill-column-indicator expand-region exec-path-from-shell erlang elm-mode elisp-slime-nav elein easy-kill dsvn disable-mouse dired-sort dired+ diminish diff-hl default-text-scale darcsum csv-nav csv-mode css-eldoc crontab-mode counsel company-quickhelp company-anaconda color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cljsbuild-mode cl-lib-highlight cask-mode bundler bug-reference-github browse-kill-ring browse-at-remote beacon auto-compile auctex anzu aggressive-indent ace-window)))
 '(safe-local-variable-values (quote ((no-byte-compile t))))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
