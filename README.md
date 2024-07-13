# git-tutorial

### Clone repo to your local machine
```
git clone https://github.com/AndrewSukhobok95/git-tutorial.git
```

### Helping commands
```
git branch          # Which branch am I on?
git log --oneline   # History of commits
git status          # Current status of files (unstaged / staged / commited)
```

### Main commands
```
git add README.md              # Add one file
git add .                      # Add all files
git commit -m "first change"   # Commit staged files with message
git commit -a -m "comment"     # Commit with message and simulteneously add staged files
git push                       # Push commits to origin
git pull                       # Pull commits from origin
```

### Branching commands
```
git checkout -b new-branch   # Create new branch
git checkout main            # Switch between branches
git checkout new-branch
git branch -d new-branch     # Delete the branch
```


### Merge branches after pulling changes from `main`

[`branch-t` & `branch-f` scenario]

Actions:
1. Checkout to `main`
2. `git pull`
3. Checkout to your branch
4. `git merge main`
5. Resolve conflicts

```
git merge main
```
