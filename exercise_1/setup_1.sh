#!/usr/bin/env bash
set -e

# 1. Ensure we're on main and up to date
git checkout main
git pull origin main

# 2. Create a feature branch “feature/A”
git checkout -b feature/A

# 3. Commit some changes
echo "Feature A part1" >> file1.md
git add file1.md
git commit -m "feat: add part1 of feature A"

echo "Feature A part2" >> file1.md
git add file1.md
git commit -m "feat: add part2 of feature A"

# 4. Simulate master moving on (simulate remote changes)
git checkout main
echo "Master update before merge" >> README.md
git add README.md
git commit -m "chore: update README on main"

# 5. Switch back to feature/A
git checkout feature/A

# 6. Merge master into feature/A (simulate bad workflow)
git merge main -m "merge main into feature/A"

# 7. Make another commit on feature/A
echo "Feature A part3" >> file1.md
git add file1.md
git commit -m "feat: add part3 of feature A"

# 8. Push feature branch to origin (simulate remote)
git push -u origin feature/A

# 9. Now create a second feature branch “feature/B” based on main
git checkout main
git checkout -b feature/B

echo "Feature B change1" >> file1.md
git add file1.md
git commit -m "feat: add part1 of feature B"

echo "Feature B change2" >> file1.md
git add file1.md
git commit -m "feat: add part2 of feature B"

# 10. Merge feature/B into feature/A (simulate your branch absorbing other branches)
git checkout feature/A
echo "⚠️ The next merge will cause a conflict. Resolve it manually and then commit the result."
git merge feature/B -m "merge feature/B into feature/A (bad!)" || true
echo "After resolving conflicts, run: git add <files>; git commit"

# 11. Now you're in feature/A with messy history
echo "Feature A final change" >> file1.md
git add file1.md
git commit -m "feat: add final change of feature A"

echo "Setup complete – messy history ready for practice."
