(require 'org)

(org-publish
           '("website"
              :base-directory "."
              :publishing-function org-html-publish-to-html
              :publishing-directory "./public_html"))
