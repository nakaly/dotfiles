#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Java
export JAVA_HOME=$(/usr/libexec/java_home -v '1.8.0_40')

# GOPATH
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# perl
#export PERL_LOCAL_LIB_ROOT="/Users/`whoami`/perl5:$PERL_LOCAL_LIB_ROOT";
#export PERL_MB_OPT="--install_base "/Users/`whoami`/perl5"";
#export PERL_MM_OPT="INSTALL_BASE=/Users/`whoami`/perl5";
#export PERL5LIB="/Users/`whoami`/perl5/lib/perl5:$PERL5LIB";
#export PATH="/Users/`whoami`/perl5/bin:$PATH";

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# node
export NODE_PATH=/usr/local/lib/node_modules

