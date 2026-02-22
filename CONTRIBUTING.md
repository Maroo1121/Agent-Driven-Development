# Contributing to ADD Framework

Thank you for your interest in contributing to Agent-Driven Development.

ADD is an open methodology. It improves through real-world usage, honest feedback, and shared experience.

## How to Contribute

### Report Issues

If something in the methodology doesn't work in practice, open an issue. Include:

- What you tried (which artifact, which phase).
- What happened (unexpected result, confusion, friction).
- What you expected.
- Your context (solo dev, team, enterprise; which agent tools you use).

### Propose Changes

For changes to the methodology (cycle, artifacts, rules, maturity model):

1. Open a Discussion first. Explain the problem and your proposed solution.
2. If there's consensus, submit a PR with the changes.
3. Changes to the Manifesto or Non-Negotiable Rules require broader discussion.

### Add Examples

Real-world examples are extremely valuable. To contribute an example:

1. Follow the format in `/examples/01-simple-feature/`.
2. Include all artifacts from the cycle.
3. Be honest about failures — examples with Failure Reviews are more valuable than perfect first-pass examples.

### Improve Templates

If you've evolved a template for your domain, share it:

1. Submit it as a PR to `/templates/`.
2. Include a brief explanation of what you changed and why.
3. Domain-specific templates go in `/templates/domains/` (create the directory if needed).

### Translations

Translations are organized in `/docs/{language-code}/`. To add a translation:

1. Copy the `/docs/en/` directory to `/docs/{your-language}/`.
2. Translate all files.
3. Keep the same file structure and names.

## Guidelines

- **Be specific.** "This doesn't work" is not actionable. "AC-3 in the Constraint Sheet template is confusing because..." is.
- **Be honest.** If ADD added overhead without value in your case, say so. That's useful data.
- **Be constructive.** Propose alternatives, not just criticism.
- **Respect the core.** The Manifesto and Five Nevers are foundational. Propose changes to them only with strong evidence from practice.

## Code of Conduct

Be professional, be respectful, be helpful. This is an engineering community.

## License

All contributions are under the MIT license.
