;;;; Nyxt Passwords Modules

;;; Commentary:
;;; Note: Inorder to activate and be able to save new passwords, `save-new-password',
;;; you need to first instantiate via `copy-passowrd' or `copy-username'

;;; References
;;; 1. https://nyxt.atlas.engineer/documentation#keepassxc-support
;;; 2. https://github.com/aartaka/nyxt-config/tree/master
;;; 3. Look into `sera:resolve-executable'
;;;    (sera:resolve-executable "keepassxc-cli")

(in-package #:nyxt-user)

(defmethod initialize-instance :after ((interface password:keepassxc-interface)
                                       &key &allow-other-keys)
  (setf (password:password-file interface) "/home/logoraz/Documents/moses/p.kdbx"
        (password:key-file interface) "/home/logoraz/Documents/moses/pkf"
        (password:yubikey-slot interface) nil))

(define-configuration nyxt/mode/password:password-mode
  ((password-interface (make-instance 'password:keepassxc-interface))))

;; https://github.com/atlas-engineer/nyxt/issues/3213
;; (define-configuration password:keepassxc-interface
;;   ((password:executable (str:split " " "flatpak-spawn --host keepassxc-cli"))))

(define-configuration buffer
    ((default-modes `(password-mode ,@%slot-value%))))
