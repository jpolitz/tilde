;; add'l include directory
(add-to-list 'load-path "~/.emacs.d")
(autoload 'javascript-mode "javascript" nil t)
(autoload 'rainbow-mode "rainbow-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;; Copy pasted the second html instruction from a website somewhere
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))

(add-to-list 'auto-mode-alist '("\\.ml?\\'" . tuareg-mode))

;; ruby syntax highlighting
;loads ruby mode when a .rb file is opened.
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))

;; I ususally use .ljs, .dsg, .anf for the sexp syntax
(add-to-list 'auto-mode-alist '("\\.ljs\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.dsg\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.anf\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.expr\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.df\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.cps\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.scrbl\\'" . scheme-mode))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.hop\\'" . scheme-mode))


;; These look more like js -- Arjun likes to use jsl for his \JS
(add-to-list 'auto-mode-alist '("\\.es5\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.lambdajs\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.jsl\\'" . javascript-mode))

(defun no-op () (interactive)
  ())

(setq inhibit-splash-screen t)
(set-foreground-color "#ffffff")
(set-background-color "#000000")
(setq column-number-mode 1)

;; nice default keys
(global-set-key "\C-l" 'backward-delete-char)
(global-set-key "\C-z" 'no-op) ;; I hate backgrounding
(global-set-key "\C-d" 'delete-char)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\M-c" 'backward-word)
(global-set-key "\C-t" 'transpose-lines)
(global-set-key "\C-xy" 'copy-region-as-kill)
(global-set-key "\C-x\C-y" 'kill-region)
(global-set-key "\C-xp" 'fill-paragraph)
(global-set-key "\C-x\C-p" 'fill-paragraph)
(global-set-key "\C-cs" 'rgrep)
(global-set-key "\C-c\C-s" 'rgrep)
(global-set-key "\C-x\C-r" 'replace-string)
(global-set-key "\C-xj" 'join-line)
(global-set-key "\C-x\C-l" 'count-lines-region)
(global-set-key "\C-x\C-h" 'mark-whole-buffer)

(defun shell-make () (interactive)
  (compile "make -k"))

(defun shell-make-clean () (interactive)
  (compile "make clean"))

(global-set-key "\C-xm" 'shell-make)
(global-set-key "\C-cm" 'shell-make)
(global-set-key "\C-c\C-c" 'shell-make-clean)

(defun compilation-buffer-resize (buffer string)
  (cond ((string-match "finished" string)
         (bury-buffer buffer)
         (delete-windows-on buffer)
         (fit-window-to-buffer (get-buffer-window buffer) (/ (- (frame-height) 2) 2)))))

(add-hook 'compilation-finish-functions 'compilation-buffer-resize)


;; because I just can't go without
(defun insert-lambda () (interactive)
  (ucs-insert #x3BB))
(global-set-key "\C-\\" 'insert-lambda )

(defun tex-symbol-insert () (interactive)
  ; grab the start and end positions of a word (or any other thing)
  (setq myBoundaries (bounds-of-thing-at-point 'symbol)) 
  
  ; get the beginning and ending positions
  (setq p1 (car myBoundaries))
  (setq p2 (cdr myBoundaries))

  ; grab it
  (setq myMeat (buffer-substring-no-properties p1 p2))

  (defun replace (p1 p2 r)
    (delete-region p1 p2)
    (goto-char p1)
    (insert r))

  (setq lookup (assoc myMeat tex-shortcut-table))
  (if lookup
      (replace p1 p2 (second lookup))
      ))
(global-set-key "\M-\\" 'tex-symbol-insert)

;; Ripped this from mrlib/tex-table.rkt in racket repo
(defvar tex-shortcut-table
  '(("Downarrow" "⇓")
    ("nwarrow" "↖")
    ("downarrow" "↓")
    ("Rightarrow" "⇒")
    ("rightarrow" "→")
    ("mapsto" "↦")
    ("searrow" "↘")
    ("swarrow" "↙")
    ("leftarrow" "←")
    ("uparrow" "↑")
    ("Leftarrow" "⇐")
    ("longrightarrow" "−")
    ("Uparrow" "⇑")
    ("Leftrightarrow" "⇔")
    ("updownarrow" "↕")
    ("leftrightarrow" "↔")
    ("nearrow" "↗")
    ("Updownarrow" "⇕")
    ("aleph" "א")
    ("prime" "′")
    ("emptyset" "∅")
    ("nabla" "∇")
    ("diamondsuit" "♦")
    ("spadesuit" "♠")
    ("clubsuit" "♣")
    ("heartsuit" "♥")
    ("sharp" "♯")
    ("flat" "♭")
    ("natural" "♮")
    ("surd" "√")
    ("neg" "¬")
    ("triangle" "△")
    ("forall" "∀")
    ("exists" "∃")
    ("infty" "∞")
    ("circ" "∘")
    ("Alpha" "Α") 
    ("alpha" "α")
    ("theta" "θ")
    ("tau" "τ")
    ("beta" "β")
    ("vartheta" "θ")
    ("pi" "π")
    ("upsilon" "υ")
    ("gamma" "γ")
    ("varpi" "π")
    ("phi" "φ")
    ("delta" "δ")
    ("kappa" "κ")
    ("rho" "ρ")
    ("varphi" "φ")
    ("epsilon" "ε")
    ("lambda" "λ")
    ("varrho" "ρ")
    ("chi" "χ")
    ("varepsilon" "ε")
    ("mu" "μ")
    ("sigma" "σ")
    ("psi" "ψ")
    ("zeta" "ζ")
    ("nu" "ν")
    ("varsigma" "ς")
    ("omega" "ω")
    ("eta" "η")
    ("xi" "ξ")
    ("iota" "ι")
    ("Gamma" "Γ")
    ("Lambda" "Λ")
    ("Sigma" "Σ")
    ("Psi" "Ψ")
    ("Delta" "∆")
    ("Xi" "Ξ")
    ("Upsilon" "Υ")
    ("Omega" "Ω")
    ("Theta" "Θ")
    ("Pi" "Π")
    ("Phi" "Φ")
    ("pm" "±")
    ("cap" "∩")
    ("diamond" "◇")
    ("oplus" "⊕")
    ("mp" "∓")
    ("cup" "∪")
    ("bigtriangleup" "△")
    ("ominus" "⊖")
    ("times" "×")
    ("uplus" "⊎")
    ("bigtriangledown" "▽")
    ("otimes" "⊗")
    ("div" "÷")
    ("sqcap" "⊓")
    ("triangleleft" "▹")
    ("oslash" "⊘")
    ("ast" "∗")
    ("sqcup" "⊔")
    ("vee" "∨")
    ("wedge" "∧")
    ("triangleright" "◃")
    ("odot" "⊙")
    ("star" "★")
    ("dagger" "†")
    ("bullet" "•")
    ("ddagger" "‡")
    ("wr" "≀")
    ("amalg" "⨿")
    ("leq" "≤")
    ("geq" "≥")
    ("equiv" "≡")
    ("models" "⊨")
    ("prec" "≺")
    ("succ" "≻")
    ("sim" "∼")
    ("perp" "⊥")
    ("top" "⊤")
    ("preceq" "≼")
    ("succeq" "≽")
    ("simeq" "≃")
    ("ll" "≪")
    ("gg" "≫")
    ("asymp" "≍")
    ("parallel" "∥")
    ("subset" "⊂")
    ("supset" "⊃")
    ("approx" "≈")
    ("bowtie" "⋈")
    ("subseteq" "⊆")
    ("supseteq" "⊇")
    ("cong" "≌")
    ("sqsubsetb" "⊏")
    ("sqsupsetb" "⊐")
    ("neq" "≠")
    ("smile" "⌣")
    ("sqsubseteq" "⊑")
    ("sqsupseteq" "⊒")
    ("doteq" "≐")
    ("frown" "⌢")
    ("in" "∈")
    ("ni" "∋")
    ("propto" "∝")
    ("vdash" "⊢")
    ("dashv" "⊣")
    
    ("sqrt" "√")
    
    ("skull" "☠") 
    ("smiley" "☺")
    ("blacksmiley" "☻")
    ("frownie" "☹")
    
    ("S" "§")

    ("newpage" "\f")

    ))

(set-fill-column 70)

(set-face-attribute 'default nil :height 100)

;; no menu bar or toolbar
(menu-bar-mode 0)
(tool-bar-mode -1)

;; never ever indent with tabs
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; don't make backup files
(setq backup-inhibited t)
(setq auto-save-default nil)

;; help?
(setq completion-auto-help t)

;; automatically highlight
(global-font-lock-mode 1)

;; refresh a file from disk (confirm if its modified)
(defun refresh-file ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t)
  )
(global-set-key [f5] 'refresh-file)

;; word counting
;;; First version; has bugs!
(defun count-words-region (beginning end)
  "Print number of words in the region.
Words are defined as at least one word-constituent
character followed by at least one character that
is not a word-constituent.  The buffer's syntax
table determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")

; 1. Set up appropriate conditions.
  (save-excursion
    (goto-char beginning)
    (let ((count 0))

; 2. Run the while loop.
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (setq count (1+ count)))

; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))



