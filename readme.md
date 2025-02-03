note
===

`note` is a utility to quickly note something down without leaving the terminal.


Installation
===

You can download the latest verions of `note` (via this repository) and you can then source the `note.sh` file in your bash profile. You can see an example of how I did it in my [dotfiles](https://github.com/mattmezza/dotfiles) (see plugins.sh and plugins.txt).


```bash
git clone --branch 1.1.0 git@github.com/mattmezza/note.git note && source note/note.sh
```

`note` should be compatible with any *nix OS but it has been tested with macOS Catalina (and the prev version).


Usage
===

`note` uses a default directory as database. This directory defaults to `$HOME/notes` but can be changed by altering the environment variable `NOTE_DEFAULT_SCRATCH_DIR`.

```
Usage:
  $ note list|l
  $ note new|n name
  $ note open|o name
  $ note path|p
  $ note path|p name
  $ note rm name
  $ note last
Your scratch notes dir is: '/Users/matt/klm/notes'
```

#### note list

Lists all the notes that have been taken until this point. They are ordered by default in chronological ASC order.

#### note new name

Quickly opens up your favorite text editor with a file named using the current datetime and the specified name: `note new marketing-meeting` creates a file `201911011501-marketing-meeting.txt`

#### note open name

Quickly opens up with your favorite editor a note that you already took. The name must be matching with the actual filename (including the datetime part and the file extension).

#### note path

Prints back to the stdout the path of the directory used as a database for all the notes. By default, this value should be `$HOME/notes` but it can be altered by setting the environment variable `NOTE_DEFAULT_SCRACTH_DIR`.

##### note path name

Prints back to the stdout the full path of a note that you already took. The name must be matching with the actual filename (including the datetime part and the file extension).

#### note last

Prints back to the stdout the full path of the last note that you already took. You can use this command in combination with `note open $(note path last)` or `note rm $(note path last)` to quickly edit or remove the most recent note.

#### note rm name

Prompts you to remove the note identified by the name. The name must be matching with the actual filename (including the datetime part and the file extension).

#### note last

Prints back to the stdout the full path of the last note that you already took. You can use this command in combination with `note open $(note last)` or `note rm $(note last)` to quickly edit or remove the most recent note.


Development
===

Developing this utility is quite easy: just clone this repo and start editing the `note.sh` file. You can always source `note.sh` in your current shell as you develop it to try out your modifications.
