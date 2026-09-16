# Documentation guide

Audience: readers choosing a starting point and contributors editing documentation.

Start with the [project introduction](../README.md). You should not need to
know the project's other libraries, development history, or maintainer's
environment to understand it.

## Choose a document

| Document | Intended reader | What it provides |
|---|---|---|
| [Contributing to agni-rfb](../CONTRIBUTING.md) | New contributors with basic programming knowledge | Prepare, test, and submit a change |
| [agni-rfb](../README.md) | First-time visitors | What the project does, limitations, and where to start |
| [Rule references and pool data](../games/riftbound/rules/README.md) | Rule and test-data contributors | Reference provenance and machine-readable pool constraints |
| [How the Riftbound plugin is organized](architecture.md) | Developers new to the codebase | Responsibilities, vocabulary, and code navigation |
| [Developing agni-rfb](development.md) | Programmers new to the project | Install tools, build, test, and troubleshoot |

## Writing for the reader

Introductions explain the problem, capabilities, limitations, and next step.
They expand project-specific names before using them and do not double as
reference manuals.

Contributor guides assume basic programming and Git, not knowledge of this
codebase. Setup instructions name prerequisites, the working directory, the
command, the expected result, and common failures.

Subsystem references can assume the linked introductory material, but should
state that prerequisite. Explain why a boundary exists before listing internal
symbols. Distinguish implemented behavior from a proposal.

Specifications serve compatibility work: preserve precise contracts and
explicit status markers. A prose rewrite must not silently change a protocol.

Machine-readable fixtures are data even when their extension is Markdown.
Do not paraphrase or reflow data files as part of a documentation edit.
Keep credentials, personal paths, and internal deployment details out of
public examples. Use local or example addresses when showing configuration.
