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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("778ca64be682097ae13574169d8d8554da510576dacbbabf76eebf8e75e13c86" "acaccddbc0ae7d5c2cdea2e64b0261ca383671205752c062c44590d944ad0842" "c924950f6b5b92a064c5ad7063bb34fd3facead47cd0d761a31e7e76252996f7" "7122873f9ac192e4f2cfafe1679fe6b3db658ac64593efe4bc10c52d7573c6c1" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(package-selected-packages
   (quote
    (ivy-hydra markdown-preview-eww ido-vertical-mode flx-ido crux yasnippet yari yaml-mode yagist whitespace-cleanup-mode virtualenvwrapper vc-darcs unfill undo-tree tidy textile-mode tagedit switch-window sql-indent smex smarty-mode smartparens slime-company skewer-less session scss-mode scratch sass-mode ruby-hash-syntax rspec-mode robe rinari regex-tool redshank rainbow-mode rainbow-delimiters projectile-rails project-local-variables pip-requirements php-mode paredit-everywhere page-break-lines origami org-pomodoro org-fstree org-cliplink nlinum mwe-log-commands multiple-cursors move-dup mmm-mode markdown-mode magit-gh-pulls lua-mode lively less-css-mode ledger-mode key-chord json-mode js-comint ipretty intero indent-guide immortal-scratch iedit ibuffer-vc htmlize hl-sexp hippie-expand-slime hindent highlight-symbol highlight-quoted highlight-escape-sequences hayoo guide-key goto-gem gnuplot gitignore-mode github-issues github-clone gitconfig-mode git-timemachine git-messenger git-blamed fullframe flycheck-package flycheck-ledger flycheck-elm flycheck-clojure fill-column-indicator expand-region exec-path-from-shell erlang elm-mode elisp-slime-nav elein easy-kill dsvn disable-mouse dired-sort dired+ diminish diff-hl default-text-scale darcsum csv-nav csv-mode css-eldoc crontab-mode counsel company-quickhelp company-anaconda color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cljsbuild-mode cl-lib-highlight cask-mode bundler bug-reference-github browse-kill-ring browse-at-remote beacon auto-compile auctex anzu aggressive-indent ace-window)))
 '(safe-local-variable-values (quote ((no-byte-compile t))))
 '(session-use-package t nil (session))
 '(tidy-config-file nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(easy-kill-selection ((t (:background "#002b36" :foreground "aquamarine" :inverse-video t)))))
