// Example AGI tool plugin. Adjust parameters and execute() as needed.
// export default async ({ project, exec, fs }) => ({
//   name: "ripgrep",
//   description: "ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern. By default, ripgrep will respect gitignore rules and automatically skip hidden files/directories and binary files.",
//   parameters: {
//     text: { type: 'string', description: 'Text to echo' },
//     loud: { type: 'boolean', default: false }
//   },
//   async execute({ input }) {
//     const value = input.loud ? String(input.text).toUpperCase() : input.text;
//     return { project, value };
//   }
// });

export default async ({ project }) => ({
  name: "ripgrep",
  description:
    "Search the project with ripgrep (returns structured match info).",
  parameters: {
    query: {
      type: "string",
      description: "Regex pattern to search for",
    },
    path: {
      type: "string",
      default: ".",
      description:
        "Relative directory or file to search (defaults to project root)",
    },
    ignoreCase: {
      type: "boolean",
      default: false,
      description: "Toggle case-insensitive search (passes --ignore-case)",
    },
    glob: {
      type: "string",
      optional: true,
      description: "Optional glob passed to ripgrep via --glob",
    },
    maxCount: {
      type: "number",
      optional: true,
      description: "Stop after this many matches (passes --max-count)",
    },
  },

  async execute({ input, exec, projectRoot }) {
    const args = ["--json"];

    if (input.ignoreCase) args.push("--ignore-case");
    if (input.glob) args.push("--glob", String(input.glob));
    if (input.maxCount != null)
      args.push("--max-count", String(input.maxCount));

    const target = input.path ?? ".";
    args.push(String(input.query), String(target));

    const { stdout, exitCode } = await exec("rg", args, {
      cwd: projectRoot,
      allowNonZeroExit: true, // treat exit code 1 as “no matches”
    });

    if (exitCode !== 0 && exitCode !== 1) {
      throw new Error(`ripgrep failed with exit code ${exitCode}`);
    }

    const matches = [];
    for (const line of stdout.split(/\r?\n/)) {
      if (!line.trim()) continue;
      try {
        const event = JSON.parse(line);
        if (event.type === "match") {
          matches.push({
            file: event.data.path?.text ?? target,
            lineNumber: Number(event.data.line_number ?? 0),
            line: event.data.lines?.text ?? "",
          });
        }
      } catch (err) {
        if (process.env.AGI_DEBUG_TOOLS === "1") {
          console.error("ripgrep parse error:", err, line);
        }
      }
    }

    return {
      ok: exitCode === 0,
      project,
      query: input.query,
      path: target,
      count: matches.length,
      matches,
    };
  },
});
