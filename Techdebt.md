# Techdebt

Goal: public reference repo, not a clone-and-go setup.

## Should fix

### 2. `defaultBranch = master`
- `.gitconfig:26` — your repo uses `main` but new repos you create will default to `master`.
- **Fix:** Change to `main`.

---

## Nice to have

### 4. Neovim plugin staleness
- `neo-tree` pinned to `v2.x` (v3 stable). `nvim-navic`/`nvim-navbuddy` unmaintained. `nvim-spectre` superseded by `grug-far.nvim`.

### 5. Code cleanup
- `lsp.lua:26` — `-- no funca` (Spanish comment).
- Commented-out blocks across neovim configs.
- `.gitconfig` mixed tabs/spaces.

---

## Orphan branch

```sh
git checkout --orphan clean
git add -A
git commit -m "init: dotfiles"

git branch -D master
git branch -m clean master

git push origin master --force
```
