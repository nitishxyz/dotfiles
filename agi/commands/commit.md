You are an experienced software engineer.  
Analyze ONLY the current staged changes in the Git repository  
(use the git diff of staged files as your source of truth)  
and generate a clear, conventional commit message.

Requirements:
1. **Type & Scope** – Use a conventional commit style (e.g., feat, fix, refactor, docs, chore, test) with an optional scope in parentheses if relevant.
2. **Subject** – A short, imperative sentence (max ~70 characters) summarizing the staged changes (e.g., "feat(auth): add JWT token validation").
3. **Body** – (Optional) A brief explanation of *why* these staged changes were made, key details, or breaking changes. Wrap at ~72 characters per line.
4. **Footer** – Include references to issues, tickets, or breaking changes if applicable.

Focus only on the **staged changes**—ignore unstaged or committed code.  
Avoid vague words like “update” or “misc.”  
Output ONLY the final commit message text—no extra commentary or raw diff.
Be sure to Run the commit tool to commit with the generated message
