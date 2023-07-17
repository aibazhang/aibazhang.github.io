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
- page 77
  - `cut -d: -f7 /etc/passwd | sort -u | grep -f /etc/shells -F` 
  - `grep -f /etc/shells -F` didn't work, because the commentout ?
- extract 4th line of a file
  - `head -n4 alphabet | tail -n1`
- awk
  - print 4th column and remove the head
    - `df | awk 'FNR>1 {print $4}'`
  - combine with regex
    - `echo Efficient fun::::::Linux | awk -F':*' '{print $2}'`
- combining text
  - `tac` reverses the lines of each file
  - `paste` combines file side by side
  - print diff line of two files  `diff file1 file2 | grep '^[<>]' | cut -c3-`
    - remove other parts except the text
- transforming text
  - `tr` translates one set of characters into another
    - remove spaces and tabs `echo Efficient Linux | tr -d ' \t'`
  - `rev` reverses the characters of each line of input
    - extract last word of each line `rev celebrities | cut -d' ' -f1 | rev`
    - do the same thing with awk `awk '{print $NF}' celebrities`
    - do the same thing with sed `sed 's/.* //g' celebrities`
      - `.*`: match all characters up to the last space and replace them with nothing

## Ch. 06 Parents, Children, and Environments

- A shell is just an ordinary program like `ls` or `cat`
- Any changes to the parent won't affect its children that already running.
  - But can affect its future children
- environment variables
  - local variables: local to a single shell
  - environment variables: copied from a given shell to all of its children
- Launch a new shell anytime and change anything in its environment, and all the changes disappear when you exit the shell
  - you can experiment with shell features safely
  - run a shell manuyally
  - creating a child
  - terminate it
- child shells vs. subshells
  - child does not receive copies of the parent's aliases
  - subshell is a complete copy of its parent
    - command susstitutions not allowed in fish
- configuring your environment
  - better to use `fish_add_path` to add path in fish
  - https://zenn.dev/estra/articles/zenn-fish-add-path-final-answer

## Ch. 07 More Ways to Run a Command

- #1 conditional lists
  - `cd dir || mkdir dir && cd dir`
- #2 uncondition lists
  - reminder system, sleeping for 5 minutes and then sending me an email
  - `sleep 300; echo "rember to walk the dog" | mail -s reminder $USER`
- #3 command substitution: a command is replaced by its output
  - move files to subdirectory with Artist: Kansas (fish)
    - `mv (grep -l "Artist: Kansas" *.txt) kansas/`
    - bash need the `$`
  - set result to a variable
    - fish `set kasasFiles (grep -l "Artist: Kansas" *.txt)`
    - bash `kasasFiles=$(grep -l "Artist: Kansas" *.txt)`
- #4 process substitution: a command is replaced by a file (sort of)
  - fish `diff (ls -1 | sort -n | psub) (seq 1 1000 | sed 's/$/.jpg/' | psub)`
  - bash `diff <(ls -1 | sort -n) <(seq 1 1000 | sed 's/$/.jpg/')`
- #5 passing a command as an argument to bash
  - execute some commands but not change the dir
  - `touch /tmp/badfile`
  - `bash -c "cd /tmp && rm badfile"`
- #6: piping a command to bash
  - `echo "ls -l" | bash`
- #7 executing a string remotely with ssh
  - `echo "ls > outfile" | ssh myhost.example.com`
- #8 running a list of commands with xargs
  - safety with find and xargs: `find . -type f -print0 | xargs -0 wc -l`
    - use `-0` specify input separators
  - ls | xargs -I XYZ echo XYZ is my favorite food
    - `XYZ` is place holder
- #9 backgrounding a command
  - saving time: suspend the editor (Ctrl + Z)
  - test your code
  - resume the editor (`fg`)
- #10 explicit sub shells

## Ch. 08 Building a Brash One-Liner

- inserting a fiename into sequence
  - `paste (seq -w 10 -1 3 | sed 's/\(.*\)/ch\1.asciidoc/' | psub) (seq -w 11 -1 4 | sed 's/\(.*\)/ch\1.asciidoc/' | psub) | sed 's/^/mv /' | bash`
  - copy and paste whole line
    - `Ctrl + A`
    - `Ctrl + K`
    - `Ctrl + Y`
- checking matched pairs of files
  - `diff (ls *.jpg | sed 's/\.[^.]*$//' | psub) (ls *.txt | sed 's/\.[^.]*$//' | psub) | grep '^[<>]' \ | awk '/^</{print $2 ".jpg"} /^>/{print $2 ".txt"}'`
- generating a CDPATH from your home directory
  - `echo 'CDPATH=$HOME' (ls -d */ | sed -e 's@^@$HOME/@g' -e 's@/$@@') | tr ' ' ':'`
- generating test files
  - `shuf -n (random) -o (pwgen -N1 10).txt /usr/share/dict/words`

## Ch. 09 Leveraging Text Files

- finding files
  - `find $HOME -print > ~/.ALLFILES`
  - add fish function `grep $argv $HOME/.ALLFILES`
