(in-package #:conspack)

;;;; This defines a simple encoding for pathnames via TMaps.

(defmethod encode-object append ((object pathname) &key &allow-other-keys)
  ;; Note that PATHNAME-HOST and PATHNAME-DEVICE are ignored since the
  ;; types of them are implementation-dependent.
  `((:directory . ,(pathname-directory object))
    (:name . ,(pathname-name object))
    (:type . ,(pathname-type object))
    (:version . ,(pathname-version object))))

(defmethod decode-object-allocate ((class (eql 'pathname)) alist
                                   &key &allow-other-keys)
  (apply #'make-pathname (alist-plist alist)))

(defmethod decode-object-initialize progn ((pathname pathname) class alist &key &allow-other-keys)
  (declare (ignore pathname class alist)))
