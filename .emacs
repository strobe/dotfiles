;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; !! General Settings !!
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#454545" "#cd5542" "#6aaf50" "#baba36" "#5180b3" "#ab75c3" "#bdbc61" "#bdbdb3"])
 '(column-number-mode t)
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(erc-modules
   (quote
    (autojoin button completion hecomplete dcc fill irccontrols list log match menu move-to-prompt netsplit networks noncommands notifications readonly ring scrolltobottom services smiley sound stamp spelling track xdcc)))
 '(haskell-complete-module-preferred
   (quote
    ("Data.ByteString" "Data.ByteString.Lazy" "Data.Conduit" "Data.Function" "Data.List" "Data.Map" "Data.Maybe" "Data.Monoid" "Data.Ord")))
 '(haskell-interactive-mode-eval-mode (quote haskell-mode))
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-notify-p t)
 '(haskell-process-args-ghci (quote ("-ferror-spans")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-generate-tags nil)
 '(haskell-process-log t)
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(hindent-style "chris-done")
 '(package-selected-packages
   (quote
    (flycheck-purescript purescript-mode terraform-mode markdown-mode reveal-in-osx-finder w3m company-racer writeroom-mode flymake-rust flycheck racer company flycheck-rust rust-mode multi-term yasnippet-bundle yaml-mode use-package undo-tree transpose-frame tao-theme tangotango-theme sr-speedbar shut-up omnisharp neotree multiple-cursors move-text monokai-theme monochrome-theme moe-theme magit-annex highlight-symbol hi2 helm-projectile gruvbox-theme go-complete ghci-completion flymake-go flycheck-haskell flx-ido flatland-theme firebelly-theme exec-path-from-shell ensime dockerfile-mode company-go color-theme-molokai color-theme bubbleberry-theme bm ample-zen-theme ample-theme ace-jump-mode ac-haskell-process)))
 '(shm-auto-insert-bangs t)
 '(shm-auto-insert-skeletons t)
 '(shm-use-presentation-mode t))

;;;;;;;;;;;;;;;;;;;;;
;;
;; Packages Repos
;;
;;;;;;;;;;;;;;;;;;;;;


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
;;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(when (not package-archive-contents)
  (package-refresh-contents))

;;;;;;;;;;;;;;;;;;;;;;;
;; End Packages Repos
;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;
;;
;; Global
;;
;;;;;;;;;;;;

;; Fix for extra tabs at pasting problem
(electric-indent-mode 0)

;; ergonomic way of moving between buffers
(global-set-key (kbd "M-=") 'other-window)
(global-set-key (kbd "C-M-]") 'next-buffer)
(global-set-key (kbd "C-M-[") 'previous-buffer)

;; disable default key binding for fix ORG mode keys
(global-set-key (kbd "ESC ESC") nil)

;; hidding toolbar in gui mode
(tool-bar-mode 0)

;; hidding scroll bars in gui mode
(when (boundp 'aquamacs-version)
  (scroll-bar-mode -1)
)

(defun pbpaste ()
  (interactive)
  (shell-command-on-region
    (point)
    (if mark-active (mark) (point))
    "pbpaste" nil t))

(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

;; custom script path
(let ((default-directory "~/.emacs.d/my-lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
(defvar *main-path* "~/.emacs.d/my-lisp/")

;; undo\redo win like - keys are ‘C-c left’ and ‘C-c right’
;;(winner-mode t)
(fset 'yes-or-no-p 'y-or-n-p) ;;не заставляйте меня печать yes целиком
;; Mac style undo
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
;; Mac style redo
(global-set-key (kbd "C-Z") 'redo)

;; globals settings
 ;;ну.. в принципе не надо, но симпатично
(fset 'yes-or-no-p 'y-or-n-p) ;;не заставляйте меня печать yes целиком

;; сохраняет сессию в текущую директорию
;; (desktop-save-mode t)

;; отключает звук beep
(setq visible-bell t)

;; отключает перенос строк
(toggle-truncate-lines t)
(setq-default truncate-lines t)

;; tabs disabling
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; dired setup
(put 'dired-find-alternate-file 'disabled nil)

;; reloading files if it changed on disk
(global-auto-revert-mode t)

;; move cursor to splitted window
;;(defadvice split-window (after move-point-to-new-window activate)
;;  "Moves the point to the newly created window after splitting."
;;  (other-window 1))

;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; terminal mouse pointer support
(xterm-mouse-mode t)

;; terminal mouse scroll ;;
(defun track-mouse (e))

(setq mouse-wheel-follow-mouse 't)

(defvar alternating-scroll-down-next t)
(defvar alternating-scroll-up-next t)

(defun alternating-scroll-down-line ()
  (interactive "@")
  (when alternating-scroll-down-next
                                        ;      (run-hook-with-args 'window-scroll-functions )
    (scroll-down-line))
  (setq alternating-scroll-down-next (not alternating-scroll-down-next)))

(defun alternating-scroll-up-line ()
  (interactive "@")
  (when alternating-scroll-up-next
                                        ;      (run-hook-with-args 'window-scroll-functions)
    (scroll-up-line))
  (setq alternating-scroll-up-next (not alternating-scroll-up-next)))

(global-set-key (kbd "<mouse-4>") 'alternating-scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'alternating-scroll-up-line)
;; end of terminal  mouse scroll ;;


;; open buffer-menu insted buffer-menu-other-window
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; open buffer in new frame at buffer-menu by key 5
(defun Buffer-menu-other-frame ()
  (interactive)
  (switch-to-buffer-other-frame (Buffer-menu-buffer t)))

(define-key Buffer-menu-mode-map "5"
  'Buffer-menu-other-frame)


;;;;;;;;;;;;;;;
;; End Global
;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;
;;
;; Extensions
;;
;;;;;;;;;;;;;;;

;; move line
(defun move-text-default-bindings2 ()
  "Bind `move-text-up' and `move-text-down' to M-up and M-down."
(require 'move-text)
  (global-set-key [(shift control up)] 'move-text-up)
    (global-set-key [(shift control down)] 'move-text-down))

(move-text-default-bindings2)


;; tabs bar
;;(byte-compile-file "/Applications/Emacs.app/Contents/Resources/site-lisp/tabbar.el")
; (byte-compile-file (concat *main-path* "tabbar/tabbar.el"))
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(control shift tab)] 'tabbar-forward) ;; - переключение вперед
(global-set-key [(control meta shift tab)] 'tabbar-backward);; а теперь разворачиваемся на 180 градусов - и снова вперед
;; tabbar settings
(when (boundp 'aquamacs-version)
  (set-face-attribute 'tabbar-default nil :background "gray60")
  (set-face-attribute 'tabbar-unselected nil
                      :background "gray85"
                      :foreground "gray30"
                      :box nil)
  (set-face-attribute 'tabbar-selected nil
                      :background "#f2f2f6"
                      :foreground "black"
                      :box nil)
  (set-face-attribute 'tabbar-button nil
                      :box '(:line-width 1 :color "gray72" :style released-button))
  (set-face-attribute 'tabbar-separator nil
                      :height 0.7)
)
(when (not(boundp 'aquamacs-version))
  ;;(set-face-attribute 'tabbar-default-face nil :background "gry60")
  (set-face-attribute 'tabbar-default-face nil
                      :background "gray20") 
 
  (set-face-attribute 'tabbar-unselected-face nil
                      :background "gray50"
                      :foreground "gray20"
                      :box nil)
  (set-face-attribute 'tabbar-selected-face nil
                      :background "gray70"
                      :foreground "black"
                      :box nil)
  (set-face-attribute 'tabbar-button-face nil
                      :box '(:line-width 1 :color "gray60" :style released-button))
  (set-face-attribute 'tabbar-separator-face nil
                      :height 0.7)
)



(defun tabbar-buffer-groups (buffer)
  "Return the list of group names BUFFER belongs to.
Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
    (cond
     ((string-equal "*" (substring (buffer-name) 0 1))
      '("Emacs Buffer"))
     ((eq major-mode 'dired-mode)
      '("Dired"))
         (t
      '("User Buffer"))
         )))

;; parens higlight
;;(show-paren-mode)

;; http://www.emacswiki.org/emacs/HighlightParentheses
;;(byte-compile-file (concat *main-path* "highlight-parentheses/highlight-parentheses.el"))
;; (require 'highlight-parentheses)
;; (define-globalized-minor-mode global-highlight-parentheses-mode
;;   highlight-parentheses-mode
;;   (lambda ()
;;     (highlight-parentheses-mode t)))
;; (global-highlight-parentheses-mode t)


;; multiply-cursors ;;
(add-to-list 'load-path "~/.emacs.d/elpa/multiple-cursors-1.3.0/")
(require 'multiple-cursors)
(global-set-key (kbd "M-s c") 'mc/edit-lines)
(global-set-key (kbd "M->") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<") 'mc/mark-previous-like-this)
;;(Global-set-key (kbd "M-s <") 'mc/mark-all-like-this)
;; end ;;

;; ace jump ;;
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
;; end ;;

;; projectile ;;
;(add-to-list 'load-path "~/.emacs.d/elpa/projectile-20150911.844/")
;(require 'projectile)
;(projectile-global-mode)
(add-hook 'scala-mode-hook 'projectile-mode)
;(setq projectile-indexing-method 'native)
;(setq projectile-enable-caching t)
;(setq projectile-projects-cache (make-hash-table))
(use-package projectile
  :demand
  :init   (setq projectile-use-git-grep t)
  :config (projectile-global-mode t)
  :bind   (("C-c f" . projectile-find-file)
           ("C-c F" . projectile-grep)
           ("C-c b" . projectile-switch-to-buffer)
           ))
;; end ;;


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-align-annotations t)
(add-hook 'prog-mode-hook 'company-mode)

(provide 'init-company-mode)

;; helm (search anywhere) ;;
;(add-to-list 'load-path "~/.emacs.d/elpa/helm-20151005.144/")
;(require 'helm)
;(require 'helm-config)
;(setq projectile-completion-system 'helm)
;(helm-projectile-on)

;(global-set-key (kbd "C-c f") 'helm-find-files)
;(global-set-key (kbd "C-c b") 'helm-buffers-list)
;(global-set-key (kbd "C-c n") 'helm-projectile)
;; end ;;

;; interactive search in mini buffer
(use-package flx-ido
  :demand
  :init
  (setq
   ido-enable-flex-matching t
   ;; C-d to open directories
   ;; C-f to revert to find-file
   ido-show-dot-for-dired nil
   ido-enable-dot-prefix t)
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1))
;; fix for Ido tilde home path in find-file mode
(defun oleh-ido-setup-hook ()
  (define-key ido-file-dir-completion-map "~"
    (lambda ()
      (interactive)
      (ido-set-current-directory "~/")
      (setq ido-exit 'refresh)
      (exit-minibuffer))))

(add-hook 'ido-setup-hook 'oleh-ido-setup-hook)


;; file explorer three OC
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; speed bar in main window
(require 'sr-speedbar)

;; transponse frame
(require 'transpose-frame)

;; visible bookmarks
(require 'bm)
(set-face-attribute 'bm-face nil :background "gray20" :foreground "gray70") ;; just customized colors for line mark

;; bm key setup.
(global-set-key (kbd "<f9>") 'bm-toggle)
(global-set-key (kbd "<f11>") 'bm-next)
(global-set-key (kbd "<f12>") 'bm-previous)

;; Click on fringe to toggle bookmarks, and use mouse wheel to move between them.
(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;; Git client
(require 'magit)
(use-package magit
  :commands magit-status magit-blame
  :init (setq
         magit-revert-buffers nil)
  :bind (("M-s g" . magit-status)
         ("M-s b" . magit-blame)))

;; undo visualization
(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode)
  :bind ("M-s /" . undo-tree-visualize))

;; highlight all the symbols in a file that match the current one
(use-package highlight-symbol
  :diminish highlight-symbol-mode
  :commands highlight-symbol
  :bind ("M-s h" . highlight-symbol))


;;(require 'sublimity)
;;(require 'sublimity-scroll)
;;(require 'sublimity-map)

(use-package writeroom-mode
  ;; BUGs to be aware of:
  ;; https://github.com/joostkremers/writeroom-mode/issues/18
  ;; https://github.com/company-mode/company-mode/issues/376
  ;;:diminish writeroom-mode
  :commands writeroom-mode)

(use-package whitespace
  :commands whitespace-mode
  :diminish whitespace-mode
  :init
  ;; BUG: https://emacs.stackexchange.com/questions/7743
  (put 'whitespace-line-column 'safe-local-variable #'integerp)
  (setq whitespace-style '(face trailing tabs lines-tail)
        ;; github source code viewer overflows ~120 chars
        whitespace-line-column 120))
(defun whitespace-mode-with-local-variables ()
  "A variant of `whitespace-mode' that can see local variables."
  ;; WORKAROUND https://emacs.stackexchange.com/questions/7743
  (add-hook 'hack-local-variables-hook 'whitespace-mode nil t))
;;;;;;;;;;;;;;;;;;;;
;; End Extensions
;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;
;;
;; Custom Functions
;;
;;;;;;;;;;;;;;;;;;;;;;

;; swap windows
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((/= (count-windows) 2)
	 (message "You need exactly 2 windows to do this."))
	(t
	 (let* ((w1 (first (window-list)))
		(w2 (second (window-list)))
		(b1 (window-buffer w1))
		(b2 (window-buffer w2))
		(s1 (window-start w1))
		(s2 (window-start w2)))
	   (set-window-buffer w1 b2)
	   (set-window-buffer w2 b1)
	   (set-window-start w1 s2)
	   (set-window-start w2 s1))))
  (other-window 1))

(global-set-key (kbd "C-c s") 'swap-windows) ;; set hotkey for it

;; menu for GUI mode
(define-key global-map (kbd "C-<f2>")
  (lambda ()
    (interactive)
    (x-popup-menu (list '(0 0) (selected-frame))
                  (mouse-menu-bar-map))))


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End Custom Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;
;;
;; Color Theme
;;
;;;;;;;;;;;;;;;;;;

;; disabling current theme before load next
(defadvice load-theme (before theme-dont-propagate activate)
 (mapcar #'disable-theme custom-enabled-themes))

(defun switch-color-theme () (interactive)
       (setq current-t custom-enabled-themes)
       (pcase current-t
         (`(tao-yin ample)
          (go-to-color)
          (message "Switched to Ample")
          )
         (`(tao-yin)
          (go-to-color)
          (message "Switched to Ample")
          )
         (`(ample)
          (go-to-monochrome)
          (message "Switched to Tao-Yin")
          )
         (`(ample tao-yin)
          (go-to-monochrome)
          (message "Switched to Tao-Yin")
          )
       )
)

(defun go-to-monochrome () (interactive)
       (load-theme 'tao-yin t)
       (enable-theme 'tao-yin)
       (set-face-attribute 'region nil :background "gray50")
       (custom-set-faces
        '(font-lock-function-name-face
          ((t (:foreground "#bbbbbb")))))
       (custom-set-faces
        '(font-lock-keyword-face
          ((t (:foreground "#bbbbbb")))))
       (custom-set-faces
        '(font-lock-type-face
          ((t (:foreground "#b6b6b6")))))
       (custom-set-faces
        '(font-lock-variable-name-face
          ((t (:foreground "#bbbbbb")))))
       (custom-set-faces
        '(scala-font-lock:sealed-face
          ((t (:foreground "#bbbbbb")))))
       (custom-set-faces
        '(scala-font-lock:private-face
          ((t (:foreground "#bbbbbb")))))
       (custom-set-faces
        '(scala-font-lock:final-face
          ((t (:foreground "#b3b3b3")))))
       (custom-set-faces
        '(scala-font-lock:override-face
          ((t (:foreground "#b3b3b3")))))
       (custom-set-faces
        '(neo-expand-btn-face
          ((t (:foreground "#b3b3b3")))))
       (custom-set-faces
        '(font-lock-builtin-face
          ((t (:foreground "#bbbbbb")))))
)

(defun go-to-color () (interactive)
       (load-theme 'ample t)
       (enable-theme 'ample)
       (custom-set-faces
        '(scala-font-lock:var-face
          ((t (:foreground "DarkOliveGreen3")))))

       ;; revert monochrome changes
       (set-face-attribute 'region nil :background "303030")
       (custom-set-faces
        '(font-lock-function-name-face
          ((t (:foreground "#6aaf50")))))
       (custom-set-faces
        '(font-lock-keyword-face
          ((t (:foreground "#5180b3")))))
       (custom-set-faces
        '(font-lock-type-face
          ((t (:foreground "#cd5542")))))
       (custom-set-faces
        '(font-lock-variable-name-face
          ((t (:foreground "#baba36")))))
       (custom-set-faces
        '(scala-font-lock:sealed-face
          ((t (:foreground nil)))))
       (custom-set-faces
        '(scala-font-lock:private-face
          ((t (:foreground nil)))))
       (custom-set-faces
        '(scala-font-lock:final-face
          ((t (:foreground nil)))))
       (custom-set-faces
        '(scala-font-lock:override-face
          ((t (:foreground nil)))))
       (custom-set-faces
        '(neo-expand-btn-face
          ((t (:foreground "SkyBlue")))))
       (custom-set-faces
        '(font-lock-builtin-face
          ((t (:foreground "#528fd1")))))

       )

;; color theme
(when (not(boundp 'aquamacs-version))
  (load-theme 'ample t)
  ;;(load-theme 'tao-yin t)
  (go-to-color)
  ;;(go-to-monochrome)
)

(when (boundp 'aquamacs-version)
  ;;(load-theme 'monokai t)
  ;;(enable-theme 'monokai)
  (set-face-attribute 'default nil :foreground "gray60")

  (add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-darkula")
  (load-theme 'Darkula t)
  (enable-theme 'Darkula)

  (custom-set-faces
   '(scala-font-lock:var-face
     ((t (:foreground "#A9B7C6"))))
  )

  (set-face-attribute 'region nil :background "gray50")
  (set-face-attribute 'vertical-border
                      nil
                      :foreground "#444444")

)

; (add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-darkula")
; (load-theme 'Darkula t)
; (custom-set-faces
;  '(scala-font-lock:var-face
;    ((t (:foreground "#A9B7C6"))))
;  )


;;;;;;;;;;;;;;;;;;;;;;
;; End Color Theme
;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;
;;;
;;; !! Languages !!
;;;
;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;
;; Scala
;;;;;;;;;;


;; if you're new to the MELPA package manager, just include
;; this entire snippet in your `~/.emacs` file and follow
;; the instructions in the comments.
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
                          '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(when (not package-archive-contents)
  (package-refresh-contents))

;;(unless (package-installed-p 'scala-mode2)
;;    (package-refresh-contents) (package-install 'scala-mode2))

;; Restart emacs and do `M-x package-install [RETURN] ensime [RETURN]`
;; To keep up-to-date, do `M-x list-packages [RETURN] U [RETURN] x [RETURN]`

;; If necessary, make sure "sbt" and "scala" are in the PATH environment
;; (setenv "PATH" (concat "/path/to/sbt/bin:" (getenv "PATH")))
;; (setenv "PATH" (concat "/path/to/scala/bin:" (getenv "PATH")))
;;
;; On Macs, it might be a safer bet to use exec-path instead of PATH, for instance:
;; (setq exec-path (append exec-path '("/usr/local/bin")))

;;(require 'ensime)
; (use-package ensime
;   :ensure t
;   :pin melpa-stable)
; (use-package scala-mode
;   :interpreter
;   ("scala" . scala-mode))


;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Fancy unicode arrows for emacs scala-mode
;; https://gist.github.com/stew/6148551
(defun right-arrow ()
  (interactive)
  (cond ((looking-back "=")
   (backward-delete-char 1) (insert "⇒"))
	((looking-back "-")
	 (backward-delete-char 1) (insert "→"))
	(t (insert ">"))))

(defun left-arrow ()
  (interactive)
  (if (looking-back "<")
      (progn (backward-delete-char 1)
	     (insert "←"))
    (insert "-")))


(add-hook 'scala-mode-hook 
          '(lambda () (interactive)
             (local-set-key (kbd "-") 'left-arrow)
             (local-set-key (kbd ">") 'right-arrow)
             
             ;; Autocompletition for terminal mode
             ;; removing yas/expand tab binding 
             (define-key yas/minor-mode-map (kbd "<tab>") nil)
             (define-key yas/minor-mode-map (kbd "TAB") nil)
             (define-key yas/minor-mode-map [(tab)]        nil)
             ;; adding ensime complete binding to tab
             (define-key ensime-mode-map [(tab)] 'ensime-company-complete-or-indent)
             (define-key ensime-mode-map (kbd "<tab>") 'ensime-company-complete-or-indent)
             (define-key ensime-mode-map (kbd "TAB") 'ensime-company-complete-or-indent)
             (define-key ensime-mode-map (kbd "M-§") 'ensime-company-complete-or-indent)
             (ensime-scala-mode-hook)
))

(define-key ensime-mode-map (kbd "M-TAB") 'ensime-company-complete-or-indent)

;
;; End Scala
;;;;;;;;;;;;;;


;;;;;;;;;;;;
;;
;; Haskell
;;
;;;;;;;;;;;;

;; haskell mode configuration
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
  ("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)

;adding the following lines according to which modules you want to use:
(require 'inf-haskell)

(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook
   (function
    (lambda ()
      (setq haskell-program-name "ghci")
      (setq haskell-ghci-program-name "ghci"))))

(add-hook 'haskell-mode-hook 'yas-minor-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)

;; Requirements

(require 'haskell)
(require 'haskell-mode)
;;(require 'hindent)
(require 'haskell-process)
(require 'haskell-simple-indent)
(require 'haskell-interactive-mode)
(require 'haskell-font-lock)

;; Mode settings



;; Functions

(defun haskell-process-all-types ()
  "List all types in a grep-mode buffer."
  (interactive)
  (let ((session (haskell-session)))
    (switch-to-buffer (get-buffer-create (format "*%s:all-types*"
                                                 (haskell-session-name (haskell-session)))))
    (setq haskell-session session)
    (cd (haskell-session-current-dir session))
    (let ((inhibit-read-only t))
      (erase-buffer)
      (let ((haskell-process-log nil))
        (insert (haskell-process-queue-sync-request (haskell-process) ":all-types")))
      (unless (eq major-mode  'compilation-mode)
        (compilation-mode)
        (setq compilation-error-regexp-alist
              haskell-compilation-error-regexp-alist)))))

(defun haskell-interactive-toggle-print-mode ()
  (interactive)
  (setq haskell-interactive-mode-eval-mode
        (intern
         (ido-completing-read "Eval result mode: "
                              '("fundamental-mode"
                                "haskell-mode"
                                "espresso-mode"
                                "ghc-core-mode"
                                "org-mode")))))

(defun haskell-insert-doc ()
  "Insert the documentation syntax."
  (interactive)
  (insert "-- | "))

(defun haskell-insert-undefined ()
  "Insert undefined."
  (interactive)
  (if (and (boundp 'structured-haskell-mode)
           structured-haskell-mode)
      (shm-insert-string "undefined")
    (insert "undefined")))

(defun haskell-move-right ()
  (interactive)
  (haskell-move-nested 1))

(defun haskell-move-left ()
  (interactive)
  (haskell-move-nested -1))

(defun haskell-who-calls (&optional prompt)
  "Grep the codebase to see who uses the symbol at point."
  (interactive "P")
  (let ((sym (if prompt
                 (read-from-minibuffer "Look for: ")
               (haskell-ident-at-point))))
    (let ((existing (get-buffer "*who-calls*")))
      (when existing
        (kill-buffer existing)))
    (let ((buffer
           (grep-find (format "cd %s && find . -name '*.hs' -exec grep -inH -e %s {} +"
                              (haskell-session-current-dir (haskell-session))
                              sym))))
      (with-current-buffer buffer
        (rename-buffer "*who-calls*")
        (switch-to-buffer-other-window buffer)))))

(defun haskell-auto-insert-module-template ()
  "Insert a module template for the newly created buffer."
  (interactive)
  (when (and (= (point-min)
                (point-max))
             (buffer-file-name))
    (insert
     "-- | "
     "\n"
     "\n"
     "module "
     )
    (let ((name (haskell-guess-module-name)))
      (if (string= name "")
          (progn (insert "Main")
                 (shm-evaporate (- (point) 5)
                                (point)))
        (insert name)))
    (insert " where"
            "\n"
            "\n")
    (goto-char (point-min))
    (forward-char 4)))

(defun shm-contextual-space ()
    "Do contextual space first, and run shm/space if no change in
the cursor position happened."
    (interactive)
    (if (looking-back "import")
        (call-interactively 'haskell-mode-contextual-space)
      (progn
        (let ((ident (haskell-ident-at-point)))
          (when ident
            (and interactive-haskell-mode
                 (haskell-process-do-try-type ident))))
        (call-interactively 'shm/space))))

;; Add hook

;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;;(add-hook 'haskell-interactive-mode-hook 'structured-haskell-repl-mode)
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)


;; Keybindings

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
;;(define-key interactive-haskell-mode-map (kbd "C-c C-r") 'haskell-process-load-or-reload)
;;(define-key interactive-haskell-mode-map (kbd "C-c C-R") 'haskell-process-reload-devel-main)

;;;;;;;;;;;;;;;;
;; End Haskell
;;;;;;;;;;;;;;;;

;;;;;;;;;;;;
;;
;; Purescript
;;
;;;;;;;;;;;;
(eval-after-load 'flycheck
  '(flycheck-purescript-setup))
;;;;;;;;;;;;;;;;
;; End Purescript
;;;;;;;;;;;;;;;;



;;;;;;;;;;;;
;;
;; Go Lang
;;
;;;;;;;;;;;;

(eval-after-load "go-mode"
    '(require 'flymake-go))

(require 'go-complete)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-g") 'go-goto-imports)))

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
                             (local-set-key (kbd "C-c C-k") 'godoc)))

;;(add-hook 'go-mode-hook 'go-oracle-mode)

;;;;;;;;;;;;;;;;;
;; End Go Lang
;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;
;;
;; Rust
;;
;;;;;;;;;;;;;

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq racer-rust-src-path "~/.rust/src")
(setq racer-cmd "/usr/local/bin/racer")
;;;;(add-hook 'rust-mode-hook #'racer-activate)
(eval-after-load "rust-mode" '(require 'racer))

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook 'flycheck-mode)
     
(add-hook 'rust-mode-hook
  '(lambda()
     (racer-activate)
     (racer-turn-on-eldoc)
     ;; Use company-racer in rust mode
     (set (make-local-variable 'company-backends) '(company-racer)) 
     
     ;; Key binding to jump to method definition
     (local-set-key (kbd "M-.") #'racer-find-definition)
     ;; Key binding to auto complete and indent
     (local-set-key (kbd "TAB") #'racer-complete-or-indent)
))

;; Company autocompletition
(require 'company-racer)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-racer))


;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)
;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)

;;;;;;;;;;;;;
;; End Rust
;;;;;;;;;;;;;

;;;;;;;;;;;;
;;
;; CSharp
;;
;;;;;;;;;;;;
;;(byte-compile-file (concat *main-path* "omnisharp-emacs/omnisharp.el"))

;;(require 'omnisharp)

;;(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
;;  (electric-pair-mode 1))

;;(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;;(add-hook 'csharp-mode-hook 'omnisharp-mode)

;;(add-hook 'omnisharp-mode-hook 'yas-minor-mode)

;;(add-hook 'omnisharp-mode-hook 'flycheck-mode)

;(setq omnisharp-server-executable-path "/Users/evgeniy/tmp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
;(setq omnisharp-server-executable-path "/usr/local/Cellar/omnisharp/1.9-alpha13/bin/omnisharp")

;;(add-hook 'omnisharp-mode-hook' (lambda ()
;;                              (local-set-key (kbd "M-TAB") 'omnisharp-auto-complete)))

;;(add-hook 'omnisharp-mode-hook' (lambda ()
;;                                  (local-set-key (kbd "M-,") 'pop-tag-mark)))


;;(add-hook 'omnisharp-mode-hook' (lambda ()
;;                                  (local-set-key (kbd "M-.") 'omnisharp-go-to-definition)))


;;(add-hook 'omnisharp-mode-hook' (lambda ()
;;                                  (local-set-key (kbd "M-?") 'omnisharp-find-usages)))

;;(add-hook 'omnisharp-mode-hook' (lambda ()
;;                                  (local-set-key (kbd "M-p") 'omnisharp-current-type-information)))

;;(add-hook 'omnisharp-mode-hook' (lambda ()
;;                                 (local-set-key (kbd "M-r") 'omnisharp-rename)))

;; (require 'flymake)
;; (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
;; (setq auto-mode-alist  (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; ;; Custom code to use a default compiler string for all C# files
;; (defvar my-csharp-default-compiler nil)
;; (setq my-csharp-default-compiler "mono @@FILE@@")

;; (defun my-csharp-get-value-from-comments (marker-string line-limit)
;;   my-csharp-default-compiler)

;; (add-hook 'csharp-mode-hook (lambda ()
;;                               (if my-csharp-default-compiler
;;                                   (progn
;;                                     (fset 'orig-csharp-get-value-from-comments
;;                                           (symbol-function 'csharp-get-value-from-comments))
;;                                     (fset 'csharp-get-value-from-comments
;;                                           (symbol-function 'my-csharp-get-value-from-comments))))
;;                               (flymake-mode)))

;;;;;;;;;;;;;;;;;
;; End CSharp
;;;;;;;;;;;;;;;;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "#528fd1"))))
 '(font-lock-function-name-face ((t (:foreground "#6aaf50"))))
 '(font-lock-keyword-face ((t (:foreground "#5180b3"))))
 '(font-lock-type-face ((t (:foreground "#cd5542"))))
 '(font-lock-variable-name-face ((t (:foreground "#baba36"))))
 '(neo-expand-btn-face ((t (:foreground "SkyBlue"))))
 '(scala-font-lock:final-face ((t (:foreground nil))))
 '(scala-font-lock:override-face ((t (:foreground nil))))
 '(scala-font-lock:private-face ((t (:foreground nil))))
 '(scala-font-lock:sealed-face ((t (:foreground nil))))
 '(scala-font-lock:var-face ((t (:foreground "DarkOliveGreen3")))))
