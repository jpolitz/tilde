set PATH $PATH /Applications/Racket\ v6.5/bin
set PATH $PATH /Applications/CMake.app/Contents/bin
set PATH $PATH /opt/local/bin
set PATH $PATH $HOME/.node/bin
set PATH $PATH $HOME/bin
set PATH $HOME/src/depot_tools $PATH

set __fish_git_prompt_show_informative_status 'yes'

# OPAM configuration
. /Users/joe/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
