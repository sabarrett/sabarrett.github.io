(package-initialize)

(require 'ox-publish)
(require 'font-lock)
(require 'htmlize)
(require 'org)

(setq org-publish-alist
      '(("website"
         :base-directory "./src"
	 :base-extension any
         :publishing-function org-html-publish-to-html
         :publishing-directory "./public_html"
	 :html-head "<link rel=\"stylesheet\" href=\"https://latex.now.sh/style.css\">"
	 :html-validation-link nil
	 :section-numbers nil
	 :with-sub-superscript nil
	 :with-toc t
	 :with-creator nil
	 :with-author nil
	 :headline-levels 10)
	("images"
	 :base-directory "./img"
	 :base-extension "png"
	 :publishing-function org-publish-attachment
	 :publishing-directory "./public_html")))

(org-publish-all t)

(message "Build complete!")
