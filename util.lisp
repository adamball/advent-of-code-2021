(in-package :advent-2021.util)

;; based on #'split-by-one-space from:
;; http://cl-cookbook.sourceforge.net/strings.html#reverse
(defun tokenize-string (s delim)
  "Returns a list of substring of S, tokenized
by DELIM."
  (loop for i = 0 then (1+ j)
        as j = (position delim s :start i)
        collect (subseq s i j)
        while j))

(defun string-split (s delim)
  "Split string S by DELIM.  Removes any instances
of blank strings in the result."
  (let* ((tokens (tokenize-string s delim))
         (result (reduce (lambda (acc v)
                           (if (string-equal "" v)
                               acc
                               (append acc (list v))))
                         tokens
                         :initial-value '())))
    result))
