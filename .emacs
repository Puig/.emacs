;; emacs configuration file

;; Set user information 
(setq user-full-name "Juan Puig Martinez")
(setq user-mail-address "puig@lindenlab.com")


;; Erlang Emacs Mode -- Configuration Start
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.8/emacs" load-path))
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
;; Erlang Emacs Mode -- Configuration End

(add-to-list 'load-path "~/dev/src/edts")
(require 'edts-start)


;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path "~/dev/eqc-1.26.2/emacs/")
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "~/dev/eqc-1.26.2")
;; EQC Emacs Mode -- Configuration End

;; Variables
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Misc
(column-number-mode)
(delete-selection-mode 1)
(linum-mode)
(show-paren-mode)

;; Ido-mode - Shows folder contents while looking for a file.
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Stolen from http://www.emacswiki.org/emacs/FlyMake
;; Shows flymake message even in xterm by typing C-c f
;; (defun my-flymake-err-at (pos)
;;   (let ((overlays (overlays-at pos)))
;;     (remove nil
;;             (mapcar (lambda (overlay)
;;                       (and (overlay-get overlay 'flymake-overlay)
;;                            (overlay-get overlay 'help-echo)))
;;                     overlays))))
 
;; (defun my-flymake-err-echo ()
;;   (interactive)
;;   (message "%s" (mapconcat 'identity (my-flymake-err-at (point)) "\n")))
 
;; (global-set-key (kbd "C-c f") 'my-flymake-err-echo)

;; ;; Avoids some flymake crashses.

;; (eval-after-load "flymake"
;;     '(setq flymake-gui-warnings-enabled nil
;;            flymake-log-level 0))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(require 'package)
(package-initialize)

(eval-after-load "magit" 
  '(mapc (apply-partially 'add-to-list 'magit-repo-dirs)
               '("~/dev/src/cloudshare" "~/dev/src/tessellate")))

;; go mode
(setq load-path (cons "/usr/local/go/misc/emacs" load-path))
(require 'go-mode-load)

;; .org
(setq load-path (cons "~/Downloads/Other/org-mode/lisp" load-path))
(setq load-path (cons "~/Downloads/Other/org-mode/contrib/lisp" load-path))
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
