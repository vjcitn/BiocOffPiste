# BiocOffPiste

Code that aids experts who wish to use incompatible versions of R and Bioconductor

Function `installOffPiste(x, version=v)` will arrange to set up the repositories for
`install.packages` to use to install packages named in vector `x`, based on version `v` of Bioconductor.

The primary use case is the installation of Bioconductor packages in R-devel
in the interval I from April to October of each year, when the official version
of R in use for Bioconductor is R-patched.

We call this activity "off piste" because protections of consistency and
coherence provided by BiocManager and the Bioconductor repository system
are lost.  `BiocManager::valid()` won't even run in interval I

# Installation

```
devtools::install_github("vjcitn/BiocOffPiste")
```

# Gotchas

If a Bioconductor package hasn't "propagated" in the Bioconductor build system,
you might need to set `version` in your call to `installOffPiste` to find any
viable source version of the unpropagated package.

For example, om May 13, 2023, I needed to do
```
installOffPiste("GenomeInfoDbData", version="3.17")
```
in order to install the 3.18 version of DESeq2 in R 4.4.
