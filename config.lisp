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

;;; Nyxt custom modifications
;; Loading files from the same directory (~/.config/nyxt/).
(define-nyxt-user-system-and-load nyxt-user/basic-config
  :components ("theme"
               "passwords"
               ;; "passwords-dev"
               "utilities"))

;;; Base broswer/buffer configurations
(define-configuration browser
  ((restore-session-on-startup-p nil)))

(define-configuration buffer
    ((default-modes `(emacs-mode ,@%slot-value%))))

;; Keeping for reference, prefer bookmarks to be kept in default location: ~/.local/share/nyxt/
;; (defmethod files:resolve ((profile nyxt:nyxt-profile) (file nyxt/mode/bookmark:bookmarks-file))
;;   "Reroute bookmarks to the `.config/nyxt/' directory."
;;   #p"~/Documents/moses/bookmarks.lisp")

;;; Load External Packages/Libraries
;; (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
;;                                        (user-homedir-pathname))))
;;   (when (probe-file quicklisp-init)
;;     (load quicklisp-init)))
