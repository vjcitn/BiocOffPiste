#' Use install.packages with specifically tailored `repos` parameter.
#' @param x character vector of packages to be installed
#' @param version character(1) defaults to "3.18"
#' @param quiet logical(1) if TRUE (default), suppress warnings about the search for binaries
#' @param \dots arguments passed to `install.packages`, exclusive of `pkgs` and `repos`
#' @return result of `install.packages`
#' @export
installOffPiste = function(x, version="3.18", quiet=TRUE, ...) {
 stopifnot(requireNamespace("BiocManager"))
 ddat = list(...)
 if (length(ddat)>0) {
   dargs = names(ddat)
   if (any(c("pkgs", "repos") %in% dargs)) stop("do not use 'pkgs' or 'repos' arguments to this function")
   }
 wr = force
 if (quiet) wr = suppressWarnings
 bcr = try(BiocManager:::.repositories_bioc(version=version))
 if (inherits(bcr, "try-error")) 
   stop(sprintf("could not create .repositories_bioc with selected version %s", version))
 wr( install.packages(pkgs=x, repos=c(CRAN="@CRAN@", bcr), ...) )
}
