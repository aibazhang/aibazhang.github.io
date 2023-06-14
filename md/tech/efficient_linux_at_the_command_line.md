# Efficient Linux at the Command Line

## Ch. 02 Intrudcing the Shell

- sqaure brackets `[1-5]` in fish: `(seq 1 5)`
- The shell performs the pattern matching, not the invoked program
- Shell pattern matching applies only to file and directory. It doesn't work for usernames, hostnames, and the other type of arguments that ceratin command accept
- redirecting input and output
  - `wc animals.txt` `wc` is aware that the file exists
  - `wc < animals.txt` `wc` reads from stdin, has no idea that the file exists
- disabling evaluation with quotes and escapes
  - difference between double and signle qoutes
    - double: `echo "my home is $HOME"` my home is /home/jc
    - single: `echo 'my home is $HOME'` my home is $HOME
  - escape from alias also could use `\`
- locating programs to be run
  - bash `echo $PATH | tr : "\n"`
  - fish `echo $PATH | string split " "`
  - shell searches for a command by name, it checks if that name is an alias before checking the serach path

## Ch. 03 Rerunning Commands

- The shell default is Emacs-style


## Ch. 04 Cruising the Filesystem

- Use `CDPATH` for rapid navigation
- toggle among many directories with pushh and popd


## Ch. 05 Expanding Your Toolbox

- brace expansion `{1..10}` in fish `(seq 10)`
  - fish's philosophy: replacing magical syntax with conrete commands