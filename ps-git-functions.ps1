function gs() {
    git status $args
}

function gbr() {
    git branch $args
}
function gf() {
	  git fetch $args
}

function gpl() {
	  git pull $args
}

function gph() {
	  git push $args
}

function gdelAll() {
    Foreach ($br in $args)
    {
        git branch -D $br;
        git push origin :$br;
    }

}

function gnew() {
	  git push -u origin HEAD
}

function gamend() {
    git commit -a --amend --no-edit $args
}

function gcherry() {
    git cherry-pick $args
}

function gl1() {
	git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %b %Cgreen(%cd) %C(bold blue)<%an>%Creset" --abbrev-commit
}

function gl2() {
	git log --pretty=oneline --abbrev-commit --max-count=15 --decorate
}

function gll() {
	git log --graph --date-order -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --date=short
}

function glx() {
	git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %Cgreen(%cd) %C(bold blue) %an [%ae]:%Creset %n %s %n %b %n" --abbrev-commit
}
