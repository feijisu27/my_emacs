((anything-gtags status "installed" recipe
                 (:name anything-gtags :auto-generated t :type emacswiki :description "GNU GLOBAL anything.el interface" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/anything-gtags.el"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))))
 (auto-complete-clang status "installed" recipe
                      (:name auto-complete-clang :website "https://github.com/brianjcj/auto-complete-clang" :description "Auto-complete sources for Clang. Combine the power of AC, Clang and Yasnippet." :type github :pkgname "brianjcj/auto-complete-clang" :depends auto-complete))
 (auto-complete-clang-extension status "installed" recipe
                                (:name auto-complete-clang-extension :auto-generated t :type emacswiki :description "Extension for Clang auto completion." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/auto-complete-clang-extension.el"))
 (auto-complete-clang-objc status "installed" recipe
                           (:name auto-complete-clang-objc :description "Emacs auto-complete clang backend for Objective C devlepment for iOS" :type github :pkgname "yasuyk/auto-complete-clang-objc" :depends
                                  (auto-complete popup)))
 (cedet status "installed" recipe
        (:name cedet :website "http://cedet.sourceforge.net/" :description "CEDET is a Collection of Emacs Development Environment Tools written with the end goal of creating an advanced development environment in Emacs." :type git :url "http://git.code.sf.net/p/cedet/git" :build
               `(("sh" "-c" "touch `find . -name Makefile`")
                 ("make" ,(format "EMACS=%s"
                                  (shell-quote-argument el-get-emacs))
                  "clean-all")
                 ("make" ,(format "EMACS=%s"
                                  (shell-quote-argument el-get-emacs)))
                 ("make" ,(format "EMACS=%s"
                                  (shell-quote-argument el-get-emacs))
                  "-C" "contrib"))
               :build/berkeley-unix
               `(("sh" "-c" "touch `find . -name Makefile`")
                 ("gmake" ,(format "EMACS=%s"
                                   (shell-quote-argument el-get-emacs))
                  "clean-all")
                 ("gmake" ,(format "EMACS=%s"
                                   (shell-quote-argument el-get-emacs)))
                 ("gmake" ,(format "EMACS=%s"
                                   (shell-quote-argument el-get-emacs))
                  "-C" "contrib"))
               :build/windows-nt
               `(("sh" "-c" "touch `/usr/bin/find . -name Makefile` && make FIND=/usr/bin/find"))
               :features nil :lazy nil :post-init
               (if
                   (or
                    (featurep 'cedet-devel-load)
                    (featurep 'eieio))
                   (message
                    (concat "Emacs' built-in CEDET has already been loaded!  Restart" " Emacs to load CEDET from el-get instead."))
                 (load
                  (expand-file-name "cedet-devel-load.el" pdir)))))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (clang-format status "installed" recipe
               (:name clang-format :description "Clang-format emacs integration for use with C/Objective-C/C++." :type http :url "https://llvm.org/svn/llvm-project/cfe/trunk/tools/clang-format/clang-format.el" :depends
                      (json)
                      :prepare
                      (progn
                        (autoload 'clang-format-region "clang-format" nil t)
                        (autoload 'clang-format-buffer "clang-format" nil t))))
 (cmake-mode status "installed" recipe
             (:name cmake-mode :website "http://www.itk.org/Wiki/CMake/Editors/Emacs" :description "Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake source files." :type http :url "http://cmake.org/gitweb?p=cmake.git;a=blob_plain;hb=master;f=Auxiliary/cmake-mode.el"))
 (company-c-headers status "installed" recipe
                    (:name company-c-headers :description "Company mode backend for C/C++ header files." :type github :pkgname "randomphrase/company-c-headers" :depends
                           (company-mode)))
 (company-mode status "installed" recipe
               (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (cssh status "installed" recipe
       (:name cssh :website "https://github.com/dimitri/cssh" :description "ClusterSSH meets Emacs " :type github :pkgname "dimitri/cssh" :features cssh))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
                (when
                    (memq 'el-get
                          (bound-and-true-p package-activated-list))
                  (message "Deleting melpa bootstrap el-get")
                  (unless package--initialized
                    (package-initialize t))
                  (when
                      (package-installed-p 'el-get)
                    (let
                        ((feats
                          (delete-dups
                           (el-get-package-features
                            (el-get-elpa-package-directory 'el-get)))))
                      (el-get-elpa-delete-package 'el-get)
                      (dolist
                          (feat feats)
                        (unload-feature feat t))))
                  (require 'el-get))))
 (exec-path-from-shell status "installed" recipe
                       (:name exec-path-from-shell :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell"))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (function-args status "installed" recipe
                (:name function-args :description "Shows C++ function arguments using Semantic" :type github :pkgname "abo-abo/function-args" :depends
                       (cedet swiper)))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ggtags status "installed" recipe
         (:name ggtags :description "Use GNU Global in Emacs." :type github :pkgname "leoliu/ggtags"))
 (glsl-mode status "installed" recipe
            (:name glsl-mode :type github :description "major mode for Open GLSL shader files" :pkgname "jimhourihan/glsl-mode" :features glsl-mode))
 (google-c-style status "installed" recipe
                 (:name google-c-style :type http :description "Google's C/C++ style for c-mode." :url "http://google-styleguide.googlecode.com/svn/trunk/google-c-style.el" :prepare
                        (progn
                          (autoload 'google-set-c-style "google-c-style" nil t)
                          (autoload 'google-make-newline-indent "google-c-style" nil t)
                          (eval-after-load 'cc-styles
                            '(progn
                               (require 'google-c-style)
                               (c-add-style "Google" google-c-style))))))
 (guess-offset status "installed" recipe
               (:name guess-offset :auto-generated t :type emacswiki :description "-- Automatically determine c-basic-offset" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/guess-offset.el"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
              (("make"))
              :build/darwin
              `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (let
                  ((generated-autoload-file
                    (expand-file-name "helm-autoloads.el"))
                   \
                   (backup-inhibited t))
              (update-directory-autoloads default-directory)
              nil)))
(helm-gtags status "installed" recipe
(:name helm-gtags :description "GNU GLOBAL Helm interface." :type github :pkgname "syohex/emacs-helm-gtags" :depends
(helm)))
(json status "installed" recipe
(:name json :description "JavaScript Object Notation parser / generator" :type http :builtin "23" :url "http://edward.oconnor.cx/elisp/json.el"))
(popup status "installed" recipe
(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
(smartparens status "installed" recipe
(:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
(smex status "installed" recipe
(:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
(smex-initialize)))
(sr-speedbar status "installed" recipe
(:name sr-speedbar :type emacswiki :description "Same frame speedbar" :prepare
(global-set-key
(kbd "s-s")
'sr-speedbar-toggle)))
(ssh status "installed" recipe
(:name ssh :website "http://www.splode.com/~friedman/software/emacs-lisp/#ssh" :description "This is a comint-based interface for connecting to remote hosts via ssh." :type http :url "http://www.splode.com/~friedman/software/emacs-lisp/src/ssh.el"))
(ssh-config status "installed" recipe
(:name ssh-config :description "Manage both ssh and dsh confguration from emacs" :type github :pkgname "renard/ssh-config-el" :features ssh-config))
(swiper status "installed" recipe
(:name swiper :description "Gives you an overview as you search for a regex." :type github :pkgname "abo-abo/swiper"))
(window-numbering status "installed" recipe
(:name window-numbering :website "http://nschum.de/src/emacs/window-numbering-mode/" :description "Assigns numbers to Emacs windows to allow easy window navigation." :type github :pkgname "nschum/window-numbering.el"))
(yasnippet status "installed" recipe
(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets")))))
