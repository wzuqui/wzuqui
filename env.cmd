@echo off

:: Setup bootstrap script

IF NOT [%1]==[--skip-setup] (
    :: Allow (, ), ^, <, >, |, ... in the file name
    :: See https://stackoverflow.com/a/36990712
    SETLOCAL EnableDelayedExpansion
    SET "EXECUTABLE_PATH=%~dpnx0"
    ECHO AutoRun "!EXECUTABLE_PATH!"
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /f /v AutoRun /d "\"!EXECUTABLE_PATH!\" --skip-setup"
    ECHO Enter to exit.
    PAUSE
    ENDLOCAL
    GOTO :EOF
)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Change start up directory

IF /I x"%COMSPEC%"==x%CMDCMDLINE% (cd /D %USERPROFILE%\Desktop)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DOSKEY /=cd \
DOSKEY ..=cd ..
DOSKEY ls=dir /O $*
DOSKEY ll=dir /O $*
DOSKEY l=dir /O $*
DOSKEY cat=type $*
DOSKEY r=.\node_modules\.bin\$*
DOSKEY rm=powershell rm $*

:: Git alias shortcuts
:: See https://github.com/GitAlias/gitalias

DOSKEY g=git $*

DOSKEY ga=git add $*
DOSKEY gb=git branch $*
DOSKEY gc=git commit $*
DOSKEY gd=git diff $*
DOSKEY gf=git fetch -p $*
DOSKEY gg=git grep $*
DOSKEY gl=git log $*
DOSKEY gm=git merge $*
DOSKEY go=git checkout $*
DOSKEY gp=git pull $*
DOSKEY gpp=git push $*
DOSKEY gr=git remote $*
DOSKEY gs=git status $*
DOSKEY gw=git whatchanged $*

::### add ###

::# add all
DOSKEY gaa=git add --all $*

::# add by patch - looks at each change, and asks if we want to put it in the repo.
DOSKEY gap=git add --patch $*

::# add just the files that are updated.
DOSKEY gau=git add --update $*

::### branch ###

::# branch - edit the description
DOSKEY gbe=git branch --edit-description $*

::# branch and only list branches whose tips are reachable from the specified commit (HEAD if not specified).
DOSKEY gbm=git branch --merged $*

::# branch and only list branches whose tips are not reachable from the specified commit (HEAD if not specified).
DOSKEY gbnm=git branch --no-merged $*

::### commit ###

::# commit - amend the tip of the current branch rather than creating a new commit.
DOSKEY gca=git commit --amend $*

::# commit - amend the tip of the current branch, and edit the message.
DOSKEY gcam=git commit --amend --message $*

::# commit - amend the tip of the current branch, and do not edit the message.
DOSKEY gcane=git commit --amend --no-edit $*

::# commit interactive
DOSKEY gci=git commit --interactive $*

::# commit with a message
DOSKEY gcm=git commit --message $*

::### checkout ###

::# checkout - update the working tree to match a branch or paths. [same as "o" for "out"]
DOSKEY gco=git checkout $*

::### cherry-pick ###

::# cherry-pick - apply the changes introduced by some existing commits; useful for moving small chunks of code between branches.
DOSKEY gcp=git cherry-pick $*

::### diff ###

::# diff - show changes not yet staged
DOSKEY gdc=git diff --cached $*

::# diff - changes about to be commited
DOSKEY gds=git diff --staged $*

::# diff - show changes but by word, not line
DOSKEY gdw=git diff --word-diff $*

::### clean ###

::# clean everything to be pristine
DOSKEY gcleanest=git clean -ffdx $*

::### grep ###

::# find text
DOSKEY gg=git grep $*

::# grep and show line number
DOSKEY ggl=git  grep --line-number $*

::# grep group: find text and group the output lines; a.k.a. `grep-group`.
DOSKEY ggg=git  grep --break --heading --line-number $*

::### log ###

::# log with a text-based graphical representation of the commit history.
DOSKEY glg=git log --graph $*

::# log with one line per item.
DOSKEY glo=git log --oneline $*

::# log with patch generation.
DOSKEY glp=git log --patch $*

::# log with items appearing in topological order, i.e. descendant commits are shown before their parents.
DOSKEY glt=git log --topo-order $*

::# log key - our favorite way to show our key performance indicators, i.e. our most useful summary.
DOSKEY glk=git log --graph --topo-order --abbrev-commit --date=short --decorate --all --boundary --pretty=format:'%Cgreen%ad %Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue[%cn]%Creset %Cblue%G?%Creset' $*

::# log latest - show the 10 most recent lines using `lk`
DOSKEY gll=git log -n 10 --graph --topo-order --abbrev-commit --date=short --decorate --all --boundary --pretty=format:'%Cgreen%ad' $*

::## ls-files ##

::# ls-files - show information about files in the index and the working tree; like Unix "ls" command.
DOSKEY gls=git ls-files $*

::### merge ###

::# merge but without autocommit, and with a commit even if the merge resolved as a fast-forward.
DOSKEY gme=git merge --no-commit --no-ff $*

::### pull ###

::# pull if a merge can be resolved as a fast-forward, otherwise fail.
DOSKEY gpf=git pull --ff-only $*

::# pull with rebase - to provide a cleaner, linear, bisectable history.
::#
::# To integrate changes between branches, you can merge or rebase.
::#
::# When we use "git pull", git does a fetch then a merge.
::# If we've made changes locally and someone else has pushed changes
::# to our git host then git will automatically merge these together
::# and create a merge commit that looks like this in the history:
::#
::#    12345678 - Merge branch 'foo' of bar into master
::#
::# When we use "git pull --rebase", git does a fetch then a rebase.
::# A rebase resets the HEAD of your local branch to be the same as
::# the remote HEAD, then replays your local commits back into repo.
::# This means you don't get any noisy merge messages in your history.
::# This gives us a linear history, and also helps with git bisect.
::#
::# To automatically do "pull --rebase" for any branch based on master:
::#
::#    git config branch.master.rebase true
::#
::# To automatically do "pull --rebase" for all branches:
::#
::#     git config --global branch.autosetuprebase always
::#
DOSKEY gpr=git pull --rebase $*

::### rebase ###

::# rebase - forward-port local commits to the updated upstream head.
DOSKEY grb=git rebase $*

::# rebase - continue the rebasing process after resolving a conflict manually and updating the index with the resolution.
DOSKEY grbc=git rebase --continue $*

::# rebase - restart the rebasing process by skipping the current patch.
DOSKEY grbs=git rebase --skip $*

::# rbi - rebase interactive on our unpushed commits.
::#
::# Before we push our local changes, we may want to do some cleanup,
::# to improve our commit messages or squash related commits together.
::#
::# Let's say I've pushed two commits that are related to a new feature and
::# I have another where I made a spelling mistake in the commit message.
::# When I run "git rbi" I get dropped into my editor with this:
::#
::#     pick 7f06d36 foo
::#     pick ad544d0 goo
::#     pick de3083a hoo
::#
::# Let's say I want to squash the "foo" and "goo" commits together,
::# and also change "hoo" to say "whatever". To do these, I change "pick"
::# to say "s" for squash; this tells git to squash the two together;
::# I also edit "hoo". I make the file look like:
::#
::#     pick 7f06d36 foo
::#     s ad544d0 goo
::#     r de3083a whatever
::# This gives me two new commit messages to edit, which I update.
::# Now when I push the remote repo host receives two commits
::#
::#     3400455 - foo
::#     5dae0a0 - whatever
::#
DOSKEY grbi=git rebase --interactive @{upstream} $*

::### reflog ###

::# reflog - reference log that manages when tips of branches are updated.
DOSKEY grl=git reflog $*

::### remote ###

::# remote - manage set of tracked repositories [same as "r"].
DOSKEY grr=git remote $*

::# remote show - gives some information about the remote <name>.
DOSKEY grrs=git remote show $*

::# remote update - fetch updates for a named set of remotes in the repository as defined by remotes.
DOSKEY grru=git remote update $*

::# remote prune - deletes all stale remote-tracking branches under <name>.
DOSKEY grrp=git remote prune $*

DOSKEY gincoming=git !git remote update --prune; git log ..@{upstream} $*
DOSKEY goutgoing=git log @{upstream}.. $*

::### revert ###

::# revert - undo the changes from some existing commits
DOSKEY grv=git revert $*

::# revert without autocommit; useful when you're reverting more than one commits' effect to your index in a row.
DOSKEY grvnc=git revert --no-commit $*

::### show-branch ###

::# show-branch - print a list of branches and their commits.
DOSKEY gsb=git show-branch $*

::### submodule ###

::# submodule - enables foreign repositories to be embedded within a dedicated subdirectory of the source tree.
DOSKEY gsm=git submodule $*

::# submodule update
DOSKEY gsmu=git submodule update $*

::# submodule update with initialize
DOSKEY gsmui=git submodule update --init $*

::# submodule update with initialize and recursive; this is useful to bring a submodule fully up to date.
DOSKEY gsmuir=git submodule update --init --recursive $*

::### status ###

::# status with short format instead of full details
DOSKEY gss=git status --short $*

::# status with short format and showing branch and tracking info.
DOSKEY gssb=git status --short --branch $*

ECHO.
ECHO.
ECHO  ╔═══════════════════════════════════════════════════ Atalhos ════════════════════════════════════════════════════════╗
ECHO  ╠══════════════════════════════════════════════════════╦═════════════════════════════════════════════════════════════╣
ECHO  ║ cz                                                   ║                                         commitzen           ║
ECHO  ║ ga                                                   ║                                         git add             ║
ECHO  ║ gp                                                   ║                                         git pull            ║
ECHO  ║ gpp                                                  ║                                         git push            ║
ECHO  ║ gs                                                   ║                                         git status          ║
ECHO  ╚══════════════════════════════════════════════════════╩═════════════════════════════════════════════════════════════╝
