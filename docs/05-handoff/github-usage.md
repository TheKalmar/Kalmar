# GitHub Repo Usage

## Main rule
This repository is the official collaboration space.

## Where things go
- Business/product context goes in docs/00-overview and docs/01-business
- Flow definitions go in docs/02-flows
- Screen definitions go in docs/03-screens
- Visual principles and design system go in docs/04-design
- Handoff assets and questions go in docs/05-handoff
- Structured machine-readable specs go in spec/
- UI implementation goes in apps/
- API/backend work goes in services/
- Shared components/contracts go in packages/

## Branch naming
- feature/...
- docs/...
- ux/...
- fix/...

## Pull request rule
Every PR should say:
- what changed
- why it changed
- which files must be reviewed

## Important repo discipline
1. No final design decisions only in chat or WhatsApp
2. No random docs in repo root
3. No unnamed exports or screenshots without context
4. Every major screen needs both docs and spec entries
5. Keep naming identical across docs, spec, and code

## Example mapping
- docs/03-screens/payment-page.md
- spec/screens/payment-page.yaml
- apps/payment-checkout/ (implementation)
