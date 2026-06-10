---
name: project-change-management
description: Ensures that every task completed inside a git or jj directory is recorded as an incremental jj commit (using jj new/describe) so changes are tracked step-by-step. Use this whenever editing code files or making project changes.
---

# Project Change Management

## Overview
This skill mandates that the agent commits its work incrementally using Jujutsu (`jj`). Instead of making large changes and doing a single commit at the end, the agent must commit after completing each sub-task or code modification. This allows the user to review progress and diffs step-by-step.

## When to use
- Anytime code files are modified, created, or deleted.
- When performing a multi-step refactoring, debugging, or feature implementation in a git/jj repository.

## Instructions
1. After completing a logical unit of work (e.g., editing a file, implementing a function, or fixing a bug), verify that the changes are in the working copy `@`.
2. Add a description to the current changes using `jj describe -m "description of the step"`.
3. Create a new working copy commit using `jj new` to freeze the completed step and prepare for the next task.
4. If a correction is needed on the previous commit, use `jj squash` or `jj amend` to keep the history clean.

## Best Practices
- Write clear, descriptive commit messages for each increment.
- Ensure each commit is self-contained and compilation/tests pass if possible.

## Pushing and Pull Request Management
When sharing changes to GitHub or another remote:
1. **Determine PR Structure:**
   - For a single logical feature, create one bookmark on the top commit of your stack (e.g., `jj bookmark create feature-name -r @`).
   - For stacked Pull Requests, create distinct bookmarks on each commit in the chain.
2. **Push the Bookmark:**
   - Push the bookmark to origin using `jj git push --bookmark <bookmark-name>`.
3. **Clean Up After Merge:**
   - Once a PR is merged on the remote, run `jj git fetch` to sync remote changes.
   - Create a new working copy on top of the remote main branch (e.g., `jj new master@origin` or `jj new main@origin`).
   - Delete obsolete local bookmarks with `jj bookmark delete <bookmark-name>`.
   - Propagate the deletion of the bookmark to the remote by pushing the deleted bookmark: `jj git push --bookmark <bookmark-name>`.
