# kalmar

QR-based payment platform repository.

## Purpose
This repository is structured so product, UI/UX, frontend, backend, and AI tools can work from the same source of truth.

## High-level folder map
- docs/ = human-readable product and UX documentation
- spec/ = AI-readable structured specs (YAML/JSON-style source of truth)
- apps/ = frontend applications
- services/ = backend services
- packages/ = shared code and contracts
- templates/ = standard templates for new flows/screens/specs
- scripts/ = automation helpers
- .github/ = GitHub workflows and collaboration rules

## Where each role works

### Product / You
- docs/00-overview
- docs/01-business
- docs/02-flows
- docs/05-handoff

### UI/UX
- docs/03-screens
- docs/04-design
- docs/05-handoff/figma-links.md
- docs/05-handoff/open-questions.md

### Frontend Dev
- apps/
- packages/shared-ui
- packages/shared-contracts
- spec/screens
- spec/ux

### Backend Dev
- services/api
- spec/api
- spec/entities
- spec/flows

## GitHub usage rules
1. main = stable branch
2. create feature branches like:
   - feature/qr-payment-flow
   - feature/payment-page-ui
   - feature/merchant-dashboard
3. never dump random files in repo root
4. one screen = one file in docs/03-screens and spec/screens
5. one flow = one file in docs/02-flows and spec/flows
6. if UI/UX changes a screen, update both:
   - docs/03-screens/...md
   - spec/screens/...yaml
7. add Figma links only in docs/05-handoff/figma-links.md
8. unresolved design/product questions go in docs/05-handoff/open-questions.md

## Recommended first workflow
1. Fill docs/00-overview/product-overview.md
2. Fill docs/01-business/personas.md
3. Fill docs/02-flows/*.md
4. Fill docs/03-screens/*.md
5. Share repo with UI/UX designer
6. UI/UX adds Figma links in docs/05-handoff/figma-links.md
7. Devs implement against spec/

## Commit naming examples
- docs: add qr payment flow
- ux: define payment page layout
- spec: add payment success screen spec
- feat: scaffold payment checkout app

## Branch protection suggestion
Protect main and require pull request review before merge.
