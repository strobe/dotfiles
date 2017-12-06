;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `a4ll', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     python
     html
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     org
     osx
     themes-megapack
     git
     auto-completion
     scala
     purescript
     pandoc
     haskell
     csharp
     markdown
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'ansi-term
            shell-default-term-shell "/bin/bash")
     spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(all-the-icons
                                      terraform-mode
                                      w3m
                                      helm-w3m
                                      bash-completion
                                      etags-select
                                      darkroom
                                      cc-mode
                                      ;org-pandoc
                                      transpose-frame
                                      multiple-cursors
                                      peep-dired
                                      tabbar
                                      ghub
                                      magithub
                                      dash-at-point
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         ;majapahit-dark
                         ;sanityinc-tomorrow-bright
                         ;soft-charcoal
                         phoenix-dark-mono
                         ;niflheim
                         ;flatland
                         darkokai
                         hc-zenburn
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Input Mono Compressed";;"Monoid";;"Fira Code";;"Source Code Pro"
                               :size 14
                               :weight medium
                               :width compressed
                               :powerline-scale 1.1)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; ensime
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  (push '("ensime" . "melpa-stable") package-pinned-packages)

  ;; terminal
  (setq-default dotspacemacs-configuration-layers
                '((shell :variables shell-default-shell 'ansi-term)))
  (setq-default dotspacemacs-configuration-layers
                '((shell :variables shell-default-term-shell "/bin/bash")))

  (setq-default dotspacemacs-configuration-layers
                '(auto-completion
                  (haskell :variables haskell-completion-backend 'ghc-mod)))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for useyr code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'helm-bookmark) ;; fix for https://github.com/syl20bnr/spacemacs/pull/9547
 
  (defalias 'list-buffer 'ibuffer) ; make ibuffer default
  (defalias 'buffer-menu 'ibuffer)


  ;; (use-package magithub
    ;; :after magit
    ;; :config (magithub-feature-autoinject t))
  (require 'magithub-issue-view)
  ;; magithub
  (require 'ghub)
  (require 'magithub)
  (magithub-feature-autoinject 'pull-request-merge)
  (magithub-feature-autoinject 'pull-request-checkout)

  ;; set scrathc buffer after start - see https://github.com/syl20bnr/spacemacs/issues/6899
  (when (string= "*scratch*" (buffer-name))
    (spacemacs/switch-to-scratch-buffer)
  )

  (menu-bar-mode t) ;; menu

  ;; Tabbar Settings ;;
  ;; (progn (tabbar-mode t)
  ;; (setq tabbar-use-images nil)
  ;; (global-set-key [(control shift tab)] 'tabbar-forward)
  ;; (global-set-key [(control meta shift tab)] 'tabbar-backward)

  ;; (when (display-graphic-p) ; set custom tabbars color
  ;;  (set-face-attribute
  ;;  'tabbar-default nily
  ;;  :background "gray15" :foreground "grey40" :height 0.8
  ;;  :box '(:line-width 1 :color "gray20" :style nil))

  ;; (set-face-attribute
  ;;  'tabbar-unselected nil
  ;;  :foreground "gray40"
  ;;  :background "gray20"
  ;;  :box '(:line-width 5 :color "gray20" :style nil))

  ;; (set-face-attribute
  ;;  'tabbar-selected nil
  ;;  :foreground "#C39C67"
  ;;  :background "gray28"
  ;;  :box '(:line-width 5 :color "gray28" :style nil))

  ;; (set-face-attribute
  ;;  'tabbar-highlight nil
  ;;  :background "gray33"
  ;;  :foreground "black"
  ;;  :underline nil
  ;;  :box '(:line-width 5 :color "gray33" :style nil))

  ;; (set-face-attribute
  ;;  'tabbar-button nil
  ;;  :background "gray16"
  ;;  :box '(:line-width 1 :color "gray16" :style nil))

  ;; (set-face-attribute
  ;;  'tabbar-separator nil
  ;;  :background "gray20"
  ;;  :height 0.6)

  ;; (set-face-attribute
  ;;  'tabbar-modified nil
  ;;  :foreground "gray30"
  ;;  :background "gray20"
  ;;  :box '(:line-width 5 :color "gray20" :style nil))

  ;; (set-face-attribute
  ;;  'tabbar-selected-modified nil
  ;;  :foreground "#995566"
  ;;  :background "gray23"
  ;;  :box '(:line-width 5 :color "gray23" :style nil))
  ;; ))

  ;; customize powerline color to has better fit with toolbar
  (set-face-attribute 'powerline-inactive2 nil
                      :background "gray18")

  ;; Change padding of the tabs
  ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
  (custom-set-variables
   '(tabbar-separator (quote (0.5))))
  ;; adding spaces
  (defun tabbar-buffer-tab-label (tab)
    "Return a label for TAB.
     That is, a string used to represent it on the tab bar."
    (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                    (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

    (defun tabbar-buffer-groups-function ()
    "Returns the name of the tab group names the current buffer belongs to."
    (list (cond ((member (buffer-name)
                         '("*scratch*")) "user")
                ((eq major-mode
                     'dired-mode) "user")
                ((memq major-mode
                       '(tex-mode latex-mode text-mode xml-mode)) "user")
                ((memq major-mode
                       '(fundamental-mode help-mode apropos-mode Info-mode Man-mode)) "misc")
                ((memq major-mode
                       '(comint-mode compilation-mode minibuffer-inactive-mode neotree-mode)) "misc")
                ((string-equal "TAGS" (buffer-name)) "misc")
                ((string-equal "org-src-" (substring (buffer-name) 0 8)) "misc")
                ((string-equal "*helm" (substring (buffer-name) 0 5)) "misc")
                ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
                (t "user"))))

  (setq tabbar-buffer-groups-function 'tabbar-buffer-groups-function)
  ;; ;;

  ;; Add window to the right of two horizontally split windows
  (defun split-root-window (size direction)
    (split-window (frame-root-window)
                  (and size (prefix-numeric-value size))
                  direction))

  (defun split-root-window-below (&optional size)
    (interactive "P")
    (split-root-window size 'below))

  (defun my-split-root-window-right (&optional size)
    (interactive "P")
    (split-root-window size 'right))
  ;;

  ;; enable darkroom mode
  (require 'darkroom)

  ;; truncate lines
  (set-default 'truncate-lines t)
  (setq truncate-partial-width-windows nil)

  ;; terminal
  (setq multi-term-program "/bin/bash")
  '(shell-file-name "/bin/bash")

  ;; bash completion
  (autoload 'bash-completion-dynamic-complete 
    "bash-completion"
    "BASH completion hook")
  (add-hook 'shell-dynamic-complete-functions
            'bash-completion-dynamic-complete)
  (bash-completion-setup)

  ;; ensime
  (setq ensime-startup-notification nil)
  (setq ensime-startup-snapshot-notification nil)

  ;; indent configuration for case like
  ;;      val t = stream
  ;;        .map(v => {
  ;;          logger.warn(v.toString())
  ;;          val j = compact(render(v))
  (setq scala-indent:align-parameters nil)
  ;; ensime - etags-select (see: http://ensime.org/editors/emacs/hacks/#tags
  ;;   and https://gist.github.com/salomvary/3372e9cd40f5b09a928b)
  (defun ensime-edit-definition-with-fallback ()
    "Variant of `ensime-edit-definition' with ctags if ENSIME is not available."
    (interactive)
    (unless (and (ensime-connection-or-nil)
                 (ensime-edit-definition nil))
      (projectile-find-tag)))

  (defun ensime-settings ()
    (setq evil-mode nil)
    (bind-key "M-." 'ensime-edit-definition-with-fallback ensime-mode-map)
    (bind-key "<s-mouse-1>" 'ensime-edit-definition-with-fallback ensime-mode-map))

  (add-hook 'scala-mode-hook 'ensime-settings)

  (defun linum-hook () (linum-mode 1))
  (add-hook 'elisp-mode-hook 'linum-hook)

  ;; ctags for non ensime modes
  (global-set-key (kbd "M-.") 'projectile-find-tag)
  (global-set-key (kbd "M-,") 'pop-tag-mark)

  (defun generate-scala-etags ()
    (interactive)
    (let* ((project-root (projectile-project-root))
           (tags-exclude (projectile-tags-exclude-patterns))
           (default-directory project-root)
           (tags-file (expand-file-name projectile-tags-file-name))
           (command (format "sctags -f TAGS -e -R \"%s\" %s" tags-file tags-exclude))
           shell-output exit-code)
      )
    )
  ;;(defun scala-mode-settings ()
  ;;  (setq projectile-tags-command "sctags -e -R \"%s\" %s")
  ;;  )
  ;;(add-hook 'scala-mode-hook 'scala-mode-settings)

  ;; If necessary, make sure "sbt" and "scala" are in the PATH environment
  ; (setenv "PATH" (concat "/usr/local/bin/sbt:" (getenv "PATH")))
  ; (setenv "PATH" (concat "/usr/local/bin/scala:" (getenv "PATH")))

  ;; neotree ;;
  (global-set-key (kbd "<f8>") 'neotree-toggle)
  (setq neo-theme 'arrow)
  (setq neo-show-updir-line t)
  (setq neo-smart-open t)
  (setq neo-show-hidden-files t)

  (defun neotree-project-dir-toggle ()
    "Open NeoTree using the project root, using find-file-in-project, or the current buffer directory."
    (interactive)
    (let ((project-dir
           (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
                                        ; (projectile-project-root)
             (ffip-project-root)
             ))
          (file-name (buffer-file-name))
          (neo-smart-open t))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
        (progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-projectile-action)
            (neotree-find file-name))))))

  (global-set-key (kbd "<f7>") 'neotree-project-dir-toggle);;neotree-projectile-action)
  ;; ;;

  ;; short yes/no
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; open buffer-menu insted buffer-menu-other-window
  (global-set-key (kbd "C-x C-b") 'buffer-menu)

  ;; enable linum-mode by default
  ;;(global-linum-mode t)
  (setq linum-mode-inhibit-modes-list '(eshell-mode
                                        shell-mode
                                        erc-mode))
  (defadvice linum-on (around linum-on-inhibit-for-modes)
    "Stop the load of linum-mode for some major modes."
    (unless (member major-mode linum-mode-inhibit-modes-list)
      ad-do-it))

  (ad-activate 'linum-on)

  (defun linum-hook () (linum-mode 1))
  ;;(add-hook 'elisp-mode-hook 'linum-hook)
  ;;(add-hook 'haskell-mode-hook 'linum-hook)
  ;;(add-hook 'scala-mode-hook 'linum-hook)
  ;;

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
      ;(run-hook-with-args 'window-scroll-functions )
      (scroll-down-line))
    (setq alternating-scroll-down-next (not alternating-scroll-down-next)))

  (defun alternating-scroll-up-line ()
    (interactive "@")
    (when alternating-scroll-up-next
      ;(run-hook-with-args 'window-scroll-functions)
      (scroll-up-line))
    (setq alternating-scroll-up-next (not alternating-scroll-up-next)))

  (global-set-key (kbd "<mouse-4>") 'alternating-scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'alternating-scroll-up-line)
  ;; end of terminal  mouse scroll ;;

  ;; move line
  (defun move-text-default-bindings2 ()
   "Bind `move-text-up' and `move-text-down' to M-up and M-down."
   (require 'move-text)
   (global-set-key (kbd "ESC <up>") 'move-text-up)
   (global-set-key (kbd "ESC <down>") 'move-text-down)
   (global-set-key (kbd "M-<up>") 'move-text-up)
   (global-set-key (kbd "M-<down>") 'move-text-down))
  (move-text-default-bindings2)

  ;; comment line
  (global-set-key (kbd "s-/") 'spacemacs/comment-or-uncomment-lines-inverse)

  ;; show current buffer file path
  (defun buffer-file-path ()
    "Show the full path file name in the minibuffer."
    (interactive)
    (message (buffer-file-name)))

  ;; dublicate line
  (defun duplicate-line (arg)
    "Duplicate current line, leaving point in lower line."
    (interactive "*p")

    ;; save the point for undo
    (setq buffer-undo-list (cons (point) buffer-undo-list))

    ;; local variables for start and end of line
    (let ((bol (save-excursion (beginning-of-line) (point)))
          eol)
      (save-excursion
        ;; don't use forward-line for this, because you would have
        ;; to check whether you are at the end of the buffer
        (end-of-line)
        (setq eol (point))

        ;; store the line and disable the recording of undo information
        (let ((line (buffer-substring bol eol))
              (buffer-undo-list t)
              (count arg))
          ;; insert the line arg times
          (while (> count 0)
            (newline)         ;; because there is no newline in 'line'
            (insert line)
            (setq count (1- count)))
          )
        ;; create the undo information
        (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
      ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

  (global-set-key (kbd "s-d") 'duplicate-line)
  ;; -- Org mode -- ;;

  (let ((files-paths '("~/Dropbox/dev/10_org/"))
        (notes-path (expand-file-name "~/Dropbox/dev/10_org/notes.org")))
    (setq org-directory (expand-file-name "~/Dropbox/dev/10_org/"))
    ;; capture
    (setq org-default-notes-file notes-path)
    (setq org-capture-templates
          '(("t" "todo" entry (file+headline (lambda ()(concat org-directory "notes.org")) "Tasks")
             "* TODO %?\n %U\n")

            ("n" "random note" entry (file+headline (lambda ()(concat org-directory "notes.org")) "Random")
             "* %? :NOTE:\n%U\n")

            ("w" "work note" entry (file+headline (lambda ()(concat org-directory "notes.org")) "Work Notes")
             "* %? :NOTE\n \n%U\n")

            ("h" "home note" entry (file+headline (lambda ()(concat org-directory "notes.org")) "Home Notes")
             "* %? :NOTE:\n%U\n")

            ("j" "journal" entry (file+olp+datetree (lambda ()(concat org-directory "journal.org")))
             "* %?\nEntered on %U\n  %i\n")
            ))

    ;; agenda
    (setq org-agenda-files files-paths)
    (setq org-icalendar-include-todo t)
    ;; mobile
    ;;(setq org-mobile-files "path/to/other/files")
    (setq org-mobile-inbox-for-pull notes-path)
    (setq org-mobile-directory "~/Dropbox/apps/strobe-MobileOrg/"))

  (setq org-agenda-custom-commands
        '(("h" tags-todo "CATEGORY=\"home\"")
          ("w" tags-todo "CATEGORY=\"work\"")
          ;; other custom agenda commands here
          ))

  ;; ditaa for org mode configuration (aka ANSI -> Diagrams)
  (setq org-confirm-babel-evaluate nil)
  (setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.10/libexec/ditaa0_10.jar")
  (org-babel-do-load-languages 'org-babel-load-languages '((ditaa . t)))
  (setq org-export-allow-BIND t)

  ;; -- end -- ;;

  ;; -- Haskell -- ;;

  (defun haskell-settings ()
    ;; ghc-mod
    (autoload 'ghc-init "ghc" nil t)
    (autoload 'ghc-debug "ghc" nil t)
    (ghc-init)
    ;; company-ghc
    (company-mode t)
    (auto-complete-mode t)
    (add-to-list 'company-backends 'company-ghc)
    (add-to-list 'company-backends-haskell-mode
                 '(company-ghc company-dabbrev-code company-yasnippet))
    (custom-set-variables '(company-ghc-show-info t))

    (lambda () (global-set-key (kbd "M-<tab>") 'company-complete))
    (define-key haskell-mode-map (kbd "M-<tab>") 'company-complete))

  (add-hook 'haskell-mode-hook 'haskell-settings)

  (setq dumb-jump-force-searcher 'ag)
  (setq dumb-jump-selector 'helm)
  ;(add-hook 'after-init-hook 'global-company-mode)

  ;; -- end -- ;;

  ;; helm-swoop
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)

  ;; helm keybinds
  (global-set-key (kbd "M-s-n") 'helm-projectile-find-file)

  (require 'multiple-cursors)
  (global-set-key (kbd "M-m c") 'mc/edit-lines)
  (global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)

  ;; -- Osx related -- ;;

  (autoload 'dash-at-point "dash-at-point"
    "Search the word at point with Dash." t nil)
  ;;(global-set-key "\C-cd" 'dash-at-point)

  (if (executable-find "trash")
      (defun system-move-file-to-trash (file)
        "Use `trash' to move FILE to the system trash.
        Can be installed with `brew install trash', or `brew install osxutils`''."
        (call-process (executable-find "trash") nil 0 nil file))
    ;; regular move to trash directory
    (setq trash-directory "~/.Trash/emacs"))

  ;; -- end -- ;;

  ;; peed-dired
  (setq peep-dired-cleanup-on-disable t)
  (setq peep-dired-cleanup-eagerly t)
  (setq peep-dired-ignored-extensions '("mkv" "iso" "mp4" "dmg" "zip" "rar" "avi" "mp3" "hs"))

  ;; dired default target dir (for mc like operations)
  (setq dired-dwim-target t)

  ;; font
  (when (display-graphic-p)
    (set-face-attribute 'default nil :family "Input Mono Compressed" :height 140)
    ;; (set-face-attribute 'default nil :family "Input" :height 140)
    ;; (set-face-attribute 'default nil :family "Monoid" :height 140)
    ;; (set-face-attribute 'default nil :font "Hasklig" :height 140)
    ;; (set-face-attribute 'default nil :family "Fira Code" :height 140)
  )



)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-ghc-show-info t)
 '(compilation-message-face (quote default))
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(ensime-implicit-gutter-icons nil)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(gnus-logo-colors (quote ("#0d7b72" "#adadad")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format " %3i ")
 '(magit-diff-use-overlays nil)
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#303030")
 '(pos-tip-foreground-color "#FFFFC8")
 '(powerline-color1 "#3d3d68")
 '(powerline-color2 "#292945")
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(shell-file-name "/bin/bash")
 '(speedbar-show-unknown-files t)
 '(tabbar-separator (quote (0.5)))
 '(vc-annotate-background "#f6f0e1")
 '(vc-annotate-color-map
   (quote
    ((20 . "#e43838")
     (40 . "#f71010")
     (60 . "#ab9c3a")
     (80 . "#9ca30b")
     (100 . "#ef8300")
     (120 . "#958323")
     (140 . "#1c9e28")
     (160 . "#3cb368")
     (180 . "#028902")
     (200 . "#008b45")
     (220 . "#077707")
     (240 . "#259ea2")
     (260 . "#358d8d")
     (280 . "#0eaeae")
     (300 . "#2c53ca")
     (320 . "#1111ff")
     (340 . "#2020cc")
     (360 . "#a020f0"))))
 '(vc-annotate-very-old-color "#a020f0")
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff"))
 '(xterm-color-names
   ["#303030" "#D66F84" "#D79887" "#D49A8A" "#94B1A3" "#A8938C" "#989584" "#BAB2A9"])
 '(xterm-color-names-bright
   ["#3A3A3A" "#E47386" "#CC816B" "#769188" "#7D6F6A" "#9C8772" "#BAB2A9"]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ensime-implicit-highlight ((t (:underline "#224455"))))
 '(eval-sexp-fu-flash ((t (:background "#223344" :foreground "gray"))))
 '(flymake-warnline ((t (:background "#1d1f21" :underline (:color "#6B5732" :style wave)))))
 '(powerline-active2 ((t (:background "gray25" :foreground "#c5c8c6"))))
 '(spacemacs-emacs-face ((t (:background "gray30" :foreground "gray70" :inherit (quote mode-line)))))
 '(w3m-anchor ((t (:foreground "SteelBlue3"))))
 '(w3m-arrived-anchor ((t (:foreground "RoyalBlue3")))))
