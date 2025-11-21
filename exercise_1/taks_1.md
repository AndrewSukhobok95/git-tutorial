# Git Practice Course — Beginner Edition

This is a beginner-friendly Git practice course based on your current messy repository.

---

# Prerequisites

* Your repo should be in the state produced by the prep script.
* Current branch: `feature/A`

Check your status:

```bash
git status
git branch
```

---

# Task 1 — Inspect Your Branch & Identify the Mess

**Goal:** Learn to visualize commit history and understand where the mess is.

**Commands:**

```bash
git log --oneline --graph --decorate --all
```

```bash
git log --oneline --graph --decorate
```

```bash
git show --summary <merge-hash>
```

**Explanation:**

* `--graph` draws the ASCII graph.
* `*` is a commit.
* `|` is branch continuation.
* `/` and `\` show branch merges/diverges.
* `<merge-hash>` lets you inspect the merge commit in detail.

**Results:**

```bash
% git log --oneline --graph --decorate --all -n 10
* 97150ff (HEAD -> feature/A) feat: add final change of feature A
*   f714efd merged b to a
|\  
| * 8e1f90e (feature/B) feat: add part2 of feature B
| * 44d38d8 feat: add part1 of feature B
* | bb29c96 (origin/feature/A) feat: add part3 of feature A
* | f820b99 merge main into feature/A
|\| 
| * 6ffdf31 (main) chore: update README on main
* | 76ef53f feat: add part2 of feature A
* | ac9f861 feat: add part1 of feature A
|/  
* 9904b36 (origin/main, origin/HEAD) comment
```

---

# Task 2 — Remove feature/B commits from feature/A

**Goal:** Clean feature/A so it does not contain commits from feature/B.

**Commands:**

```bash
git checkout feature/A
git rebase -i main
```

* Remove lines for feature/B commits.
* Keep lines for feature/A commits.

Resolve conflicts:

```bash
# fix conflicts in files
git add <files>
git rebase --continue
```

**Explanation:** Interactive rebase lets you rewrite history and remove unwanted commits.

**Results:**

```bash
% git log --oneline --graph --decorate -n 10
* 01b089a (HEAD -> feature/A) feat: add final change of feature A
* 8a90998 feat: add part3 of feature A
* e99d014 feat: add part2 of feature A
* 6459603 feat: add part1 of feature A
* 6ffdf31 (main) chore: update README on main
* 9904b36 (origin/main, origin/HEAD) comment
```

### Git Rebase and Stash Cheat Sheet

| Task / Situation | Command | What it does / Notes |
|-----------------|---------|--------------------|
| Start rebase of current branch onto `main` | `git rebase main` | Replays commits from current branch on top of `main`. Requires clean working directory. |
| Start interactive rebase | `git rebase -i main` | Allows you to pick, squash, edit, drop, or reorder commits. |
| Continue rebase after resolving conflicts | `git rebase --continue` | Applies the next commit in the rebase sequence. Repeat until finished. |
| Skip a commit during rebase | `git rebase --skip` | Omits the current commit and continues rebase. |
| Abort the rebase | `git rebase --abort` | Cancels the rebase and restores branch to original state. |
| View rebase progress | `git status` | Shows which commit is being applied and conflicted files. |
| Stash all staged and unstaged changes | `git stash push -m "message"` | Saves changes in a stash and cleans working directory; prepares branch for rebase. |
| Stash only staged changes | `git stash push --staged -m "message"` | Saves only staged changes. |
| Stash only unstaged changes but keep staged | `git stash push -k -m "message"` | Saves unstaged changes, staged files remain untouched. |
| List stashes | `git stash list` | Shows all saved stashes. |
| Apply stash and remove it from list | `git stash pop` | Reapplies the stashed changes to working directory; may require conflict resolution. |
| Apply stash without removing it | `git stash apply` | Reapplies the stash but keeps it in the stash list. |
| Drop a stash | `git stash drop <stash>` | Deletes a stash entry from the stash list. |

#### Notes

- **Rebase requires a clean working directory** (no staged or unstaged changes).  
- **Conflicts during rebase** must be resolved manually, then `git add` the resolved files before running `git rebase --continue`.  
- **Stashing** allows you to temporarily save changes, perform the rebase, then restore your changes safely.  
- Rebasing rewrites commit history; commit hashes change. Avoid rebasing public/shared branches unless necessary.  

---

# Task 3 — Squash Feature A commits into 1 commit

**Goal:** Merge multiple feature commits into a single commit.

**Commands:**

```bash
git rebase -i main
```

* Keep first commit as `pick`
* Change others to `squash`.
* Edit final commit message when prompted.

**Explanation:** Squashing simplifies history.

**Results:**

```bash
% git log --oneline --graph --decorate --all -n 10   
* 2a66b53 (HEAD -> feature/A) feat: feature A squash
| * 8e1f90e (feature/B) feat: add part2 of feature B
| * 44d38d8 feat: add part1 of feature B
|/  
| * bb29c96 (origin/feature/A) feat: add part3 of feature A
| *   f820b99 merge main into feature/A
| |\  
| |/  
|/|   
* | 6ffdf31 (main) chore: update README on main
| * 76ef53f feat: add part2 of feature A
| * ac9f861 feat: add part1 of feature A
|/  
* 9904b36 (origin/main, origin/HEAD) comment
```

---

# Task 4 — Fix a commit message

**Goal:** Edit the last commit message. Update remote with rewritten branch.

**Commands:**

```bash
git commit --amend
git push --force-with-lease
```

* Edit message in your editor.

**Explanation:**
- `--amend` replaces the last commit with a new one.
- `--force-with-lease` safely updates remote only if nobody else pushed.

**Results:**

```bash
% git log --oneline --graph --decorate --all -n 10   
* 7b6022d (HEAD -> feature/A, origin/feature/A) feat: feature A squash - complete
| * 8e1f90e (feature/B) feat: add part2 of feature B
| * 44d38d8 feat: add part1 of feature B
|/  
* 6ffdf31 (main) chore: update README on main
* 9904b36 (origin/main, origin/HEAD) comment
```

---


