# CLAUDE.md

Guidelines and instructions for Claude Code when working on this repository.

## Gstack

This repository is equipped with **gstack**, a powerful suite of agentic skills.

> [!IMPORTANT]
> **Web Browsing Protocol:**
> Always use the `/browse` skill from gstack for all web browsing tasks.
> **NEVER** use the `mcp__claude-in-chrome__*` tools.

### Available Gstack Skills

The following skills are available for use in your workflow:

| Skill | Description / Command |
| :--- | :--- |
| `/office-hours` | Get help and consult on codebase issues |
| `/plan-ceo-review` | Design and strategy review from a CEO's perspective |
| `/plan-eng-review` | Engineering architecture and code review planning |
| `/plan-design-review` | Detailed UI/UX and product design review planning |
| `/design-consultation`| High-fidelity design consulting and feedback |
| `/design-shotgun` | Automated rapid UI design generations |
| `/design-html` | Generate beautiful HTML-based mockups and designs |
| `/review` | General architectural and quality review of changes |
| `/ship` | Prepare codebase for shipping/production |
| `/land-and-deploy` | Automate landing PRs and deploying them |
| `/canary` | Run canary testing and verification on active systems |
| `/benchmark` | Run performance and quality benchmarks |
| `/browse` | Multi-agent premium web browsing and research |
| `/connect-chrome` | Connect to an active local Chrome session for premium automation |
| `/qa` | Conduct high-quality end-to-end and integration QA |
| `/qa-only` | Run quick QA and test suites without deep analysis |
| `/design-review` | Review UI changes and component layouts |
| `/setup-browser-cookies`| Configure browser cookies for crawling and tests |
| `/setup-deploy` | Set up deployment targets and CD configuration |
| `/setup-gbrain` | Initialize and link the local GBrain context memory |
| `/retro` | Run retrospective reviews of recent phases and tasks |
| `/investigate` | Perform deep investigation of bugs and root causes |
| `/document-release` | Draft release notes, change logs, and documentation |
| `/codex` | Consult the internal codebase knowledge engine |
| `/cso` | Plan, optimize, and organize codebase structural tasks |
| `/autoplan` | Automatically decompose complex tasks into plans |
| `/plan-devex-review` | Developer experience review planning |
| `/devex-review` | Review and improve developer workflows and local configs |
| `/careful` | Safe and methodical modifications with double-checking |
| `/freeze` | Freeze state or locks during critical deployments |
| `/guard` | Set up protective pre-commit / pre-push guards |
| `/unfreeze` | Unfreeze state or locks after deployment completion |
| `/gstack-upgrade` | Easily upgrade all gstack skills to the latest version |
| `/learn` | Capture and document patterns for future learning |
