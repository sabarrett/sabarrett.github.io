;; This script is almost there for github pages work -- the only
;; problem is that htmlize doesn't produce colorful code blocks. I'm
;; too sick of dealing with it now though, so for now you have to
;; hand-publish before pushing.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(package-install 'htmlize)

(require 'ox-publish)
(require 'font-lock)
(require 'htmlize)
(require 'org)

(setq org-publish-project-alist
      '(("website"
         :base-directory "./src/"
	 :base-extension any
         :publishing-function org-html-publish-to-html
         :publishing-directory "./public_html"
	 :html-validation-link nil
	 :section-numbers nil
	 :with-sub-superscript nil
	 :with-toc t
	 :with-creator nil
	 :with-author nil
	 :headline-levels 10)
	("images"
	 :base-directory "./img/"
	 :base-extension "png"
	 :publishing-function org-publish-attachment
	 :publishing-directory "./public_html")))

(org-publish-all t)

(message "Build complete!")
