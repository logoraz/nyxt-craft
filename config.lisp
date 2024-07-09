;;;; Nyxt Configuration - Initialization File

;;; Commentary:
;;; Set Mode & Browser Settings

;;; References
;;; 1. https://github.com/aartaka/nyxt-config/tree/master
;;; 2. https://discourse.atlas.engineer/t/where-is-the-download-directory-specified/285
;;;    Set XDG_DOWNLOAD_DIR in start-stumpwm.sh -> should define custom XDG env vars there!
;;;    see: nyxt:describe-function?fn=%1Bxdg-download-dir&function=%1Bxdg-download-dir
;;; 3. TBD
;;; 4. TBD

(in-package #:nyxt-user)

;;; Reset ASDF registries to allow loading Lisp systems from
;;; everywhere.
;; #+nyxt-3 (reset-asdf-registries)

;;; Load quicklisp
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

;;; TODO - perhaps set for a specialized class
(defvar *buffer-modes*
  '(emacs-mode)
  "Mode to enable in parent class `buffer' to apply to all child buffer classes.")

;;; Loading files from the same directory (~/.config/nyxt/).
(define-nyxt-user-system-and-load nyxt-user/basic-config
  :components ("theme"
               "passwords"
               ;; "passwords-dev"
               "utilities"))

;;; Don't restore previous session for now
(define-configuration browser
  ((restore-session-on-startup-p nil)))

;;;
(define-configuration buffer
  ((default-modes `(,@*buffer-modes* ,@%slot-value%))))

(defmethod files:resolve ((profile nyxt:nyxt-profile) (file nyxt/mode/bookmark:bookmarks-file))
  "Reroute bookmarks to the `.config/nyxt/' directory."
  #p"~/.config/nyxt/bookmarks.lisp")
