# aliases for common git commands
alias g='git'
alias st='git status'
alias push='git push'
alias commit='git commit'
alias amend='git commit --amend'
alias log='git log'
alias stash='git stash'
alias checkout='git checkout'
alias branch='git branch'
alias fetch='git fetch'
alias merge='git merge'
alias cherry-pick='git cherry-pick'
alias rebase='git rebase'

# Regular aliases
alias ffs='sudo "$BASH" -c "$(history -p !!)"'
alias bi='brew install'
alias br='brew uninstall'
alias bu='brew update'
# Color fix for home monitor: see: https://lucascosti.com/blog/2016/08/monitor-colour-problems-over-hdmi/
alias hdmi-color-fix='sh ~/bashscripts/hdmi-colour-fix.sh'

# Git
## Git aliases
alias g='git'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gr='git rebase'
alias gpull='git pull'
alias gs='git status'
alias gc='git checkout'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gbranches='git branch -a'
alias gnb='git checkout -b'
alias gnewbranch='git checkout -b'
alias grmbranch='git branch -d'
alias gd='git diff'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsl='git stash list'
alias ga='git add'
alias gaa='git add -A'
alias gcom='git commit'
alias gcommam='git add -A && git commit -m'
alias gcomma='git add -A && git commit'
alias gcommend='git add -A && git commit --amend --no-edit'
alias gm='git merge'
alias gcp='git cherry-pick'
alias gpoh='git push origin HEAD'
alias grom='git rebase origin/master'
alias gcd='cd ~/repos/'
### From https://docs.gitlab.com/ee/user/project/merge_requests/#checkout-merge-requests-locally : e.g. gcmr upstream 12345
gcmr() { git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2; }
### This function prunes references to deleted remote branches and
### deletes local branches that have been merged and/or deleted from the remotes.
### It is intended to be run when on a master branch, and warns when it isn't.
gclean (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  # Warning if not on a master* branch
  if [[ $BRANCH != master* ]]
  then
    echo -e "\e[91m!! WARNING: It looks like you are not on a master branch !!\e[39m"
    read -r -p "Are you sure you want to continue? [y/N] " response
    if ! [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
    then
      echo "Aborted. Nothing was changed."
      return 1
    fi
  fi
  echo "Simulating a clean on $BRANCH ..." \
  && echo "===== 1/2: simulating pruning origin =====" \
  && git remote prune origin --dry-run \
  && echo "===== 2/2: simulating cleaning local branches merged to $BRANCH =====" \
  && git branch --merged $BRANCH | grep -v "^\**\s*master"  \
  && echo "=====" \
  && echo "Simulation complete."
  read -r -p "Do you want to proceed with the above clean? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "Running a clean on $BRANCH ..."
    echo "===== 1/2: pruning origin =====" \
    && git remote prune origin \
    && echo "===== 2/2: cleaning local branches merged to $BRANCH =====" \
    && git branch --merged $BRANCH | grep -v "^\**\s*master" | xargs git branch -d \
    && echo "=====" \
    && echo "Clean finished."
  else
    echo "Aborted. Nothing was changed."
  fi
}
### Sync function for my current workflow, which only has a remote origin.
### Fetches origin and rebases current branch from origin.
gsync (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  echo "Syncing the current branch: $BRANCH"
  echo "===== 1/2: fetching origin =====" \
  && git fetch origin \
  && echo "===== 2/2: rebasing $BRANCH =====" \
  && git rebase origin/$BRANCH \
  && echo "=====" \
  && echo "Syncing finished."
}
### Sync function for my previous workflow, which had upstream+originfork+local.
### Syncs local and origin branch from a remote: runs a fetch from specified remote + rebase local + push to origin.
OLDgsync (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  echo "Syncing the current branch: $BRANCH"
  echo "===== 1/3: fetching $1 =====" \
  && git fetch $1 \
  && echo "===== 2/3: rebasing $BRANCH =====" \
  && git rebase $1/$BRANCH \
  && echo "===== 3/3: pushing to origin/$BRANCH =====" \
  && git push origin $BRANCH \
  && echo "=====" \
  && echo "Syncing finished."
}
### Function to take git interactive rebase argument. e.g.: gir 2
gri() { git rebase -i HEAD~$1; }
gir() { git rebase -i HEAD~$1; }
### Function to undo all changes (including stages) back to the last commit, with a confirmation.
gundoall () {
  echo "WARNING: This will delete all untracked files, and undo all changes since the last commit."
  read -r -p "Are you sure? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "===== 1/2: git reset --hard HEAD =====" \
    && git reset --hard HEAD \
    && echo "===== 2/2: git clean -fd \$(git rev-parse --show-toplevel) =====" \
    && git clean -fd $(git rev-parse --show-toplevel)
  else
    echo "Aborted. Nothing was changed."
  fi
}


# 'git pull --rebase' with a short log of the latest changes
pull () { local HEADHASH=`git describe --always --abbrev=40`; git pull --rebase $*; echo; PAGER='cat -B' git log --format="%C(yellow)%h %C(green)%an%C(reset): %s" $HEADHASH.. | sed -nr 's/([^:]+)\:/\1\t/;p'; }

# 'git pull --ff-only' with a short log of the latest changes
ff () { local HEADHASH=`git describe --always --abbrev=40`; git pull --ff-only $*; echo; PAGER='cat -B' git log --format="%C(yellow)%h %C(green)%an%C(reset): %s" $HEADHASH.. | sed -nr 's/([^:]+)\:/\1\t/;p'; }

# verbose add
add () { git add -v $*; git status; }

# verbose reset
reset () { git reset $*; git status; }

# 'git add' with 'git ls-files' and grep
# usage like grep - example: gadd 'readme.txt'
gadd () { git ls-files -co --exclude-standard | grep $* | xargs git add -v; git status; }

# 'git reset' with 'git ls-files' and grep
greset () { git ls-files | grep $* | xargs git reset; git status; }

# Enable auto-completion for aliased 'git' command
complete -o default -o nospace -F _git g
